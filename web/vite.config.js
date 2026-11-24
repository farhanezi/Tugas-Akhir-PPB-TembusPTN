import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';
import { VitePWA } from 'vite-plugin-pwa';

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
    // PWA: bisa dipasang ke layar utama, dan kerangka aplikasi tetap terbuka saat luring.
    // Data (API dan Supabase) sengaja tidak disimpan di cache: selalu diambil dari jaringan.
    VitePWA({
      registerType: 'autoUpdate',
      includeAssets: ['ikon.svg', 'apple-touch-icon.png'],
      manifest: {
        name: 'TembusPTN',
        short_name: 'TembusPTN',
        description: 'Materi, latihan soal, dan try out UTBK-SNBT dalam satu tempat.',
        lang: 'id',
        start_url: '/',
        scope: '/',
        display: 'standalone',
        orientation: 'portrait',
        background_color: '#F3F6F2',
        theme_color: '#0B5D3B',
        icons: [
          { src: 'pwa-192.png', sizes: '192x192', type: 'image/png' },
          { src: 'pwa-512.png', sizes: '512x512', type: 'image/png' },
          { src: 'pwa-maskable-512.png', sizes: '512x512', type: 'image/png', purpose: 'maskable' },
        ],
      },
      workbox: {
        globPatterns: ['**/*.{js,css,html,svg,png,woff2}'],
        navigateFallback: '/index.html',
      },
    }),
  ],
  server: { port: 5173, strictPort: true }, // API lokal hanya mengizinkan asal http://localhost:5173
});
