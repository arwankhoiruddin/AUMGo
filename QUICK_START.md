# Quick Start Guide - AUMGo

Panduan cepat untuk menjalankan aplikasi AUMGo di komputer lokal Anda.

## ⚠️ PENTING: Pastikan Semua Langkah Dijalankan!

Aplikasi ini menggunakan **AdminLTE v4** untuk tampilan. Jika Anda melewatkan langkah build (npm), halaman akan tampil **tanpa styling** (hanya teks putih tanpa format).

---

## Prerequisites (Aplikasi yang Harus Diinstal)

Pastikan komputer Anda sudah memiliki:

- ✅ PHP 8.2 atau lebih tinggi
- ✅ Composer (PHP package manager)
- ✅ Node.js 18.x atau lebih tinggi
- ✅ npm (biasanya sudah include dengan Node.js)
- ✅ MySQL atau MariaDB
- ✅ Git

### Cek Versi yang Terinstal

```bash
php --version
composer --version
node --version
npm --version
mysql --version
```

---

## Langkah Instalasi

### 1. Clone Repository

```bash
git clone https://github.com/arwankhoiruddin/AUMGo.git
cd AUMGo
```

### 2. Install PHP Dependencies

```bash
composer install
```

⏱️ Proses ini memakan waktu beberapa menit.

### 3. 🔴 WAJIB: Build Frontend Assets (AdminLTE)

```bash
npm install
npm run build
```

**⚠️ JANGAN SKIP LANGKAH INI!** Tanpa langkah ini:
- AdminLTE tidak akan tampil
- Halaman hanya akan menampilkan teks tanpa styling
- Menu sidebar tidak akan terformat dengan benar

⏱️ Proses ini memakan waktu 1-2 menit.

### 4. Setup Environment

```bash
cp .env.example .env
php artisan key:generate
```

### 5. Konfigurasi Database

Edit file `.env` dan sesuaikan dengan database Anda:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=aumgo
DB_USERNAME=root
DB_PASSWORD=password_anda
```

### 6. Buat Database dan Import Data

Buka MySQL/MariaDB:

```bash
mysql -u root -p
```

Jalankan perintah SQL berikut:

```sql
CREATE DATABASE aumgo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE aumgo;
SOURCE database/sql/aumgo_database.sql;
exit;
```

### 7. Jalankan Aplikasi

```bash
php artisan serve
```

Aplikasi akan berjalan di: **http://localhost:8000**

### 8. Login

Gunakan kredensial default:

- **Email**: `admin@aumgo.com`
- **Password**: `password`

⚠️ **SEGERA GANTI PASSWORD** setelah login pertama kali!

---

## Troubleshooting

### ❌ Problem: Halaman Tampil Tanpa Styling

**Gejala**: 
- Halaman hanya menampilkan teks putih
- Tidak ada warna, tidak ada sidebar AdminLTE
- Terlihat seperti HTML biasa tanpa CSS

**Penyebab**: Assets AdminLTE belum di-build

**Solusi**:
```bash
npm install
npm run build
```

Kemudian restart server:
```bash
# Tekan Ctrl+C untuk stop server yang sedang berjalan
php artisan serve
```

### ❌ Problem: Error "Vite manifest not found"

**Penyebab**: File `public/build/manifest.json` tidak ada

**Solusi**:
```bash
npm run build
```

### ❌ Problem: Perubahan CSS/JS Tidak Muncul

Setiap kali mengubah file CSS atau JavaScript, build ulang:

```bash
npm run build
```

**Tips untuk Development**: Gunakan mode dev untuk auto-reload:
```bash
npm run dev
```

Biarkan perintah ini tetap berjalan di terminal terpisah saat Anda melakukan development.

---

## Mode Development

Untuk development dengan hot reload (perubahan langsung terlihat):

**Terminal 1** - Jalankan Vite:
```bash
npm run dev
```

**Terminal 2** - Jalankan Laravel:
```bash
php artisan serve
```

Buka browser di: http://localhost:8000

---

## Struktur Direktori Penting

```
AUMGo/
├── app/                          # Kode aplikasi PHP/Laravel
│   ├── Http/Controllers/         # Controllers
│   └── Models/                   # Models
├── resources/
│   ├── views/                    # Blade templates
│   │   └── layouts/
│   │       └── admin.blade.php   # Layout AdminLTE
│   ├── js/                       # JavaScript files
│   │   └── app.js                # Main JS file (imports AdminLTE)
│   └── sass/                     # SCSS files
│       └── app.scss              # Main SCSS file (imports AdminLTE CSS)
├── public/
│   └── build/                    # 🔴 GENERATED (gitignored)
│       ├── manifest.json         # Vite manifest
│       └── assets/               # Compiled CSS & JS
├── database/
│   └── sql/
│       └── aumgo_database.sql    # Database lengkap
├── .env                          # Environment config (create dari .env.example)
└── package.json                  # Node dependencies (includes admin-lte)
```

---

## Verifikasi Instalasi Berhasil

Setelah menjalankan semua langkah, Anda harus melihat:

✅ Dashboard dengan sidebar berwarna gelap
✅ Navbar di bagian atas
✅ Menu navigasi (PRM & PRA, KPI, Amal Usaha, dll)
✅ Info boxes berwarna (biru, merah, hijau, kuning)
✅ Card dengan styling yang rapi
✅ Footer dengan copyright PCM Gombong

Jika Anda **TIDAK** melihat hal-hal di atas, kemungkinan besar Anda melewatkan langkah `npm run build`.

---

## Bantuan Lebih Lanjut

Jika mengalami kendala:

1. Pastikan semua prerequisites terinstal dengan benar
2. Cek versi PHP, Node.js, dan Composer
3. Pastikan sudah menjalankan `npm run build`
4. Cek log error di terminal
5. Buka browser console (F12) untuk melihat error JavaScript

---

## Referensi

- Laravel Documentation: https://laravel.com/docs/12.x
- AdminLTE Documentation: https://adminlte.io/docs/4.0/
- Vite Documentation: https://vite.dev/

---

**Dibuat untuk PCM Gombong, Jawa Tengah**
