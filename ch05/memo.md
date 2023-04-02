# テンプレートファイルを作成する
## Step 1 共通部分を作成する
### ヘッダ、フッタを切り出す
- `./wp/wp-content/themes/kuroneko-hair/index.php` を適宜編集して切り出していく


## Step 2 固定ページ用のテンプレートファイルを作成する
### 固定ページのテンプレートファイルの優先順位を確認する
1. page-$slug.php
2. page-$id.php
3. page.php
4. singular.php
5. index.php

### Step 2-1 page.php を作成する

```shell
$ cp ./tmp/kuroneko_sample/Chapter5/Step2/HTML/page.html ./wp/wp-content/themes/kuroneko-hair/page.php
```
