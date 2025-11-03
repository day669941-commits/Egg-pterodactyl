#!/bin/bash
# =====================================
# Script: fix-react.sh
# Tujuan: Perbaiki error build frontend Pterodactyl
# OS: Debian 12 / Ubuntu 22
# =====================================

set -e

echo "🚀 Memulai perbaikan frontend Pterodactyl..."

cd /var/www/pterodactyl || { echo "❌ Folder /var/www/pterodactyl tidak ditemukan!"; exit 1; }

echo "🧹 Membersihkan cache & modul lama..."
rm -rf node_modules
rm -f yarn.lock package-lock.json
npm cache clean --force

echo "📦 Menginstal React 17 dan React-DOM..."
npm install react@17.0.2 react-dom@17.0.2 --save --legacy-peer-deps

echo "🔧 Menginstal semua dependensi lain..."
npm install --legacy-peer-deps

echo "🏗️ Membangun ulang panel (production build)..."
npm run build:production

echo ""
echo "✅ Selesai! Frontend berhasil diperbaiki & dibangun ulang."
echo "📁 Lokasi panel: /var/www/pterodactyl"
echo "💡 Jika ingin memperbarui tampilan, cukup jalankan: bash fix-react.sh"
