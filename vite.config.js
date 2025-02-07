import { defineConfig } from 'vite'

export default defineConfig({
  base: '/laluce/',
  server: {
    port: 3000,
    open: true, // automatically open browser
    host: true  // expose to local network
  },
  build: {
    outDir: 'dist',
    minify: 'terser',
    cssMinify: true,
    rollupOptions: {
      output: {
        assetFileNames: (assetInfo) => {
          let extType = assetInfo.name.split('.')[1]
          if (/png|jpe?g|svg|gif|tiff|bmp|ico/i.test(extType)) {
            extType = 'img'
          }
          return `assets/${extType}/[name]-[hash][extname]`
        },
        chunkFileNames: 'assets/js/[name]-[hash].js',
        entryFileNames: 'assets/js/[name]-[hash].js',
      },
    },
  },
  css: {
    devSourcemap: true, // enable CSS source maps
  },
  optimizeDeps: {
    include: [] // add any dependencies that need to be pre-bundled
  }
}) 