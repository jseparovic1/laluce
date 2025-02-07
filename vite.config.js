import { defineConfig } from 'vite'

export default defineConfig({
  base: '/laluce.github.io/',
  server: {
    port: 3000,
    open: true, // automatically open browser
    host: true  // expose to local network
  },
  build: {
    outDir: 'dist',
    minify: 'terser',
    cssMinify: true
  },
  css: {
    devSourcemap: true, // enable CSS source maps
  },
  optimizeDeps: {
    include: [] // add any dependencies that need to be pre-bundled
  }
}) 