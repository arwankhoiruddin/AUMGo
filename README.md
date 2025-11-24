# AUMGo - Sistem Informasi Amal Usaha Muhammadiyah

Sistem Informasi Amal Usaha Muhammadiyah (AUMGo) adalah aplikasi untuk mengelola data dan informasi amal usaha Muhammadiyah di Pimpinan Cabang Muhammadiyah (PCM) Gombong, Jawa Tengah.

> **⚠️ PENTING**: Setelah clone repository, pastikan menjalankan `npm install && npm run build` agar tampilan AdminLTE berfungsi dengan benar!
> 
> 📖 **Panduan Lengkap**: Lihat [QUICK_START.md](QUICK_START.md) untuk langkah-langkah instalasi detail dan troubleshooting.

## Deskripsi

Repository ini dibangun untuk mengembangkan sistem informasi yang komprehensif dalam mengelola berbagai aspek amal usaha Muhammadiyah, mulai dari data anggota, aset, hingga kegiatan organisasi di wilayah Gombong, Jawa Tengah.

## Data dan Modul Sistem

Sistem ini dirancang untuk mengelola berbagai jenis data berikut:

### 1. Data PRM dan PRA
- **PRM (Pimpinan Ranting Muhammadiyah)**: Data struktur organisasi di tingkat ranting
- **PRA (Pimpinan Ranting Aisyiyah)**: Data struktur organisasi Aisyiyah di tingkat ranting
- Informasi kepengurusan dan kontak
- Wilayah kerja dan area geografis

### 2. KPI Ortom (Organisasi Otonom)
- Indikator kinerja untuk berbagai organisasi otonom Muhammadiyah
- Monitoring dan evaluasi kinerja organisasi
- Target dan pencapaian kegiatan
- Laporan berkala organisasi otonom

### 3. KPI Majelis
- Indikator kinerja untuk berbagai majelis (Tabligh, Pendidikan, Ekonomi, dll)
- Monitoring program kerja majelis
- Target dan realisasi kegiatan majelis
- Evaluasi kinerja majelis

### 4. Data AUM (Amal Usaha Muhammadiyah)
Data lengkap mengenai amal usaha yang dikelola, meliputi:
- **Data Masjid dan Musholla**: Lokasi, kapasitas, jadwal kegiatan
- **Dokumen Legal**:
  - SK (Surat Keputusan) Berdiri
  - Sertifikat Tanah dan luas tanah
  - IMB (Izin Mendirikan Bangunan)
- **Inventaris Aset**:
  - Data gedung dan bangunan
  - Kendaraan operasional
  - Fasilitas dan perlengkapan
  - Peralatan dan inventaris lainnya
- **Struktur Organisasi**:
  - Data pimpinan/pengurus AUM
  - Struktur kepengurusan
  - Masa jabatan dan periode kepengurusan
- **Data Kepegawaian**:
  - Informasi pegawai
  - Tahun masuk dan status kepegawaian
  - Data pensiun dan mutasi
  - Riwayat pekerjaan

### 5. Absensi Pengajian
- Sistem pencatatan kehadiran pengajian rutin
- Jadwal pengajian
- Data peserta pengajian
- Rekap kehadiran dan statistik
- Materi dan ustadz/pemateri

### 6. SIM Surat Masuk dan Keluar
Sistem Informasi Manajemen untuk administrasi persuratan:
- **Surat Masuk**:
  - Pencatatan dan penomoran surat masuk
  - Disposisi dan tracking surat
  - Arsip digital surat masuk
- **Surat Keluar**:
  - Pembuatan dan penomoran surat keluar
  - Tracking surat keluar
  - Arsip digital surat keluar
- Manajemen template surat
- Laporan statistik persuratan

### 7. Tanah Wakaf
- Data tanah wakaf yang dikelola PCM Gombong
- Informasi sertifikat dan legalitas tanah wakaf
- Luas dan lokasi tanah wakaf
- Data wakif (pemberi wakaf)
- Status pemanfaatan tanah wakaf
- Dokumen pendukung dan administrasi

### 8. Data Anggota Muhammadiyah
- Database anggota Muhammadiyah di wilayah Gombong
- Informasi pribadi dan kontak anggota
- Status keanggotaan (aktif/non-aktif)
- Riwayat keanggotaan
- Kategorisasi anggota (NBM, kartu anggota)
- Data kontribusi dan partisipasi anggota

## Teknologi

- **Framework**: Laravel 12
- **Database**: MySQL/MariaDB
- **Frontend**: AdminLTE (planned)
- **PHP Version**: 8.2+

