# Entity Relationship Diagram (ERD) - AUMGo Database

## Overview

Database AUMGo terdiri dari 20 tabel yang saling berelasi untuk mengelola data Amal Usaha Muhammadiyah di PCM Gombong, Jawa Tengah.

## Diagram Relasi

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         STRUKTUR ORGANISASI                              │
├──────────────┬──────────────┬──────────────┬───────────────────────────┤
│    PRM       │     PRA      │  KPI_ORTOM   │     KPI_MAJELIS           │
│              │              │              │                           │
│ - id         │ - id         │ - id         │ - id                      │
│ - nama       │ - nama       │ - nama_ortom │ - nama_majelis            │
│ - alamat     │ - alamat     │ - periode    │ - periode                 │
│ - ketua      │ - ketua      │ - indikator  │ - program_kerja           │
│ - status     │ - status     │ - target     │ - target                  │
└──────┬───────┴──────┬───────┴──────────────┴───────────────────────────┘
       │              │
       │              │
       ▼              ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                      ANGGOTA MUHAMMADIYAH                                │
│  - id                                                                    │
│  - nbm (Nomor Buku Muhammadiyah)                                        │
│  - nama_lengkap                                                         │
│  - prm_id (FK → prm.id)                                                 │
│  - pra_id (FK → pra.id)                                                 │
│  - status_keanggotaan                                                   │
└────────────────────────┬────────────────────────────────────────────────┘
                         │
                         ▼
                  ┌─────────────┐
                  │    USERS    │
                  │  - id       │
                  │  - email    │
                  │  - role     │
                  │  - anggota_id (FK)
                  └─────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│                       AMAL USAHA MUHAMMADIYAH                            │
│                                                                          │
│  ┌──────────────────────┐                                               │
│  │   AMAL_USAHA         │                                               │
│  │  - id                │                                               │
│  │  - nama_aum          │                                               │
│  │  - jenis_aum         │                                               │
│  │  - alamat            │                                               │
│  │  - status            │                                               │
│  └────────┬─────────────┘                                               │
│           │                                                              │
│     ┌─────┴──────┬───────────┬─────────────┬──────────────┬────────┐  │
│     ▼            ▼           ▼             ▼              ▼        ▼  │
│  ┌────────┐  ┌─────────┐ ┌──────────┐ ┌──────────┐ ┌────────┐ ┌────┐│
│  │MASJID  │  │DOKUMEN  │ │INVENTARIS│ │STRUKTUR  │ │KEPEGA  │ │PENG││
│  │MUSHOLLA│  │LEGAL    │ │ASET      │ │ORGANISASI│ │WAIAN   │ │AJIA││
│  │        │  │         │ │          │ │AUM       │ │        │ │N   ││
│  │- id    │  │- id     │ │- id      │ │- id      │ │- id    │ │    ││
│  │- aum_id│  │- aum_id │ │- aum_id  │ │- aum_id  │ │- aum_id│ │    ││
│  │(FK)    │  │(FK)     │ │(FK)      │ │(FK)      │ │(FK)    │ │    ││
│  └────────┘  └─────────┘ └──────────┘ └──────────┘ └────────┘ └──┬─┘│
└───────────────────────────────────────────────────────────────────┼───┘
                                                                    │
                                                                    ▼
                                                            ┌───────────────┐
                                                            │  ABSENSI      │
                                                            │  PENGAJIAN    │
                                                            │  - id         │
                                                            │  - pengajian_id
                                                            │    (FK)       │
                                                            └───────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│                         ADMINISTRASI PERSURATAN                          │
