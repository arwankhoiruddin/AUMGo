<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class ExampleTest extends TestCase
{
    /**
     * Test that root redirects to login.
     */
    public function test_root_redirects_to_login(): void
    {
        $response = $this->get('/');

        $response->assertRedirect(route('login'));
    }

    /**
     * Test that login page loads successfully.
     */
    public function test_login_page_loads_successfully(): void
    {
        $response = $this->get(route('login'));

        $response->assertStatus(200);
    }

    /**
     * Test that register page loads successfully.
     */
    public function test_register_page_loads_successfully(): void
    {
        $response = $this->get(route('register'));

        $response->assertStatus(200);
    }
}