## Database

Database lengkap telah dibuat dalam file SQL tunggal. Untuk informasi lebih lanjut:

- **File Database**: `database/sql/aumgo_database.sql`
- **Dokumentasi Database**: `database/sql/README.md`
- **ERD dan Relasi**: `database/sql/ERD_DESCRIPTION.md`

### Struktur Database

Database terdiri dari 25 tabel:

1. `prm` - Pimpinan Ranting Muhammadiyah
2. `pra` - Pimpinan Ranting Aisyiyah
3. `kpi_ortom` - KPI Organisasi Otonom
4. `kpi_majelis` - KPI Majelis
5. `amal_usaha` - Data AUM
6. `masjid_musholla` - Detail Masjid dan Musholla
7. `dokumen_legal` - Dokumen Legal AUM
8. `inventaris_aset` - Inventaris Aset AUM
9. `struktur_organisasi_aum` - Struktur Organisasi AUM
10. `kepegawaian` - Data Kepegawaian
11. `pengajian` - Data Pengajian
12. `absensi_pengajian` - Absensi Pengajian
13. `surat_masuk` - Surat Masuk
14. `surat_keluar` - Surat Keluar
15. `wakif` - Data Wakif
16. `tanah_wakaf` - Data Tanah Wakaf
17. `anggota_muhammadiyah` - Data Anggota
18. `users` - User System
19. `password_reset_tokens` - Password Reset
20. `sessions` - Session Management
21. `cache` - Cache System (Laravel)
22. `cache_locks` - Cache Locks (Laravel)
23. `jobs` - Queue Jobs (Laravel)
24. `job_batches` - Job Batches (Laravel)
25. `failed_jobs` - Failed Jobs (Laravel)

## Instalasi

### Requirements

- PHP >= 8.2
- Composer
- Node.js >= 18.x and npm
- MySQL/MariaDB
- Web Server (Apache/Nginx)

### Langkah Instalasi

1. Clone repository:
```bash
git clone https://github.com/arwankhoiruddin/AUMGo.git
cd AUMGo
```

2. Install PHP dependencies:
```bash
composer install
```

3. Install Node.js dependencies and build frontend assets:
```bash
npm install
npm run build
```

   **PENTING**: Langkah ini wajib dilakukan! Tanpa build, AdminLTE tidak akan tampil dengan benar dan halaman akan terlihat tanpa styling.

4. Copy environment file:
```bash
cp .env.example .env
```

5. Generate application key:
```bash
php artisan key:generate
```

6. Konfigurasi database di file `.env`:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=aumgo
DB_USERNAME=root
DB_PASSWORD=your_password
```

7. Buat database dan import SQL file:
```bash
mysql -u root -p
CREATE DATABASE aumgo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE aumgo;
SOURCE database/sql/aumgo_database.sql;
exit;
```

8. Jalankan aplikasi:
```bash
php artisan serve
```

Aplikasi akan berjalan di `http://localhost:8000`

### Login Default

- Email: `admin@aumgo.com`
- Password: `password`

**PENTING**: Segera ganti password default setelah login pertama kali!

## Development

### Running Tests
```bash
php artisan test
```

### Code Style
```bash
./vendor/bin/pint
```

### Database Backup
```bash
mysqldump -u root -p aumgo > backup_aumgo_$(date +%Y%m%d).sql
```

## Troubleshooting

### Halaman Tampil Tanpa Styling (AdminLTE Tidak Muncul)

**Gejala**: Halaman web tampil tanpa CSS, menu sidebar dan navbar tidak terformat dengan benar.

**Penyebab**: Frontend assets (CSS dan JavaScript) belum di-compile.

**Solusi**:
```bash
npm install
npm run build
```

Setelah itu restart development server:
```bash
php artisan serve
```

### Error "Vite manifest not found"

**Penyebab**: File manifest.json di `public/build/` tidak ada karena assets belum di-build.

**Solusi**: Jalankan `npm run build` untuk generate assets.

### Perubahan CSS/JS Tidak Muncul

Jika melakukan perubahan pada file CSS atau JS, jalankan kembali:
```bash
npm run build
```

Untuk development dengan auto-reload, gunakan:
```bash
npm run dev
```

## Kontribusi

Kontribusi selalu diterima! Silakan fork repository ini dan submit pull request.

## Lisensi

Proyek ini dikembangkan untuk PCM Gombong, Jawa Tengah.

## Kontak

Untuk pertanyaan atau bantuan, silakan hubungi tim pengembang AUMGo.