├─────────────────────────────────┬───────────────────────────────────────┤
│       SURAT_MASUK               │         SURAT_KELUAR                  │
│  - id                           │    - id                               │
│  - nomor_agenda                 │    - nomor_agenda                     │
│  - nomor_surat                  │    - nomor_surat                      │
│  - tanggal_diterima             │    - tanggal_kirim                    │
│  - asal_surat                   │    - tujuan_surat                     │
│  - disposisi                    │    - penandatangan                    │
│  - status                       │    - status                           │
└─────────────────────────────────┴───────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│                            TANAH WAKAF                                   │
│                                                                          │
│  ┌─────────────────┐                                                    │
│  │     WAKIF       │                                                    │
│  │  - id           │                                                    │
│  │  - nama_wakif   │                                                    │
│  │  - nik          │                                                    │
│  │  - alamat       │                                                    │
│  └────────┬────────┘                                                    │
│           │                                                              │
│           ▼                                                              │
│  ┌─────────────────┐                                                    │
│  │  TANAH_WAKAF    │                                                    │
│  │  - id           │                                                    │
│  │  - wakif_id (FK)│                                                    │
│  │  - nama_lokasi  │                                                    │
│  │  - luas_tanah   │                                                    │
│  │  - sertifikat   │                                                    │
│  │  - nazir        │                                                    │
│  │  - pemanfaatan  │                                                    │
│  └─────────────────┘                                                    │
└─────────────────────────────────────────────────────────────────────────┘
```

## Detail Relasi Tabel

### 1. Relasi One-to-Many

#### PRM → ANGGOTA_MUHAMMADIYAH
- Satu PRM memiliki banyak anggota
- `anggota_muhammadiyah.prm_id` → `prm.id`

#### PRA → ANGGOTA_MUHAMMADIYAH
- Satu PRA memiliki banyak anggota (khususnya anggota perempuan)
- `anggota_muhammadiyah.pra_id` → `pra.id`

#### AMAL_USAHA → MASJID_MUSHOLLA
- Satu amal usaha dapat memiliki satu detail masjid/musholla
- `masjid_musholla.amal_usaha_id` → `amal_usaha.id`

#### AMAL_USAHA → DOKUMEN_LEGAL
- Satu amal usaha dapat memiliki banyak dokumen legal
- `dokumen_legal.amal_usaha_id` → `amal_usaha.id`

#### AMAL_USAHA → INVENTARIS_ASET
- Satu amal usaha dapat memiliki banyak inventaris aset
- `inventaris_aset.amal_usaha_id` → `amal_usaha.id`

#### AMAL_USAHA → STRUKTUR_ORGANISASI_AUM
- Satu amal usaha dapat memiliki banyak pengurus
- `struktur_organisasi_aum.amal_usaha_id` → `amal_usaha.id`

#### AMAL_USAHA → KEPEGAWAIAN
- Satu amal usaha dapat memiliki banyak pegawai
- `kepegawaian.amal_usaha_id` → `amal_usaha.id`

#### AMAL_USAHA → PENGAJIAN (Optional)
- Satu amal usaha dapat memiliki banyak pengajian
- `pengajian.amal_usaha_id` → `amal_usaha.id` (nullable)

#### PENGAJIAN → ABSENSI_PENGAJIAN
- Satu pengajian memiliki banyak record absensi
- `absensi_pengajian.pengajian_id` → `pengajian.id`

#### WAKIF → TANAH_WAKAF
- Satu wakif dapat memberikan banyak tanah wakaf
- `tanah_wakaf.wakif_id` → `wakif.id`

#### ANGGOTA_MUHAMMADIYAH → USERS (Optional)
- Satu anggota dapat memiliki satu akun user
- `users.anggota_id` → `anggota_muhammadiyah.id` (nullable)

### 2. Tabel Independen

Tabel-tabel berikut tidak memiliki foreign key ke tabel lain:
- `kpi_ortom`: Data standalone untuk monitoring KPI organisasi otonom
- `kpi_majelis`: Data standalone untuk monitoring KPI majelis
- `surat_masuk`: Data standalone untuk surat masuk
- `surat_keluar`: Data standalone untuk surat keluar

## Cascade Rules

### ON DELETE CASCADE
Ketika parent record dihapus, child records juga akan dihapus:
- `amal_usaha` → `masjid_musholla`, `dokumen_legal`, `inventaris_aset`, `struktur_organisasi_aum`, `kepegawaian`
- `pengajian` → `absensi_pengajian`
- `wakif` → `tanah_wakaf`

### ON DELETE SET NULL
Ketika parent record dihapus, foreign key di child akan di-set NULL:
- `amal_usaha` → `pengajian`
- `prm` → `anggota_muhammadiyah`
- `pra` → `anggota_muhammadiyah`
- `anggota_muhammadiyah` → `users`

## Soft Deletes

Tabel-tabel berikut menggunakan soft delete (kolom `deleted_at`):
- `prm`
- `pra`
- `kpi_ortom`
- `kpi_majelis`
- `amal_usaha`
- `masjid_musholla`
- `dokumen_legal`
- `inventaris_aset`
- `struktur_organisasi_aum`
- `kepegawaian`
- `pengajian`
- `absensi_pengajian`
- `surat_masuk`
- `surat_keluar`
- `wakif`
- `tanah_wakaf`
- `anggota_muhammadiyah`

Soft delete memungkinkan data "dihapus" tanpa benar-benar menghapus dari database, sehingga dapat di-restore jika diperlukan.

## Indexes

### Primary Indexes
Setiap tabel memiliki primary key `id` dengan auto increment.

### Foreign Key Indexes
Semua foreign keys secara otomatis memiliki index untuk meningkatkan performa JOIN queries.

### Additional Indexes
Indexes tambahan dibuat pada kolom yang sering digunakan untuk:
- Filtering: `status`, `jenis`, `kategori`
- Searching: `nama`, `nomor`, `kode`
- Sorting: `tanggal`, `periode`
- Grouping: `kecamatan`, `kabupaten`

## Query Patterns Umum

### 1. Mendapatkan semua anggota di satu PRM
```sql
SELECT a.* 
FROM anggota_muhammadiyah a
INNER JOIN prm p ON a.prm_id = p.id
WHERE p.nama_ranting = 'Gombong Barat'
AND a.status_keanggotaan = 'aktif';
```

### 2. Mendapatkan semua AUM dengan dokumen legal lengkap
```sql
SELECT au.nama_aum, COUNT(dl.id) as jumlah_dokumen
FROM amal_usaha au
LEFT JOIN dokumen_legal dl ON au.id = dl.amal_usaha_id
WHERE dl.status = 'aktif'
GROUP BY au.id
HAVING jumlah_dokumen >= 3;
```

### 3. Statistik kehadiran pengajian
```sql
SELECT p.nama_pengajian, 
       AVG(ap.jumlah_hadir) as rata_rata_hadir,
       COUNT(ap.id) as jumlah_pertemuan
