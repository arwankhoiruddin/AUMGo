-- ============================================
-- Database: AUMGo (Sistem Informasi Amal Usaha Muhammadiyah Gombong)
-- Deskripsi: Database untuk mengelola data dan informasi amal usaha Muhammadiyah
-- di Pimpinan Cabang Muhammadiyah (PCM) Gombong, Jawa Tengah
-- ============================================

-- Set timezone to WIB (UTC+7)
SET time_zone = '+07:00';

-- ============================================
-- 1. TABEL PRM (Pimpinan Ranting Muhammadiyah)
-- ============================================
CREATE TABLE IF NOT EXISTS `prm` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_ranting` varchar(255) NOT NULL,
  `kode_ranting` varchar(50) DEFAULT NULL UNIQUE,
  `alamat` text DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT 'Kebumen',
  `provinsi` varchar(100) DEFAULT 'Jawa Tengah',
  `kode_pos` varchar(10) DEFAULT NULL,
  `nama_ketua` varchar(255) DEFAULT NULL,
  `kontak_ketua` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `periode_mulai` date DEFAULT NULL,
  `periode_selesai` date DEFAULT NULL,
  `status` enum('aktif', 'non-aktif') DEFAULT 'aktif',
  `wilayah_kerja` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prm_status` (`status`),
  KEY `idx_prm_kecamatan` (`kecamatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 2. TABEL PRA (Pimpinan Ranting Aisyiyah)
-- ============================================
CREATE TABLE IF NOT EXISTS `pra` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_ranting` varchar(255) NOT NULL,
  `kode_ranting` varchar(50) DEFAULT NULL UNIQUE,
  `alamat` text DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT 'Kebumen',
  `provinsi` varchar(100) DEFAULT 'Jawa Tengah',
  `kode_pos` varchar(10) DEFAULT NULL,
  `nama_ketua` varchar(255) DEFAULT NULL,
  `kontak_ketua` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `periode_mulai` date DEFAULT NULL,
  `periode_selesai` date DEFAULT NULL,
  `status` enum('aktif', 'non-aktif') DEFAULT 'aktif',
  `wilayah_kerja` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pra_status` (`status`),
  KEY `idx_pra_kecamatan` (`kecamatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 3. TABEL KPI ORTOM (Organisasi Otonom)
-- ============================================
CREATE TABLE IF NOT EXISTS `kpi_ortom` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_ortom` varchar(255) NOT NULL COMMENT 'e.g., IMM, IPM, Nasyiatul Aisyiyah, Pemuda Muhammadiyah',
  `periode` varchar(50) NOT NULL COMMENT 'e.g., 2023-2024',
  `indikator` varchar(255) NOT NULL,
  `deskripsi_indikator` text DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `realisasi` int(11) DEFAULT NULL,
  `satuan` enum('orang', 'kegiatan', 'unit', 'persen', 'lainnya') DEFAULT 'kegiatan',
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `status` enum('belum dimulai', 'sedang berjalan', 'selesai', 'tertunda') DEFAULT 'belum dimulai',
  `catatan` text DEFAULT NULL,
  `penanggung_jawab` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kpi_ortom_nama` (`nama_ortom`),
  KEY `idx_kpi_ortom_periode` (`periode`),
  KEY `idx_kpi_ortom_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 4. TABEL KPI MAJELIS
-- ============================================
CREATE TABLE IF NOT EXISTS `kpi_majelis` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_majelis` varchar(255) NOT NULL COMMENT 'e.g., Majelis Tabligh, Majelis Pendidikan, Majelis Ekonomi',
  `periode` varchar(50) NOT NULL COMMENT 'e.g., 2023-2024',
  `program_kerja` varchar(255) NOT NULL,
  `deskripsi_program` text DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `realisasi` int(11) DEFAULT NULL,
  `satuan` enum('orang', 'kegiatan', 'unit', 'persen', 'lainnya') DEFAULT 'kegiatan',
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `status` enum('belum dimulai', 'sedang berjalan', 'selesai', 'tertunda') DEFAULT 'belum dimulai',
  `anggaran` decimal(15, 2) DEFAULT NULL,
  `realisasi_anggaran` decimal(15, 2) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `penanggung_jawab` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kpi_majelis_nama` (`nama_majelis`),
  KEY `idx_kpi_majelis_periode` (`periode`),
  KEY `idx_kpi_majelis_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 5. TABEL AMAL USAHA MUHAMMADIYAH (AUM)
-- ============================================
CREATE TABLE IF NOT EXISTS `amal_usaha` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_aum` varchar(255) NOT NULL,
  `jenis_aum` enum('masjid', 'musholla', 'sekolah', 'rumah sakit', 'klinik', 'panti asuhan', 'koperasi', 'lainnya') NOT NULL,
  `kode_aum` varchar(50) DEFAULT NULL UNIQUE,
  `alamat` text DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT 'Kebumen',
  `provinsi` varchar(100) DEFAULT 'Jawa Tengah',
  `kode_pos` varchar(10) DEFAULT NULL,
  `latitude` decimal(10, 8) DEFAULT NULL,
  `longitude` decimal(11, 8) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `tahun_berdiri` year DEFAULT NULL,
  `tanggal_sk_berdiri` date DEFAULT NULL,
  `nomor_sk_berdiri` varchar(100) DEFAULT NULL,
  `status_operasional` enum('aktif', 'tidak aktif', 'dalam pembangunan') DEFAULT 'aktif',
  `nama_pimpinan` varchar(255) DEFAULT NULL,
  `kontak_pimpinan` varchar(50) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aum_jenis` (`jenis_aum`),
  KEY `idx_aum_status` (`status_operasional`),
  KEY `idx_aum_kecamatan` (`kecamatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 6. TABEL MASJID DAN MUSHOLLA (Detail khusus)
-- ============================================
CREATE TABLE IF NOT EXISTS `masjid_musholla` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amal_usaha_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kapasitas_jamaah` int(11) DEFAULT NULL,
  `luas_tanah` decimal(10, 2) DEFAULT NULL COMMENT 'dalam meter persegi',
  `luas_bangunan` decimal(10, 2) DEFAULT NULL COMMENT 'dalam meter persegi',
  `jumlah_imam` int(11) DEFAULT NULL,
  `jumlah_muadzin` int(11) DEFAULT NULL,
  `jumlah_marbot` int(11) DEFAULT NULL,
  `jadwal_jumat` time DEFAULT NULL,
  `jadwal_subuh` time DEFAULT NULL,
  `jadwal_dzuhur` time DEFAULT NULL,
  `jadwal_ashar` time DEFAULT NULL,
  `jadwal_maghrib` time DEFAULT NULL,
  `jadwal_isya` time DEFAULT NULL,
  `fasilitas` text DEFAULT NULL COMMENT 'JSON array atau comma separated',
  `kegiatan_rutin` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_masjid_aum` (`amal_usaha_id`),
  CONSTRAINT `fk_masjid_aum` FOREIGN KEY (`amal_usaha_id`) REFERENCES `amal_usaha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 7. TABEL DOKUMEN LEGAL
-- ============================================
CREATE TABLE IF NOT EXISTS `dokumen_legal` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amal_usaha_id` bigint(20) UNSIGNED NOT NULL,
  `jenis_dokumen` enum('SK Berdiri', 'Sertifikat Tanah', 'IMB', 'NPWP', 'Akta Notaris', 'Izin Operasional', 'Lainnya') NOT NULL,
  `nomor_dokumen` varchar(100) DEFAULT NULL,
  `tanggal_terbit` date DEFAULT NULL,
  `tanggal_berakhir` date DEFAULT NULL,
  `instansi_penerbit` varchar(255) DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `path_file` varchar(500) DEFAULT NULL,
  `ukuran_file` int(11) DEFAULT NULL COMMENT 'dalam bytes',
  `keterangan` text DEFAULT NULL,
  `status` enum('aktif', 'kadaluarsa', 'dalam proses') DEFAULT 'aktif',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dokumen_aum` (`amal_usaha_id`),
  KEY `idx_dokumen_jenis` (`jenis_dokumen`),
  KEY `idx_dokumen_status` (`status`),
  CONSTRAINT `fk_dokumen_aum` FOREIGN KEY (`amal_usaha_id`) REFERENCES `amal_usaha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 8. TABEL INVENTARIS ASET
-- ============================================
CREATE TABLE IF NOT EXISTS `inventaris_aset` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amal_usaha_id` bigint(20) UNSIGNED NOT NULL,
  `kategori_aset` enum('tanah', 'bangunan', 'kendaraan', 'peralatan elektronik', 'furniture', 'buku', 'lainnya') NOT NULL,
  `nama_aset` varchar(255) NOT NULL,
  `kode_inventaris` varchar(100) DEFAULT NULL UNIQUE,
  `jumlah` int(11) DEFAULT 1,
  `satuan` varchar(50) DEFAULT 'unit',
  `kondisi` enum('baik', 'rusak ringan', 'rusak berat', 'tidak layak pakai') DEFAULT 'baik',
  `tahun_perolehan` year DEFAULT NULL,
  `nilai_perolehan` decimal(15, 2) DEFAULT NULL,
  `nilai_sekarang` decimal(15, 2) DEFAULT NULL,
  `sumber_perolehan` enum('pembelian', 'hibah', 'wakaf', 'bantuan', 'lainnya') DEFAULT NULL,
  `lokasi_penempatan` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_inventaris_aum` (`amal_usaha_id`),
  KEY `idx_inventaris_kategori` (`kategori_aset`),
  KEY `idx_inventaris_kondisi` (`kondisi`),
  CONSTRAINT `fk_inventaris_aum` FOREIGN KEY (`amal_usaha_id`) REFERENCES `amal_usaha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 9. TABEL STRUKTUR ORGANISASI AUM
-- ============================================
CREATE TABLE IF NOT EXISTS `struktur_organisasi_aum` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amal_usaha_id` bigint(20) UNSIGNED NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `nama_pengurus` varchar(255) NOT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L', 'P') DEFAULT NULL,
  `pendidikan_terakhir` varchar(100) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `periode_mulai` date DEFAULT NULL,
  `periode_selesai` date DEFAULT NULL,
  `status` enum('aktif', 'non-aktif') DEFAULT 'aktif',
  `sk_pengangkatan` varchar(100) DEFAULT NULL,
  `tanggal_sk` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_organisasi_aum` (`amal_usaha_id`),
  KEY `idx_organisasi_status` (`status`),
  CONSTRAINT `fk_organisasi_aum` FOREIGN KEY (`amal_usaha_id`) REFERENCES `amal_usaha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 10. TABEL KEPEGAWAIAN
-- ============================================
CREATE TABLE IF NOT EXISTS `kepegawaian` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `amal_usaha_id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(50) DEFAULT NULL UNIQUE,
  `nama_lengkap` varchar(255) NOT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L', 'P') DEFAULT NULL,
  `agama` varchar(50) DEFAULT 'Islam',
  `status_perkawinan` enum('belum menikah', 'menikah', 'cerai hidup', 'cerai mati') DEFAULT NULL,
  `pendidikan_terakhir` varchar(100) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `unit_kerja` varchar(255) DEFAULT NULL,
  `status_kepegawaian` enum('tetap', 'kontrak', 'honorer', 'magang') DEFAULT 'kontrak',
  `tanggal_masuk` date DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `status_aktif` enum('aktif', 'cuti', 'pensiun', 'berhenti', 'meninggal') DEFAULT 'aktif',
  `gaji_pokok` decimal(15, 2) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nama_kontak_darurat` varchar(255) DEFAULT NULL,
  `telepon_kontak_darurat` varchar(50) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pegawai_aum` (`amal_usaha_id`),
  KEY `idx_pegawai_status` (`status_aktif`),
  KEY `idx_pegawai_status_kepegawaian` (`status_kepegawaian`),
  CONSTRAINT `fk_pegawai_aum` FOREIGN KEY (`amal_usaha_id`) REFERENCES `amal_usaha` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 11. TABEL PENGAJIAN
-- ============================================
CREATE TABLE IF NOT EXISTS `pengajian` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_pengajian` varchar(255) NOT NULL,
  `jenis_pengajian` enum('umum', 'ibu-ibu', 'bapak-bapak', 'remaja', 'anak-anak', 'khusus') DEFAULT 'umum',
  `lokasi` varchar(255) DEFAULT NULL,
  `amal_usaha_id` bigint(20) UNSIGNED DEFAULT NULL,
  `jadwal` enum('senin', 'selasa', 'rabu', 'kamis', 'jumat', 'sabtu', 'minggu') DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_selesai` time DEFAULT NULL,
  `ustadz_tetap` varchar(255) DEFAULT NULL,
  `kontak_ustadz` varchar(50) DEFAULT NULL,
  `materi_kajian` varchar(255) DEFAULT NULL,
  `target_peserta` int(11) DEFAULT NULL,
  `rata_rata_peserta` int(11) DEFAULT NULL,
  `status` enum('aktif', 'libur', 'tidak aktif') DEFAULT 'aktif',
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pengajian_aum` (`amal_usaha_id`),
  KEY `idx_pengajian_jenis` (`jenis_pengajian`),
  KEY `idx_pengajian_status` (`status`),
  CONSTRAINT `fk_pengajian_aum` FOREIGN KEY (`amal_usaha_id`) REFERENCES `amal_usaha` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 12. TABEL ABSENSI PENGAJIAN
-- ============================================
CREATE TABLE IF NOT EXISTS `absensi_pengajian` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pengajian_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_pengajian` date NOT NULL,
  `ustadz_hadir` varchar(255) DEFAULT NULL,
  `materi_disampaikan` text DEFAULT NULL,
  `jumlah_hadir` int(11) DEFAULT 0,
  `jumlah_laki_laki` int(11) DEFAULT 0,
  `jumlah_perempuan` int(11) DEFAULT 0,
  `jumlah_anak_anak` int(11) DEFAULT 0,
  `waktu_mulai_actual` time DEFAULT NULL,
  `waktu_selesai_actual` time DEFAULT NULL,
  `foto_kegiatan` varchar(255) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `status` enum('terlaksana', 'ditunda', 'dibatalkan') DEFAULT 'terlaksana',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_absensi_pengajian` (`pengajian_id`),
  KEY `idx_absensi_tanggal` (`tanggal_pengajian`),
  CONSTRAINT `fk_absensi_pengajian` FOREIGN KEY (`pengajian_id`) REFERENCES `pengajian` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 13. TABEL SURAT MASUK
-- ============================================
CREATE TABLE IF NOT EXISTS `surat_masuk` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomor_agenda` varchar(50) DEFAULT NULL UNIQUE,
  `nomor_surat` varchar(100) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_diterima` date NOT NULL,
  `asal_surat` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `isi_ringkas` text DEFAULT NULL,
  `jenis_surat` enum('biasa', 'penting', 'segera', 'sangat segera', 'rahasia') DEFAULT 'biasa',
  `sifat_surat` enum('biasa', 'penting', 'rahasia') DEFAULT 'biasa',
  `lampiran` int(11) DEFAULT 0,
  `disposisi_kepada` varchar(255) DEFAULT NULL,
  `catatan_disposisi` text DEFAULT NULL,
  `status_disposisi` enum('belum', 'sudah', 'selesai') DEFAULT 'belum',
  `nama_file` varchar(255) DEFAULT NULL,
  `path_file` varchar(500) DEFAULT NULL,
  `penerima` varchar(255) DEFAULT NULL,
  `status` enum('diterima', 'diproses', 'selesai', 'diarsipkan') DEFAULT 'diterima',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surat_masuk_tanggal` (`tanggal_diterima`),
  KEY `idx_surat_masuk_status` (`status`),
  KEY `idx_surat_masuk_jenis` (`jenis_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 14. TABEL SURAT KELUAR
-- ============================================
CREATE TABLE IF NOT EXISTS `surat_keluar` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomor_agenda` varchar(50) DEFAULT NULL UNIQUE,
  `nomor_surat` varchar(100) NOT NULL,
  `tanggal_surat` date NOT NULL,
  `tanggal_kirim` date DEFAULT NULL,
  `tujuan_surat` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `isi_ringkas` text DEFAULT NULL,
  `jenis_surat` enum('biasa', 'penting', 'segera', 'sangat segera', 'rahasia') DEFAULT 'biasa',
  `sifat_surat` enum('biasa', 'penting', 'rahasia') DEFAULT 'biasa',
  `lampiran` int(11) DEFAULT 0,
  `pembuat_surat` varchar(255) DEFAULT NULL,
  `penandatangan` varchar(255) DEFAULT NULL,
  `jabatan_penandatangan` varchar(255) DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `path_file` varchar(500) DEFAULT NULL,
  `status` enum('draft', 'menunggu ttd', 'dikirim', 'diarsipkan') DEFAULT 'draft',
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surat_keluar_tanggal` (`tanggal_surat`),
  KEY `idx_surat_keluar_status` (`status`),
  KEY `idx_surat_keluar_jenis` (`jenis_surat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 15. TABEL WAKIF (Pemberi Wakaf)
-- ============================================
CREATE TABLE IF NOT EXISTS `wakif` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_wakif` varchar(255) NOT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L', 'P') DEFAULT NULL,
  `agama` varchar(50) DEFAULT 'Islam',
  `pekerjaan` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT 'Kebumen',
  `provinsi` varchar(100) DEFAULT 'Jawa Tengah',
  `kode_pos` varchar(10) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `status` enum('masih hidup', 'meninggal dunia') DEFAULT 'masih hidup',
  `tanggal_meninggal` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wakif_nama` (`nama_wakif`),
  KEY `idx_wakif_kecamatan` (`kecamatan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 16. TABEL TANAH WAKAF
-- ============================================
CREATE TABLE IF NOT EXISTS `tanah_wakaf` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `wakif_id` bigint(20) UNSIGNED NOT NULL,
  `nama_lokasi` varchar(255) NOT NULL,
  `alamat` text DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT 'Kebumen',
  `provinsi` varchar(100) DEFAULT 'Jawa Tengah',
  `luas_tanah` decimal(10, 2) DEFAULT NULL COMMENT 'dalam meter persegi',
  `nomor_sertifikat` varchar(100) DEFAULT NULL,
  `jenis_sertifikat` enum('SHM', 'SHGB', 'Girik', 'Letter C', 'Lainnya') DEFAULT NULL,
  `tanggal_sertifikat` date DEFAULT NULL,
  `atas_nama` varchar(255) DEFAULT NULL,
  `nomor_akta_ikrar_wakaf` varchar(100) DEFAULT NULL,
  `tanggal_ikrar_wakaf` date DEFAULT NULL,
  `ppaiw` varchar(255) DEFAULT NULL COMMENT 'Pejabat Pembuat Akta Ikrar Wakaf',
  `nazir` varchar(255) DEFAULT NULL COMMENT 'Pengelola wakaf',
  `peruntukan` varchar(255) DEFAULT NULL,
  `status_tanah` enum('tersertifikat', 'belum tersertifikat', 'dalam proses') DEFAULT 'tersertifikat',
  `status_pemanfaatan` enum('digunakan', 'belum digunakan', 'sebagian digunakan') DEFAULT 'digunakan',
  `pemanfaatan_saat_ini` text DEFAULT NULL,
  `nilai_njop` decimal(15, 2) DEFAULT NULL,
  `batas_utara` text DEFAULT NULL,
  `batas_selatan` text DEFAULT NULL,
  `batas_timur` text DEFAULT NULL,
  `batas_barat` text DEFAULT NULL,
  `nama_file_sertifikat` varchar(255) DEFAULT NULL,
  `path_file_sertifikat` varchar(500) DEFAULT NULL,
  `nama_file_akta` varchar(255) DEFAULT NULL,
  `path_file_akta` varchar(500) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_wakaf_wakif` (`wakif_id`),
  KEY `idx_wakaf_kecamatan` (`kecamatan`),
  KEY `idx_wakaf_status` (`status_tanah`),
  CONSTRAINT `fk_wakaf_wakif` FOREIGN KEY (`wakif_id`) REFERENCES `wakif` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 17. TABEL ANGGOTA MUHAMMADIYAH
-- ============================================
CREATE TABLE IF NOT EXISTS `anggota_muhammadiyah` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nbm` varchar(50) DEFAULT NULL UNIQUE COMMENT 'Nomor Buku Muhammadiyah',
  `nomor_kartu_anggota` varchar(50) DEFAULT NULL UNIQUE,
  `nama_lengkap` varchar(255) NOT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L', 'P') DEFAULT NULL,
  `agama` varchar(50) DEFAULT 'Islam',
  `status_perkawinan` enum('belum menikah', 'menikah', 'cerai hidup', 'cerai mati') DEFAULT NULL,
  `pendidikan_terakhir` varchar(100) DEFAULT NULL,
  `pekerjaan` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `kelurahan` varchar(100) DEFAULT NULL,
  `kecamatan` varchar(100) DEFAULT NULL,
  `kabupaten` varchar(100) DEFAULT 'Kebumen',
  `provinsi` varchar(100) DEFAULT 'Jawa Tengah',
  `kode_pos` varchar(10) DEFAULT NULL,
  `telepon` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `prm_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Pimpinan Ranting Muhammadiyah',
  `pra_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Pimpinan Ranting Aisyiyah (untuk anggota perempuan)',
  `tanggal_daftar` date DEFAULT NULL,
  `tanggal_bai_at` date DEFAULT NULL COMMENT 'Tanggal pengucapan janji setia',
  `status_keanggotaan` enum('aktif', 'non-aktif', 'meninggal', 'pindah') DEFAULT 'aktif',
  `kategori_anggota` enum('anggota biasa', 'anggota muda', 'anggota luar biasa', 'anggota kehormatan') DEFAULT 'anggota biasa',
  `riwayat_jabatan` text DEFAULT NULL,
  `riwayat_kontribusi` text DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_anggota_nbm` (`nbm`),
  KEY `idx_anggota_status` (`status_keanggotaan`),
  KEY `idx_anggota_prm` (`prm_id`),
  KEY `idx_anggota_pra` (`pra_id`),
  KEY `idx_anggota_kecamatan` (`kecamatan`),
  CONSTRAINT `fk_anggota_prm` FOREIGN KEY (`prm_id`) REFERENCES `prm` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_anggota_pra` FOREIGN KEY (`pra_id`) REFERENCES `pra` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 18. TABEL USERS (untuk autentikasi dan otorisasi)
-- ============================================
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin', 'operator', 'pengurus', 'viewer') DEFAULT 'viewer',
  `anggota_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_users_role` (`role`),
  KEY `idx_users_anggota` (`anggota_id`),
  CONSTRAINT `fk_users_anggota` FOREIGN KEY (`anggota_id`) REFERENCES `anggota_muhammadiyah` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 19. TABEL PASSWORD RESET TOKENS
-- ============================================
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 20. TABEL SESSIONS
-- ============================================
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 21. TABEL CACHE (untuk sistem caching Laravel)
-- ============================================
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 22. TABEL CACHE LOCKS (untuk lock mechanism cache)
-- ============================================
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 23. TABEL JOBS (untuk sistem queue Laravel)
-- ============================================
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 24. TABEL JOB BATCHES (untuk batch jobs Laravel)
-- ============================================
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- 25. TABEL FAILED JOBS (untuk job yang gagal)
-- ============================================
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- INSERT DATA CONTOH / SAMPLE DATA
-- ============================================

-- Sample PRM
INSERT INTO `prm` (`nama_ranting`, `kode_ranting`, `alamat`, `kecamatan`, `status`, `created_at`, `updated_at`) VALUES
('PRM Gombong Barat', 'PRM-GB-01', 'Jl. Raya Gombong KM 5', 'Gombong', 'aktif', NOW(), NOW()),
('PRM Gombong Timur', 'PRM-GT-01', 'Jl. Ahmad Yani No. 10', 'Gombong', 'aktif', NOW(), NOW());

-- Sample Jenis Ortom
INSERT INTO `kpi_ortom` (`nama_ortom`, `periode`, `indikator`, `target`, `satuan`, `status`, `created_at`, `updated_at`) VALUES
('IMM (Ikatan Mahasiswa Muhammadiyah)', '2024-2025', 'Jumlah anggota baru', 50, 'orang', 'sedang berjalan', NOW(), NOW()),
('IPM (Ikatan Pelajar Muhammadiyah)', '2024-2025', 'Kegiatan kaderisasi', 12, 'kegiatan', 'sedang berjalan', NOW(), NOW()),
('Pemuda Muhammadiyah', '2024-2025', 'Program kepemudaan', 10, 'kegiatan', 'belum dimulai', NOW(), NOW());

-- Sample Majelis
INSERT INTO `kpi_majelis` (`nama_majelis`, `periode`, `program_kerja`, `target`, `satuan`, `status`, `created_at`, `updated_at`) VALUES
('Majelis Tabligh', '2024-2025', 'Pengajian Rutin Bulanan', 12, 'kegiatan', 'sedang berjalan', NOW(), NOW()),
('Majelis Pendidikan', '2024-2025', 'Pelatihan Guru', 4, 'kegiatan', 'belum dimulai', NOW(), NOW()),
('Majelis Ekonomi', '2024-2025', 'Program UMKM', 20, 'unit', 'sedang berjalan', NOW(), NOW());

-- Sample Admin User (password: password - hashed dengan bcrypt)
INSERT INTO `users` (`name`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
('Administrator', 'admin@aumgo.com', '$2y$12$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', NOW(), NOW());

-- ============================================
-- SELESAI / END OF FILE
-- ============================================
