import { defineConfig } from 'vite';
import vue from '@vitejs/plugin-vue';
import { resolve } from 'path';

export default defineConfig({
  plugins: [vue()],
  
  root: resolve(__dirname, 'Client/renderer'),
  
  resolve: {
    alias: {
      '@': resolve(__dirname, 'Client/renderer/src'),
      '@shared': resolve(__dirname, 'Client/shared'),
      '@services': resolve(__dirname, 'Client/services')
    }
  },
  
  build: {
    outDir: resolve(__dirname, 'dist/renderer'),
    emptyOutDir: true,
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'Client/renderer/index.html')
      }
    }
  },
  
  server: {
    port: 3000,
    strictPort: true
  },
  
  optimizeDeps: {
    exclude: ['electron']
  }
});