FROM pengajian p
LEFT JOIN absensi_pengajian ap ON p.id = ap.pengajian_id
WHERE YEAR(ap.tanggal_pengajian) = 2024
GROUP BY p.id;
```

### 4. Tanah wakaf per kecamatan
```sql
SELECT tw.kecamatan, 
       COUNT(tw.id) as jumlah_lokasi,
       SUM(tw.luas_tanah) as total_luas
FROM tanah_wakaf tw
WHERE tw.status_tanah = 'tersertifikat'
GROUP BY tw.kecamatan
ORDER BY total_luas DESC;
```

## Best Practices

1. **Selalu gunakan transactions** untuk operasi yang melibatkan multiple tables
2. **Gunakan prepared statements** untuk mencegah SQL injection
3. **Index kolom yang sering di-query** tapi jangan berlebihan
4. **Gunakan soft delete** untuk data yang mungkin perlu di-recover
5. **Backup database secara rutin** minimal 1x per minggu
6. **Monitor query performance** dan optimize query yang lambat
7. **Validasi foreign key** sebelum insert data child records
8. **Gunakan ENUM dengan bijak** untuk data yang fixed value

## Maintenance Schedule

- **Daily**: Backup database
- **Weekly**: Check orphaned records
- **Monthly**: Optimize tables, update statistics
- **Quarterly**: Review indexes, check disk space
- **Yearly**: Archive old data, audit security
