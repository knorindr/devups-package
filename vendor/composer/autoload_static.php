<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit4ebc14aa391dbfa98a67d47f3f832280
{
    public static $prefixesPsr0 = array (
        'D' => 
        array (
            'Devups' => 
            array (
                0 => __DIR__ . '/../..' . '/src',
            ),
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixesPsr0 = ComposerStaticInit4ebc14aa391dbfa98a67d47f3f832280::$prefixesPsr0;

        }, null, ClassLoader::class);
    }
}
