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
        title: "Blank",
        url: "/blank",
        icon: Inbox,
    },
    {
        title: "Calendar",
        url: "/calendar",
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
                <SidebarGroupLabel class="mb-10 text-xl font-bold text-gray-800">LYHORNG</SidebarGroupLabel>
                <SidebarGroupContent>
                    <SidebarMenu>
                        <SidebarMenuItem v-for="item in items" :key="item.title">
                            <SidebarMenuButton asChild>
                                <nuxt-link :to="item.url" class="waves-effect flex items-center py-2">
                                    <component :is="item.icon" class="mr-4" />
                                    <span :class="{ active: isActive(item.url) }" class="menu-item-text">{{ item.title }}</span>
                                </nuxt-link>
                            </SidebarMenuButton>
                        </SidebarMenuItem>
                    </SidebarMenu>
                </SidebarGroupContent>
            </SidebarGroup>
        </SidebarContent>
    </Sidebar>
</template>

<style scoped>
/* Style for the menu item text */
.menu-item-text {
    font-size: 16px;  /* Set a comfortable font size */
    font-weight: 500; /* Set a medium weight for text */
    letter-spacing: 0.5px; /* Add slight letter spacing */
    color: #333;  /* Default color */
    transition: color 0.3s ease; /* Smooth color transition on hover */
}

.menu-item-text:hover {
    color: #00A0EA; /* Change color on hover */
}

/* Active menu item styling */
.active {
    color: rgb(0, 160, 234); /* Active item color */
    font-weight: 600; /* Make font bold for active item */
}

/* Optional: Change icon color for active item */
.active svg {
  fill: rgb(0, 160, 234); /* Change icon color to match active item */
}
</style>
