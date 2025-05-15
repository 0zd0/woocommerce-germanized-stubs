<?php
declare(strict_types=1);

use StubsGenerator\Finder;

return Finder::create()
    ->in('source/woocommerce-germanized')
    ->in('source/overrides')
    ->notPath('source/woocommerce-germanized/vendor')
    ->sortByName(true);
