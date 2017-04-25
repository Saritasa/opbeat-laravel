# opbeat-laravel

Laravel integration for [opbeat](https://opbeat.com/).


## Laravel 5.x

Install the ``saritasa/opbeat-laravel`` package:

```bash
$ composer require saritasa/opbeat-laravel
```

Add the Opbeat service provider and facade in ``config/app.php``:

```php
'providers' => array(
    // ...
    Opbeat\OpbeatLaravel\OpbeatLaravelServiceProvider::class,
)

'aliases' => array(
    // ...
    'Opbeat' => Opbeat\OpbeatLaravel\OpbeatFacade::class,
)
```

Add Opbeat reporting to ``App/Exceptions/Handler.php``:

```php
public function report(Exception $e)
{
    if ($this->shouldReport($e)) {
        app('opbeat')->catchException($e);
    }
    parent::report($e);
}
```

Create the Opbeat configuration file (``config/opbeat.php``):

```bash
$ php artisan vendor:publish --provider="Opbeat\OpbeatLaravel\OpbeatLaravelServiceProvider"
```

Add your DSN to ``.env``:

```
OPBEAT_APP_ID=bf948ea29c
OPBEAT_ORGANIZATION_ID=4c394af520484784a993cc8977e7c0ce
OPBEAT_ACCESS_TOKEN=3a21ef7091b4082d12b0280f81c7b02c74a657d5
```

## Laravel 4.x

Install the ``saritasa/opbeat-laravel`` package:

```bash
$ composer require saritasa/opbeat-laravel
```

Add the Opbeat service provider and facade in ``config/app.php``:

```php
'providers' => array(
    // ...
    'Opbeat\OpbeatLaravel\OpbeatLaravelServiceProvider',
)

'aliases' => array(
    // ...
    'Opbeat' => 'Opbeat\OpbeatLaravel\OpbeatFacade',
)
```

Create the Opbeat configuration file (``config/opbeat.php``):

```bash
$ php artisan config:publish saritasa/opbeat-laravel
```

## Lumen 5.x

Install the ``saritasa/opbeat-laravel`` package:

```bash
$ composer require saritasa/opbeat-laravel
```

Register Opbeat in ``bootstrap/app.php``:

```php
$app->register('Opbeat\OpbeatLaravel\OpbeatLumenServiceProvider');

# Opbeat must be registered before routes are included
require __DIR__ . '/../app/Http/routes.php';
```

Add Opbeat reporting to ``app/Exceptions/Handler.php``:

```php
public function report(Exception $e)
{
    if ($this->shouldReport($e)) {
        app('opbeat')->catchException($e);
    }
    parent::report($e);
}
```

Create the Opbeat configuration file (``config/opbeat.php``):

```php
<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Set up exception tracker https://opbeat.com/
    |--------------------------------------------------------------------------
    */

    'app_id' => env('OPBEAT_APP_ID', ''),
    'organization_id' => env('OPBEAT_ORGANIZATION_ID', ''),
    'access_token' => env('OPBEAT_ACCESS_TOKEN', ''),
];
```

## Contributing

First, make sure you can run the test suite. Install development dependencies :

```bash
$ composer install
```

You may now use phpunit :

```bash
$ vendor/bin/phpunit
```


## Resources

* [Bug Tracker](http://github.com/saritasa/opbeat-laravel/issues)
* [Code](http://github.com/saritasa/opbeat-laravel)
