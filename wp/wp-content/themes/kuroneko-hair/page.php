<?php get_header(); ?>
        <div class="container-fluid content">
            <div class="row">
                <div class="col-lg-8">
                    <main class="main">
                        <?php if( have_posts() ) : ?>
                            <?php while( have_posts() ) : the_post(); ?>
                                <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                                    <header class="content-Header">
                                        <h1 class="content-Title">
                                            <?php the_title(); ?>
                                        </h1>
                                    </header>
                                </article>
                            <?php endwhile; ?>
                        <?php endif; ?>
                    </main>
                </div> <!-- / .col-lg-8 -->
                <?php get_sidebar(); ?> <!-- col-lg-4 -->
            </div> <!-- / .row -->
        </div> <!-- / .container-fluid content -->
<?php get_footer(); ?>
