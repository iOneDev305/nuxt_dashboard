<script setup>
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar";
import AppSidebar from "@/components/AppSidebar.vue";
import Menubar from "~/components/Menubar.vue";
</script>

<template>
  <SidebarProvider>
    <AppSidebar />
    <main class="flex flex-col">
      <div class="flex items-center gap-2 p-2">
        <SidebarTrigger />
        <Menubar />
      </div>
      <slot />
    </main>
  </SidebarProvider>
</template>
