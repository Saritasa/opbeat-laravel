<?php

namespace Opbeat\OpbeatLaravel;

use Illuminate\Support\ServiceProvider;
use Opbeat\Client;

class OpbeatLumenServiceProvider extends ServiceProvider
{
    /**
     * Indicates if loading of the provider is deferred.
     *
     * @var bool
     */
    protected $defer = false;

    /**
     * Bootstrap the application events.
     *
     * @return void
     */
    public function boot()
    {
        $this->app->configure('opbeat');
    }

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->app->singleton('opbeat', function ($app) {
            $config = $app['config'];
            return new Client($config);
        });
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return array('opbeat');
    }
}
