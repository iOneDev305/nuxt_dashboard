<script setup lang="ts">
import { ref, computed } from 'vue'
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'

// Static Data
const tableData = ref([
    { id: 1, service_grade: "A", created_at: "2024-03-01" },
    { id: 2, service_grade: "B", created_at: "2024-02-15" },
    { id: 3, service_grade: "C", created_at: "2024-01-10" },
    { id: 4, service_grade: "D", created_at: "2023-12-05" },
])

// Search Feature
const searchText = ref("")

const filteredData = computed(() => {
    return tableData.value.filter((item) =>
        item.service_grade.toLowerCase().includes(searchText.value.toLowerCase())
    )
})

// Pagination
const currentPage = ref(1)
const itemsPerPage = 3
const totalPages = computed(() => Math.ceil(tableData.value.length / itemsPerPage))

const prevPage = () => {
    if (currentPage.value > 1) currentPage.value--
}

const nextPage = () => {
    if (currentPage.value < totalPages.value) currentPage.value++
}
</script>

<template>
    <div>
        <!-- Title & Toolbar -->
        <div class="flex justify-between items-center border-b pb-4 mb-4">
            <h2 class="text-2xl font-semibold">Grade List</h2>
            <div class="flex gap-2">
                <Button variant="default">+ New</Button>
                <Button variant="secondary">
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M12 19l-7-7h4V3h6v9h4l-7 7z" />
                    </svg>
                    Export
                </Button>
                <Button variant="secondary">
                    <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4 4v5h5m11-1V4m0 0l-3 3m3-3l3 3M4 20v-5h5m11 1v5m0 0l-3-3m3 3l-3-3" />
                    </svg>
                    Refresh
                </Button>
            </div>
        </div>

        <!-- Search & Filter -->
        <div class="flex justify-between items-center mb-4">
            <Input v-model="searchText" placeholder="Search..." class="w-1/3" />
            <div class="flex gap-2">
                <Button variant="success">Filter</Button>
                <Button variant="destructive">Reset</Button>
            </div>
        </div>

        <!-- Table -->
        <Table>
            <TableHeader>
                <TableRow>
                    <TableHead>ID</TableHead>
                    <TableHead>Service Grade</TableHead>
                    <TableHead>Created Date</TableHead>
                    <TableHead class="text-center">Action</TableHead>
                </TableRow>
            </TableHeader>
            <TableBody>
                <TableRow v-for="(item, index) in filteredData" :key="index">
                    <TableCell>{{ item.id }}</TableCell>
                    <TableCell>{{ item.service_grade }}</TableCell>
                    <TableCell>{{ item.created_at }}</TableCell>
                    <TableCell class="text-center">
                        <Button  size="sm" class="mr-2">
                            ✏ Edit
                        </Button>
                        <Button variant="destructive" size="sm">
                            🗑 Delete
                        </Button>
                    </TableCell>
                </TableRow>
            </TableBody>
        </Table>

        <!-- Pagination -->
        <div class="flex justify-between items-center mt-4">
            <p>Showing {{ filteredData.length }} results</p>
            <div class="flex gap-2 items-center">
                <Button variant="outline" :disabled="currentPage === 1" @click="prevPage">
                    ◀ Prev
                </Button>
                <span>Page {{ currentPage }}</span>
                <Button variant="outline" :disabled="currentPage >= totalPages" @click="nextPage">
                    Next ▶
                </Button>
            </div>
        </div>
    </div>
</template>