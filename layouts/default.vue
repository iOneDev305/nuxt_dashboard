<script setup>
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar";
import AppSidebar from "@/components/AppSidebar.vue";
import Menubar from "~/components/Menubar.vue";
</script>

<template>
  <SidebarProvider>
    <div class="flex h-screen w-screen overflow-hidden">
      <!-- Sidebar -->
      <AppSidebar />

      <!-- Main Content -->
      <main class="flex flex-col flex-grow bg-gray-100">
        <!-- Top Bar -->
        <div class="flex items-center gap-2 p-4 bg-white shadow-md">
          <SidebarTrigger />
          <Menubar />
        </div>

        <!-- Page Content -->
        <div class="flex-grow p-6 overflow-auto">
          <slot />
        </div>
      </main>
    </div>
  </SidebarProvider>
</template>
