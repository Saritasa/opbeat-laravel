<?php

namespace Opbeat\OpbeatLaravel;

use Illuminate\Support\Facades\Facade;

class OpbeatFacade extends Facade
{
    protected static function getFacadeAccessor()
    {
        return 'opbeat';
    }
}
