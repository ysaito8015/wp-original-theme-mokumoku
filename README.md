# WordPress オリジナルテーマ制作入門読書メモ
## 書誌情報
- [技術評論社](https://gihyo.jp/book/2022/978-4-297-12557-8)
- [サポートページ](https://gihyo.jp/book/2022/978-4-297-12557-8/support)


## ch03
- 本書では [Local](https://localwp.com/) を使用して開発環境を構築している
    - Prrefered environment
        - PHP 8.1.9
        - nginx
        - MySQL 8.0.16
- ここでは Docker compose で構築している
    - wordpress:latest
        - apache2 2.4.56-1~deb11u1
    - mysql:5.7

- wordpress イメージの WordPress ファイルを一旦ホスト側に移す


```shell
$ docker pull wordpress:latest
$ dcoker create --name wpcopy wordpress:latest
$ docker cp wpcopy:/var/www/html/wp-content ./wp
$ docker rm wpcopy
```
