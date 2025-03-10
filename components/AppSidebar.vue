<script setup lang="ts">
import { Calendar, Home, Inbox, Search, Settings } from "lucide-vue-next";
import { ref } from 'vue';
import { useRoute } from 'vue-router';  // Import useRoute to access the current route

// Menu items with routing
const items = [
    {
        title: "Dashboard",
        url: "/dashboard",
        icon: Home,
    },
    {
        title: "Components",
        url: "/component",
        icon: Inbox,
    },
    {
        title: "Calendar",
        url: "/login",
        icon: Calendar,
    },
    {
        title: "Search",
        url: "/search",
        icon: Search,
    },
    {
        title: "Settings",
        url: "/settings",
        icon: Settings,
    },
];

// Reactive variable to check active route
const route = useRoute();

// Function to check if a route is active
const isActive = (path: string) => {
    return route.path === path;
};
</script>

<template>
    <Sidebar>
        <SidebarContent>
            <SidebarGroup>
                <SidebarGroupLabel class="mb-10 text-xl font-bold text-gray-800">MY APP</SidebarGroupLabel>
                <SidebarGroupContent>
                    <SidebarMenu>
                        <SidebarMenuItem v-for="item in items" :key="item.title">
                            <SidebarMenuButton asChild>
                                <nuxt-link :to="item.url" class="waves-effect flex items-center py-2">
                                    <component :is="item.icon" class="mr-4" />
                                    <span :class="{ active: isActive(item.url) }" class="menu-item-text">{{ item.title
                                    }}</span>
                                </nuxt-link>
                            </SidebarMenuButton>
                        </SidebarMenuItem>
                    </SidebarMenu>
                </SidebarGroupContent>
            </SidebarGroup>

        </SidebarContent>

        <SidebarFooter>
            <!-- Avatar at the bottom -->
            <div class="mt-auto p-4 flex items-center justify-between bg-gray-100">
                <Avatar>
                    <AvatarImage src="https://github.com/unovue.png" alt="@unovue" />
                    <AvatarFallback>CN</AvatarFallback>
                </Avatar>
            </div>
        </SidebarFooter>
    </Sidebar>
</template>

<style scoped>
.menu-item-text {
    font-size: 16px;
    font-weight: 500;
    letter-spacing: 0.5px;
    color: #333;
    transition: color 0.3s ease;
}

.menu-item-text:hover {
    color: #00A0EA;
}

.active {
    color: rgb(0, 160, 234);
    font-weight: 600;
}

.active svg {
    fill: rgb(0, 160, 234);
}

.activity-section {
    margin-top: auto;
    padding: 16px;
    background-color: #f5f5f5;
}
</style>
