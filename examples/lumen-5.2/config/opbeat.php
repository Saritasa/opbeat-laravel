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

    'app_id' => env('OPBEAT_APP_ID', 'bf948ea29c'),
    'organization_id' => env('OPBEAT_ORGANIZATION_ID', '4c394af520484784a993cc8977e7c0ce'),
    'access_token' => env('OPBEAT_ACCESS_TOKEN', '3a21ef7091b4082d12b0280f81c7b02c74a657d5'),
    'enable_exception_handler' => false,
    'enable_error_handler' => false
];
