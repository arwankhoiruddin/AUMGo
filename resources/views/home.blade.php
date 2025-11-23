@extends('layouts.admin')

@section('title', 'Dashboard')

@section('page_title', 'Dashboard')

@section('breadcrumb')
    <li class="breadcrumb-item active">Dashboard</li>
@endsection

@section('content')
    <!-- Info boxes -->
    <div class="row">
        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
                <span class="info-box-icon bg-info elevation-1"><i class="fas fa-users"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">PRM & PRA</span>
                    <span class="info-box-number">0</span>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
                <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-building"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Amal Usaha</span>
                    <span class="info-box-number">0</span>
                </div>
            </div>
        </div>

        <div class="clearfix hidden-md-up"></div>

        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
                <span class="info-box-icon bg-success elevation-1"><i class="fas fa-user-friends"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Anggota</span>
                    <span class="info-box-number">0</span>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
                <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-map-marked-alt"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text">Tanah Wakaf</span>
                    <span class="info-box-number">0</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Main row -->
    <div class="row">
        <!-- Left col -->
        <section class="col-lg-7 connectedSortable">
            <!-- Welcome Card -->
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">
                        <i class="fas fa-home mr-1"></i>
                        Selamat Datang
                    </h3>
                </div>
                <div class="card-body">
                    <p>Selamat datang di <strong>{{ config('app.name', 'AUMGo') }}</strong> - Sistem Informasi Amal Usaha Muhammadiyah Gombong.</p>
                    <p>Sistem ini dirancang untuk membantu PCM Gombong dalam mengelola data dan informasi:</p>
                    <ul>
                        <li>Data PRM dan PRA</li>
                        <li>KPI Ortom dan Majelis</li>
                        <li>Amal Usaha Muhammadiyah</li>
                        <li>Persuratan (Surat Masuk & Keluar)</li>
                        <li>Data Anggota Muhammadiyah</li>
                        <li>Tanah Wakaf</li>
                        <li>Pengajian dan Absensi</li>
                    </ul>
                    <p class="mb-0">Gunakan menu di sebelah kiri untuk mengakses berbagai fitur yang tersedia.</p>
                </div>
            </div>
        </section>

        <!-- Right col -->
        <section class="col-lg-5 connectedSortable">
            <!-- Info Card -->
            <div class="card bg-gradient-info">
                <div class="card-header border-0">
                    <h3 class="card-title">
                        <i class="fas fa-info-circle mr-1"></i>
                        Informasi
                    </h3>
                </div>
                <div class="card-body">
                    <p>Anda login sebagai: <strong>{{ Auth::user()->name }}</strong></p>
                    <p>Email: <strong>{{ Auth::user()->email }}</strong></p>
                    <p class="mb-0">Waktu akses: <strong>{{ now()->format('d/m/Y H:i:s') }}</strong></p>
                </div>
            </div>

            <!-- Recent Activity Card -->
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">
                        <i class="fas fa-clock mr-1"></i>
                        Aktivitas Terbaru
                    </h3>
                </div>
                <div class="card-body">
                    <p class="text-muted">Belum ada aktivitas terbaru.</p>
                </div>
            </div>
        </section>
    </div>
@endsection
