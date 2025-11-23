# GitHub Copilot Instructions - AUMGo

## Tentang Proyek / About the Project

AUMGo (Sistem Informasi Amal Usaha Muhammadiyah Gombong) adalah aplikasi web berbasis Laravel untuk mengelola data dan informasi amal usaha Muhammadiyah di Pimpinan Cabang Muhammadiyah (PCM) Gombong, Jawa Tengah.

AUMGo is a Laravel-based web application for managing data and information of Muhammadiyah charity activities in Gombong Branch, Central Java.

## Stack Teknologi / Technology Stack

- **Framework Backend**: Laravel (PHP)
- **Frontend Template**: AdminLTE
- **Database**: MySQL/MariaDB
- **Bahasa Utama**: Indonesia
- **Primary Language**: Indonesian (Bahasa Indonesia)

## Modul Utama / Main Modules

### 1. PRM dan PRA
- Manajemen struktur organisasi Pimpinan Ranting Muhammadiyah dan Aisyiyah
- Data kepengurusan, kontak, dan wilayah kerja

### 2. KPI Ortom (Organisasi Otonom)
- Indikator kinerja organisasi otonom Muhammadiyah
- Monitoring, evaluasi, target dan pencapaian kegiatan

### 3. KPI Majelis
- Indikator kinerja majelis (Tabligh, Pendidikan, Ekonomi, dll)
- Monitoring program kerja dan evaluasi kinerja

### 4. Data AUM (Amal Usaha Muhammadiyah)
- Data masjid dan musholla
- Dokumen legal (SK Berdiri, Sertifikat Tanah, IMB)
- Inventaris aset (gedung, kendaraan, fasilitas)
- Struktur organisasi AUM
- Data kepegawaian

### 5. Absensi Pengajian
- Sistem pencatatan kehadiran pengajian rutin
- Jadwal, peserta, dan rekap statistik kehadiran

### 6. SIM Surat Masuk dan Keluar
- Manajemen administrasi persuratan
- Pencatatan, penomoran, disposisi, dan arsip digital

### 7. Tanah Wakaf
- Data tanah wakaf, sertifikat, legalitas
- Informasi wakif dan pemanfaatan tanah

### 8. Data Anggota Muhammadiyah
- Database anggota Muhammadiyah
- Status keanggotaan, NBM, dan kontribusi anggota

## Panduan Pengembangan / Development Guidelines

### Konvensi Penamaan / Naming Conventions

1. **Database Tables**: Gunakan nama tabel dalam Bahasa Indonesia, lowercase dengan underscore
   - Contoh: `amal_usaha`, `surat_masuk`, `anggota_muhammadiyah`

2. **Models**: PascalCase, nama singular dalam Bahasa Indonesia atau Inggris yang sesuai
   - Contoh: `AmalUsaha`, `SuratMasuk`, `AnggotaMuhammadiyah`

3. **Controllers**: PascalCase dengan suffix `Controller`
   - Contoh: `AmalUsahaController`, `SuratMasukController`

4. **Variables dan Functions**: camelCase
   - Contoh: `$namaAnggota`, `getTanggalMasuk()`

### Standar Kode / Coding Standards

1. **PSR-12 Compliance**: Ikuti standar PSR-12 untuk PHP
2. **Laravel Best Practices**: Gunakan fitur Laravel seperti Eloquent ORM, Request Validation, Resources
3. **Comments**: Gunakan komentar dalam Bahasa Indonesia untuk penjelasan bisnis logic
4. **Dokumentasi**: Method dan class yang kompleks harus didokumentasikan dengan PHPDoc

### Request Validation

Gunakan Form Request classes untuk validasi yang kompleks:
```php
// app/Http/Requests/StoreAmalUsahaRequest.php
class StoreAmalUsahaRequest extends FormRequest
{
    public function rules()
    {
        return [
            'nama' => 'required|string|max:255',
            'alamat' => 'required|string',
            // ...
        ];
    }
}
```

### Database Migrations

- Gunakan migration untuk semua perubahan database
- Nama migration harus deskriptif: `create_amal_usaha_table`, `add_status_to_anggota_table`
- Selalu buat rollback yang proper di method `down()`

