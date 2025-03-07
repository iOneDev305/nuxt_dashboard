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
                <SidebarGroupLabel class="mb-10 text-xl">LYHORNG</SidebarGroupLabel>
                <SidebarGroupContent>
                    <SidebarMenu>
                        <SidebarMenuItem v-for="item in items" :key="item.title">
                            <SidebarMenuButton asChild>
                                <nuxt-link :to="item.url" class="waves-effect">
                                    <component :is="item.icon" />
                                    <span :class="{ active: isActive(item.url) }">{{ item.title }}</span>
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
.active {
    color: rgb(0, 160, 234);
    /* Change text color to white for active item */
}

/* Optional: Change icon color for active item */
.active svg {
  fill: #ffffff; /* Change icon color to white */
}
</style>
