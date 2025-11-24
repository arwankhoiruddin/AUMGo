# Database AUMGo - SQL Schema

## Deskripsi

File `aumgo_database.sql` berisi struktur database lengkap untuk Sistem Informasi Amal Usaha Muhammadiyah (AUMGo) PCM Gombong, Jawa Tengah.

## Isi Database

Database ini mencakup 25 tabel untuk mengelola:

### 1. Struktur Organisasi
- **prm**: Pimpinan Ranting Muhammadiyah
- **pra**: Pimpinan Ranting Aisyiyah

### 2. Indikator Kinerja
- **kpi_ortom**: KPI Organisasi Otonom (IMM, IPM, Pemuda Muhammadiyah, dll)
- **kpi_majelis**: KPI Majelis (Tabligh, Pendidikan, Ekonomi, dll)

### 3. Amal Usaha Muhammadiyah (AUM)
- **amal_usaha**: Data utama AUM
- **masjid_musholla**: Detail khusus untuk masjid dan musholla
- **dokumen_legal**: Dokumen legal (SK, Sertifikat, IMB, dll)
- **inventaris_aset**: Inventaris aset (tanah, bangunan, kendaraan, dll)
- **struktur_organisasi_aum**: Struktur kepengurusan AUM
- **kepegawaian**: Data pegawai AUM

### 4. Pengajian dan Kegiatan
- **pengajian**: Data pengajian rutin
- **absensi_pengajian**: Absensi dan laporan pengajian

### 5. Administrasi Persuratan
- **surat_masuk**: Surat masuk dan disposisi
- **surat_keluar**: Surat keluar dan arsip

### 6. Tanah Wakaf
- **wakif**: Data pemberi wakaf
- **tanah_wakaf**: Data tanah wakaf dan legalitas

### 7. Keanggotaan
- **anggota_muhammadiyah**: Database anggota Muhammadiyah

### 8. Sistem dan Framework Laravel
- **users**: User untuk login dan akses sistem
- **password_reset_tokens**: Token reset password
- **sessions**: Session management
- **cache**: Cache sistem Laravel (untuk database caching)
- **cache_locks**: Lock mechanism untuk cache
- **jobs**: Queue jobs Laravel
- **job_batches**: Batch jobs Laravel
- **failed_jobs**: Log job yang gagal

## Cara Menggunakan

### 1. Menggunakan MySQL Command Line

```bash
# Login ke MySQL
mysql -u root -p

# Buat database baru
CREATE DATABASE aumgo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# Gunakan database
USE aumgo;

# Import file SQL
SOURCE /path/to/aumgo_database.sql;
```

### 2. Menggunakan phpMyAdmin

1. Buka phpMyAdmin
2. Buat database baru dengan nama `aumgo`
3. Pilih database `aumgo`
4. Klik tab "Import"
5. Pilih file `aumgo_database.sql`
6. Klik "Go" untuk import

### 3. Menggunakan Laravel Migration (Opsional)

Jika Anda ingin menggunakan Laravel, update file `.env`:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=aumgo
DB_USERNAME=root
DB_PASSWORD=your_password
```

Kemudian import SQL file secara manual atau buat migration dari schema yang ada.

## Data Sample

File SQL sudah termasuk data sample untuk:
- 2 PRM (Pimpinan Ranting Muhammadiyah)
- 3 KPI Ortom (IMM, IPM, Pemuda Muhammadiyah)
- 3 KPI Majelis (Tabligh, Pendidikan, Ekonomi)
- 1 User Administrator (email: admin@aumgo.com, password: password)

## Struktur Tabel

Setiap tabel memiliki:
- `id`: Primary key (auto increment)
- `created_at`: Timestamp pembuatan record
- `updated_at`: Timestamp update terakhir
- `deleted_at`: Timestamp soft delete (untuk beberapa tabel)

## Relasi Database

### Foreign Keys
- `masjid_musholla.amal_usaha_id` → `amal_usaha.id`
- `dokumen_legal.amal_usaha_id` → `amal_usaha.id`
- `inventaris_aset.amal_usaha_id` → `amal_usaha.id`
- `struktur_organisasi_aum.amal_usaha_id` → `amal_usaha.id`
- `kepegawaian.amal_usaha_id` → `amal_usaha.id`
- `pengajian.amal_usaha_id` → `amal_usaha.id`
- `absensi_pengajian.pengajian_id` → `pengajian.id`
- `tanah_wakaf.wakif_id` → `wakif.id`
- `anggota_muhammadiyah.prm_id` → `prm.id`
- `anggota_muhammadiyah.pra_id` → `pra.id`
- `users.anggota_id` → `anggota_muhammadiyah.id`

## Indexes

Semua tabel sudah dilengkapi dengan index untuk optimasi query:
- Primary keys
- Foreign keys
- Kolom yang sering digunakan untuk filtering (status, tanggal, kecamatan, dll)
- Unique constraints untuk nomor identitas

## Keamanan

### Password Default
User administrator default:
- Email: `admin@aumgo.com`
- Password: `password`

**PENTING**: Segera ganti password default setelah instalasi!

### Soft Deletes
Beberapa tabel menggunakan soft delete (`deleted_at`) untuk menjaga integritas data historis.

## Maintenance

### Backup Database
```bash
mysqldump -u root -p aumgo > backup_aumgo_$(date +%Y%m%d).sql
```

### Restore Database
```bash
mysql -u root -p aumgo < backup_aumgo_20241123.sql
```

## Troubleshooting

### Error: Access denied
Pastikan user MySQL memiliki privilege yang cukup:
```sql
GRANT ALL PRIVILEGES ON aumgo.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
```

### Error: Table already exists
Drop database dan buat ulang:
```sql
DROP DATABASE IF EXISTS aumgo;
CREATE DATABASE aumgo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

## Lisensi

Database ini dibuat untuk PCM Gombong, Jawa Tengah.

## Kontak

Untuk pertanyaan atau bantuan, hubungi tim pengembang AUMGo.