### Blade Templates

- Gunakan AdminLTE components untuk konsistensi UI
- Pisahkan layout, partials, dan content views
- Gunakan `@include`, `@extends`, `@section` dengan benar
- Format tanggal menggunakan format Indonesia (d/m/Y atau sesuai kebutuhan)

### Authorization dan Authentication

- Gunakan Laravel Policy untuk authorization
- Implementasi role-based access control jika diperlukan
- Lindungi routes dengan middleware `auth`

### API Development (jika ada)

- Gunakan API Resources untuk transformasi data
- Implementasi proper HTTP status codes
- Dokumentasi API menggunakan format yang konsisten

## Konteks Organisasi / Organizational Context

### Istilah Khusus / Special Terms

- **PCM**: Pimpinan Cabang Muhammadiyah (Branch Leadership)
- **PRM**: Pimpinan Ranting Muhammadiyah (Sub-branch Leadership)
- **PRA**: Pimpinan Ranting Aisyiyah (Aisyiyah Sub-branch Leadership)
- **Ortom**: Organisasi Otonom (Autonomous Organizations)
- **AUM**: Amal Usaha Muhammadiyah (Muhammadiyah Charity Enterprises)
- **Majelis**: Council/Assembly (e.g., Majelis Tabligh, Majelis Pendidikan)
- **NBM**: Nomor Buku Muhammadiyah (Muhammadiyah Member Book Number)
- **Wakif**: Pemberi wakaf (Waqf Donor)

### Bisnis Logic

- Tanggal dan waktu harus mengikuti zona waktu Indonesia (WIB - UTC+7)
- Format mata uang: Rupiah (Rp)
- Sistem harus support multiple users dengan role yang berbeda
- Data historis harus dipertahankan (soft deletes untuk data penting)

## File dan Folder Structure

```
app/
├── Http/
│   ├── Controllers/    # Controllers untuk setiap modul
│   ├── Requests/       # Form validation requests
│   └── Resources/      # API Resources (jika diperlukan)
├── Models/             # Eloquent models
├── Policies/           # Authorization policies
└── Services/           # Business logic services (optional)

database/
├── migrations/         # Database migrations
└── seeders/           # Database seeders

resources/
├── views/
│   ├── layouts/       # Layout templates (AdminLTE)
│   ├── partials/      # Reusable components
│   └── modules/       # Views untuk setiap modul
└── lang/              # Localization files (Indonesian)

routes/
├── web.php            # Web routes
└── api.php            # API routes (jika diperlukan)
```

## Testing Guidelines

- Tulis unit tests untuk business logic yang kompleks
- Gunakan feature tests untuk testing flow utama aplikasi
- Test naming harus deskriptif: `test_user_can_create_amal_usaha`

## Security Best Practices

1. Selalu validasi input dari user
2. Gunakan prepared statements (Eloquent ORM sudah handle ini)
3. Implement CSRF protection (Laravel default)
4. Sanitize output untuk mencegah XSS
5. Gunakan `bcrypt` atau `Hash::make()` untuk password
6. Jangan expose sensitive data di response atau logs

## Bahasa / Language

- **UI/UX**: Bahasa Indonesia
- **Kode dan Comments**: Campuran Indonesia (untuk bisnis logic) dan Inggris (untuk technical implementation)
- **Error Messages**: Bahasa Indonesia, user-friendly
- **Database**: Nama kolom bisa Bahasa Indonesia atau Inggris yang jelas

## Performance Considerations

- Gunakan eager loading untuk menghindari N+1 queries
- Index database columns yang sering di-query
- Cache data yang jarang berubah
- Pagination untuk list data yang banyak

## Helper Suggestions

Saat membuat kode untuk proyek ini:
1. Prioritaskan kesederhanaan dan maintainability
2. Ikuti Laravel conventions
3. Gunakan AdminLTE components untuk UI consistency
4. Pertimbangkan user experience untuk pengguna non-teknis
5. Dokumentasi yang jelas untuk fitur yang kompleks
6. Validasi data dengan ketat untuk menjaga integritas data
