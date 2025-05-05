<?php
function neko_theme_setup() {
    add_theme_support( 'title-tag' );
}
add_action( 'after_setup_theme', 'neko_theme_setup' );
