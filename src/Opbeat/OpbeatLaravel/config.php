<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Set up exception tracker https://opbeat.com/
    |--------------------------------------------------------------------------
    |
    | Collect and analyze exceptions statistics online
    | Unofficial client https://github.com/madsleejensen/opbeat-php
    |
    */

    'app_id' => env('OPBEAT_APP_ID', ''),
    'organization_id' => env('OPBEAT_ORGANIZATION_ID', ''),
    'access_token' => env('OPBEAT_ACCESS_TOKEN', ''),
    'enable_exception_handler' => false,
    'enable_error_handler' => false
];
