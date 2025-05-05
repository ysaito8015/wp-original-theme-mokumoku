<?php
function neko_theme_setup() {
    add_theme_support( 'title-tag' );
}
add_action( 'after_setup_theme', 'neko_theme_setup' );

function neko_enqueue_scripts(){
    wp_enqueue_script( 'jquery' );
    wp_enqueue_script(
        'kuroneko-theme-common',
        get_template_directory_uri() . '/assets/js/theme-common.js',
        array(),
        '1.0.0',
        true
    );
}
add_action( 'wp_enqueue_scripts', 'neko_enqueue_scripts' );
