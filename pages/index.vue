<template>
    <div class="flex items-center justify-center min-h-screen bg-gray-100 p-6">
        <div class="w-full max-w-6xl bg-white rounded-xl shadow-lg p-6">
            <!-- Title & Toolbar -->
            <div class="flex justify-between items-center border-b pb-4 mb-4">
                <h2 class="text-2xl font-semibold">Grade List</h2>
                <div class="flex gap-2">
                    <button class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">
                        + New
                    </button>
                    <button class="bg-gray-300 text-gray-700 px-4 py-2 rounded-md hover:bg-gray-400">
                        ⬇ Export
                    </button>
                    <button class="bg-gray-300 text-gray-700 px-4 py-2 rounded-md hover:bg-gray-400">
                        🔄 Refresh
                    </button>
                </div>
            </div>

            <!-- Search & Filter -->
            <div class="flex justify-between items-center mb-4">
                <input type="text" placeholder="Search..." class="border p-2 rounded-md w-1/3" v-model="searchText" />
                <div class="flex gap-2">
                    <button class="bg-green-500 text-white px-4 py-2 rounded-md hover:bg-green-600">
                        Filter
                    </button>
                    <button class="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-600">
                        Reset
                    </button>
                </div>
            </div>

            <!-- Table -->
            <div class="overflow-x-auto">
                <table class="w-full border-collapse">
                    <thead>
                        <tr class="bg-gray-200 text-gray-700">
                            <th class="p-3 text-left">ID</th>
                            <th class="p-3 text-left">Service Grade</th>
                            <th class="p-3 text-left">Created Date</th>
                            <th class="p-3 text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(item, index) in filteredData" :key="index" class="border-b hover:bg-gray-100">
                            <td class="p-3">{{ item.id }}</td>
                            <td class="p-3">{{ item.service_grade }}</td>
                            <td class="p-3">{{ item.created_at }}</td>
                            <td class="p-3 text-center">
                                <button class="bg-yellow-500 text-white px-3 py-1 rounded-md hover:bg-yellow-600">
                                    ✏ Edit
                                </button>
                                <button class="bg-red-500 text-white px-3 py-1 rounded-md hover:bg-red-600 ml-2">
                                    🗑 Delete
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="flex justify-between items-center mt-4">
                <p>Showing {{ filteredData.length }} results</p>
                <div class="flex gap-2">
                    <button class="px-3 py-1 border rounded-md" @click="prevPage" :disabled="currentPage === 1">
                        ◀ Prev
                    </button>
                    <span>Page {{ currentPage }}</span>
                    <button class="px-3 py-1 border rounded-md" @click="nextPage" :disabled="currentPage >= totalPages">
                        Next ▶
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, computed } from "vue";

// Static Data
const tableData = ref([
    { id: 1, service_grade: "A", created_at: "2024-03-01" },
    { id: 2, service_grade: "B", created_at: "2024-02-15" },
    { id: 3, service_grade: "C", created_at: "2024-01-10" },
    { id: 4, service_grade: "D", created_at: "2023-12-05" },
]);

// Search Feature
const searchText = ref("");

const filteredData = computed(() => {
    return tableData.value.filter((item) =>
        item.service_grade.toLowerCase().includes(searchText.value.toLowerCase())
    );
});

// Pagination
const currentPage = ref(1);
const itemsPerPage = 3;
const totalPages = computed(() => Math.ceil(tableData.value.length / itemsPerPage));

const prevPage = () => {
    if (currentPage.value > 1) currentPage.value--;
};

const nextPage = () => {
    if (currentPage.value < totalPages.value) currentPage.value++;
};
</script>