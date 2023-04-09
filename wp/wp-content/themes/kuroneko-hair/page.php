<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="ゆったり時間と癒しの美容室サンプルサイト">
    <title>Kuroneko Hair</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500&display=swap" rel="stylesheet">
    <link href="./assets/css/theme-styles.css" rel="stylesheet" media="all">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body>
    <div class="content-Wrap">
        <header role="banner" class="header">
            <h1 class="header-SiteName">
                <a href="/" class="header-SiteName_Link">
                    <img src="./assets/img/logo.png" alt="Kuroneko Hair">
                </a>
                <span class="header-Tagline">ゆったり時間と癒しの美容室サンプルサイト</span>
            </h1>
            <nav class="header-Nav">
                <button type="button" class="header-NavToggle" aria-controls="global-Nav" aria-expanded="false" aria-label="メニュー開閉">
                    <span class="header-NavToggle_Bar"></span>
                </button>
                <div class="header-Nav_Inner" id="global-Nav" aria-hidden="true">
                    <ul class="header-Nav_Items">
                        <li><a href="#">ホーム</a></li>
                        <li><a href="#">コンセプト</a></li>
                        <li><a href="#">ヘアスタイル</a></li>
                        <li><a href="#">メニュー</a></li>
                        <li><a href="#">店舗案内</a></li>
                    </ul>
                    <form role="search" method="get" class="search-form" action="#">
                        <label>
                            <input type="search" class="search-field" placeholder="検索 &hellip;" value="" name="s" />
                        </label>
                        <input type="submit" class="search-submit" value="検索" />
                    </form>
                </div>
            </nav>
        </header>
        <div class="container-fluid content">
            <div class="row">
                <div class="col-lg-8">
                    <main class="main">
                        <article>
                            <header class="content-Header">
                                <h1 class="content-Title">
                                    店舗案内
                                </h1>
                            </header>
                            <div class="content-Body">
                                <div class="content-EyeCatch">
                                    <img src="./assets/img/shop.jpg" alt="">
                                </div>
                                <table class="table-striped">
                                    <tbody>
                                        <tr>
                                            <td>住所</td>
                                            <td>〒000-0000 □□県〇〇市△△区☆☆町000</td>
                                        </tr>
                                        <tr>
                                            <td>電話番号</td>
                                            <td>000-000-0000</td>
                                        </tr>
                                        <tr>
                                            <td>営業時間</td>
                                            <td>平日 10:00〜19:00 / 土・日 9:00〜19:00<br>※受付：カットは閉店1時間前まで、カラーまたはパーマは2時間前まで</td>
                                        </tr>
                                        <tr>
                                            <td>休業日</td>
                                            <td>毎週月曜・第2 &amp; 第4火曜日</td>
                                        </tr>
                                        <tr>
                                            <td>スタッフ</td>
                                            <td>スタイリスト3名／アシスタント2名</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3280.039827139448!2d137.73227565048458!3d34.70417539044434!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x601ade7760d07ed9%3A0xf0a52daac3b91a51!2z5rWc5p2-!5e0!3m2!1sja!2sjp!4v1619326103946!5m2!1sja!2sjp" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                            </div>
                        </article>
                    </main>
                </div>
                <div class="col-lg-4">
                    <aside class="sidebar">
                        <div class="widget_block">
                            <h2>カテゴリー</h2>
                            <ul class="wp-block-categories-list wp-block-categories">
                                <li><a href="#">お知らせ</a></li>
                                <li><a href="#">アイテム</a></li>
                                <li><a href="#">キャンペーン</a></li>
                                <li><a href="#">ブログ</a></li>
                            </ul>
                        </div>
                        <div class="widget_block">
                            <h2>アーカイブ</h2>
                            <ul class="wp-block-archives-list wp-block-archives">
                                <li><a href="#">2021年3月</a></li>
                                <li><a href="#">2020年11月</a></li>
                                <li><a href="#">2020年10月</a></li>
                                <li><a href="#">2020年9月</a></li>
                            </ul>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
        <footer role="contentinfo" class="footer">
            <div class="footer-Widgets">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="widget_block">
                                <h2>最近の投稿</h2>
                                <ul class="wp-block-latest-posts wp-block-latest-posts__list">
                                    <li><a href="#">雨の日キャンペーン開催</a></li>
                                    <li><a href="#">ロケーション撮影に行きました</a></li>
                                    <li><a href="#">臨時休業のお知らせ</a></li>
                                    <li><a href="#">パーソナルカラーの研修に行ってきました</a></li>
                                    <li><a href="#">夏季休業のお知らせ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="widget_block">
                                <h2>タグ</h2>
                                <p class="wp-block-tag-cloud">
                                    <a href="#" class="tag-cloud-link">キャンペーン</a>
                                    <a href="#" class="tag-cloud-link">シャンプー</a>
                                    <a href="#" class="tag-cloud-link">スタッフ加入</a>
                                    <a href="#" class="tag-cloud-link">トリートメント</a>
                                    <a href="#" class="tag-cloud-link">パーソナルカラー</a>
                                    <a href="#" class="tag-cloud-link">プロモーション</a>
                                    <a href="#" class="tag-cloud-link">ヘアカラー</a>
                                    <a href="#" class="tag-cloud-link">ホームケア</a>
                                    <a href="#" class="tag-cloud-link">休業案内</a>
                                    <a href="#" class="tag-cloud-link">撮影</a>
                                    <a href="#" class="tag-cloud-link">研修報告</a>
                                    <a href="#" class="tag-cloud-link">雑誌掲載</a>
                                    <a href="#" class="tag-cloud-link">雨の日</a>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="widget_block">
                                <h2>サイト内検索</h2>
                                <div id="" class="widget_block widget_search">
                                    <form role="search" method="get" action="#" class="wp-block-search__button-outside wp-block-search__text-button wp-block-search">
                                        <div class="wp-block-search__inside-wrapper"><input type="search" id="wp-block-search__input-1" class="wp-block-search__input" name="s" value="" placeholder="" required /><button type="submit" class="wp-block-search__button ">検索</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <p class="footer-Copyright">
                <small>&copy; 2021 Kuroneko Hair Sample </small>
            </p>
        </footer>
    </div>
    <script src="./assets/js/theme-common.js"></script>
</body>

</html>
