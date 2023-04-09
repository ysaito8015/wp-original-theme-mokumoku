<?php get_header(); ?>
        <div class="container-fluid content">
            <div class="row">
                <div class="col-lg-8">
                    <main class="main">
                        <?php if( have_posts() ) : ?>
                            <?php while( have_posts() ) : the_post(); ?>
                                <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                                </article>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </main>
                </div> <!-- / .col-lg-8 -->
            </div> <!-- / .row -->
        </div> <!-- / .container-fluid content -->
<?php get_footer(); ?>
