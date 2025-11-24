<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

class DatabaseSqlFileTest extends TestCase
{
    /**
     * Path to the SQL file
     */
    private string $sqlFilePath;

    protected function setUp(): void
    {
        parent::setUp();
        $this->sqlFilePath = dirname(__DIR__, 2) . '/database/sql/aumgo_database.sql';
    }

    /**
     * Test that the SQL file exists
     */
    public function test_sql_file_exists(): void
    {
        $this->assertFileExists($this->sqlFilePath, 'Database SQL file should exist');
    }

    /**
     * Test that the SQL file is readable
     */
    public function test_sql_file_is_readable(): void
    {
        $this->assertTrue(
            is_readable($this->sqlFilePath),
            'Database SQL file should be readable'
        );
    }

    /**
     * Test that the SQL file contains all required Laravel framework tables
     */
    public function test_sql_file_contains_laravel_cache_tables(): void
    {
        $sqlContent = file_get_contents($this->sqlFilePath);

        // Test cache table exists
        $this->assertStringContainsString(
            'CREATE TABLE IF NOT EXISTS `cache`',
            $sqlContent,
            'SQL file should contain cache table definition'
        );

        // Test cache_locks table exists
        $this->assertStringContainsString(
            'CREATE TABLE IF NOT EXISTS `cache_locks`',
            $sqlContent,
            'SQL file should contain cache_locks table definition'
        );
    }

    /**
     * Test that the SQL file contains all required Laravel queue tables
     */
    public function test_sql_file_contains_laravel_queue_tables(): void
    {
        $sqlContent = file_get_contents($this->sqlFilePath);

        // Test jobs table exists
        $this->assertStringContainsString(
            'CREATE TABLE IF NOT EXISTS `jobs`',
            $sqlContent,
            'SQL file should contain jobs table definition'
        );

        // Test job_batches table exists
        $this->assertStringContainsString(
            'CREATE TABLE IF NOT EXISTS `job_batches`',
            $sqlContent,
            'SQL file should contain job_batches table definition'
        );

        // Test failed_jobs table exists
        $this->assertStringContainsString(
            'CREATE TABLE IF NOT EXISTS `failed_jobs`',
            $sqlContent,
            'SQL file should contain failed_jobs table definition'
        );
    }

    /**
     * Test that cache table has required columns
     */
    public function test_cache_table_has_required_columns(): void
    {
        $sqlContent = file_get_contents($this->sqlFilePath);

        // Extract cache table definition
        preg_match(
            '/CREATE TABLE IF NOT EXISTS `cache`\s*\((.*?)\)\s*ENGINE=/s',
            $sqlContent,
            $matches
        );

        $this->assertNotEmpty($matches, 'Cache table definition should be found');

        $tableDef = $matches[1];

        $this->assertStringContainsString('`key`', $tableDef, 'Cache table should have key column');
        $this->assertStringContainsString('`value`', $tableDef, 'Cache table should have value column');
        $this->assertStringContainsString('`expiration`', $tableDef, 'Cache table should have expiration column');
    }

    /**
     * Test that the SQL file contains all 25 expected tables
     */
    public function test_sql_file_contains_all_25_tables(): void
    {
        $sqlContent = file_get_contents($this->sqlFilePath);

        $expectedTables = [
            'prm',
            'pra',
            'kpi_ortom',
            'kpi_majelis',
            'amal_usaha',
            'masjid_musholla',
            'dokumen_legal',
            'inventaris_aset',
            'struktur_organisasi_aum',
            'kepegawaian',
            'pengajian',
            'absensi_pengajian',
            'surat_masuk',
            'surat_keluar',
            'wakif',
            'tanah_wakaf',
            'anggota_muhammadiyah',
            'users',
            'password_reset_tokens',
            'sessions',
            'cache',
            'cache_locks',
            'jobs',
            'job_batches',
            'failed_jobs',
        ];

        foreach ($expectedTables as $table) {
            $this->assertStringContainsString(
                "CREATE TABLE IF NOT EXISTS `{$table}`",
                $sqlContent,
                "SQL file should contain {$table} table definition"
            );
        }

        // Count total CREATE TABLE statements
        $createTableCount = preg_match_all(
            '/CREATE TABLE IF NOT EXISTS/',
            $sqlContent
        );

        $this->assertEquals(
            25,
            $createTableCount,
            'SQL file should contain exactly 25 CREATE TABLE statements'
        );
    }
}
