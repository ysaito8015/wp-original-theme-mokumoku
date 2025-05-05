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
- このリポジトリでは Docker compose で構築している
    - wordpress:latest
        - apache2 2.4.56-1~deb11u1
    - mysql:5.7
- `./wp/wp-content` ディレクトリ以下に設置しているもの
    - 開発するテーマファイル
    - インストールしたプラグイン
        - インストールしたプラグインの名前のリスト
    - アップロードしたメディア


### `./wp` 以下のパーミッション問題の解決法
- docker のコンテナ内の実行時ユーザの UID と GID がホストと違うために、bind したときに permission error が起きる
    - 参考 [dockerのmount volumeのpermissionをfixuidでなんとかする](https://qiita.com/takumiabe/items/fee2e76e3a39fd853589)
- WordPress が配備されるディレクトリは別のディレクトリを bind mount して、同期が必要なディレクトリのみシェルスクリプトでホストとコンテナの中身を rsync する

#### make_env.sh

```bash
#!/usr/bin/env bash
set -euxo pipefail
cd ${dirname $0}/.. # ./bin/make_env.sh に配備されていることを想定
PWD=$(pwd)

touch .env
echo "UID=$(id -u ${USER})" >> ${PWD}/.env
echo "GID=$(id -g ${USER})" >> ${PWD}/.env
echo "UNAME=${USER}" >> ${PWD}/.env
```

#### Dockerfile

```Dockerfile
#...
RUN useradd -g www-data containeruser # add user to apache2 daemon group
RUN USER=containeruser && \
    GROUP=containeruser && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.5.1/fixuid-0.5.1-linux-amd64.tat.gz | tar -C /usr/local/bin -zxf - && \
    chmod 4755 /ust/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "uset: ${USER}\ngroup: ${GROUP}\n" > /etc/fixuid/config.uml

USER containeruser:containeruser

CMD ["apache2-foreground"]
```

#### compose.yaml

```yaml

wp:
  image: wordpress:lates
  user: "${UID}:${GID}"
```


#### 使い方

```bash
$ ./bin/make_env.sh
$ docker compse build
$ docker compose up -d
```


### docker への秘密情報の受け渡し
- `compose.yaml` 内で `.env` ファイルを指定して読み込み


#### Host 側で `docker exec` する際に
- `direnv` で `.env` ファイルと同じような設定を `.envrc` に記述する
    - `.envrc` は shell-script 形式の記述なので注意
