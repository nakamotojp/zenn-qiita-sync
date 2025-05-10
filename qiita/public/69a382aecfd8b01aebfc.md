---
title: とりあえずHasuraチュートリアルをDockerとcockroachDBでやる
tags:
  - cockroachdb
  - Hasura
  - dini
private: false
updated_at: '2024-06-14T21:08:12+09:00'
id: 69a382aecfd8b01aebfc
organization_url_name: null
slide: false
ignorePublish: false
---
追記：https://qiita.com/nakamoto/items/dd805fa555f1f3a7c2fa

↑Hasuraを使うなら、cockroachDBではなく、Neonにしたほうが良いです↑

# 前提

- HasuraチュートリアルをDockerとcockroachDBでやる日本語公式ページはない
- Hasura日本語公式ページには、無料のHerokuを利用するチュートリアルがあるが、2024年現在Herokuは有料である
- Windows環境で試した

## 見たページ
- https://hasura.io/learn/ja/graphql/hasura/setup/
- https://www.cockroachlabs.com/docs/stable/hasura-getting-started
- https://cloudandbuild.jp/blog/article-6
- https://qiita.com/mycndev/items/fc7a8fecd7d0b0d09828
- https://x.com/nakamotojp/status/1801466370267431401
- https://hasura.io/docs/latest/databases/postgres/cockroachdb/getting-started/docker/

## 開始
- 基本教材
- https://hasura.io/docs/latest/databases/postgres/cockroachdb/getting-started/docker/


### 手順

#### CockroachDBの準備

1. https://www.cockroachlabs.com/ にアクセス
1. 右上Startなんちゃらをクリック![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/4dcddf5e-8104-8bbd-a8f2-226d8f1c1888.png)
1. Googleアカウントでログインすると登録もできる![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/cdced013-8b7d-d775-197f-26a0ac78defc.png)
1. 紫色のアイコンの形は見なかったことにする（わたしはずっとそうしてる）






#### VSCodeの準備

https://qiita.com/YurimyMiyu/items/5ce7821f1e3e5905c3ee

#### Dockerの準備

https://matsuand.github.io/docs.docker.jp.onthefly/get-docker/


#### dockerファイルをダウンロードしてDocker上で実行するまで

1. VSCodeのアイコンをダブルクリックしてVSCodeを起動しておく
1. Docker Desktopを起動します。WindowsでもMacでもDockerのアイコンをダブルクリックすると起動できるんじゃないかと思います。
1. マイドキュメントに開発フォルダを用意しておく。名前はDevとか開発フォルダとわかれば何でもよしっ。今回はDevに統一。
1. Devフォルダの中に今回の学習用フォルダHasura-firstフォルダを作成
1. VSCodeでHasura-firstフォルダを開く。開き方がわからない場合は、VSCode上で「Ctrl+@」を押してターミナルを表示させる
1. ターミナルっていうのは映画でハッカーがカチャカチャやる画面みたいな、文字だけが表示される画面
1. ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/a859f0e6-d860-06aa-92fd-5a6648ad4c65.png)

1. そんなハッカー的な画面は開いた時は特段表示はほとんどなにもない状態。とりあえずターミナル上の何処かを適当にクリックして、先程作ったHasura-firstフォルダまでのパスをコピー&ペーストする。
1. Hasura-firstまでのパスのパスって何？と思った人は、Hasura-firstフォルダを開いた状態で、フォルダ表示の上に有る次のような名前部分がパス。
1. ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/ae596b5e-22ff-4930-e61e-ca374c948e40.png)
1. ここをクリックするとご利用のPCの設定により次のような文字に変わるので適当にその文字全部をコピーする。
1. `C:\Users\abc\Documents\Dev\hasura-first`
1. VSCodeに戻りそんなほとんど何もない状態の画面で `cd ` のあとにペーストすると、さっきコピーしたパスがペーストされる。つまり、次のような感じの内容を実行することになる
1. `cd C:\Users\abc\Documents\Dev\hasura-first`
1. 実行はEnterキーを押す
1. `curl https://raw.githubusercontent.com/hasura/graphql-engine/master/install-manifests/docker-compose-cockroach/docker-compose.yaml -o docker-compose.yaml`

1. すると `docker-compose.yaml` ファイルがダウンロードされる
1. ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/394009eb-57de-3f37-4322-8b5dfcced5d3.png)
1. VSCodeのターミナルの同じ場所で次のコマンドを実行します
1. `docker compose up -d`
1. するとDocker上に、これまでの操作で用意したdocker用のHasuraファイルが実行されます。
1. Docker Desktop上には次のようにHasuraのプロジェクトが実行されている状態になります
1. ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/18f4ea92-8795-34af-deba-7f7603826c4d.png)

1. もし、このへんまででちょっと難しいと思ったら、有料相談をご活用なさって下さい。

https://park.jp/service_menu/2491


#### Hasuraを表示

1. http://localhost:8080/ をクリックしてブラウザでHasuraを表示
1. localhostというのは今見ている自分のPCを意味します
1. :8000ってところは、日本語にすると:が「ポートの」という意味です。つまり、ポートの8000ってところを見に行ってます。
1. ポートの8000っていうのは、住所で言うところの番地を意味します。あまり深く考えないで下さい。
1. ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/40e7dc38-b24a-fb37-4fe3-069b895dbf45.png)
これでHasuraを操作できます。

#### CockroachDBを Hasuraに接続します

1. http://localhost:8080/console/data/v2/manage/connect にアクセス
1. ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/e5e23ede-c988-018b-0436-a34031135ac8.png)

1. CockroachDBを選択
1. http://localhost:8080/console/remote-schemas/manage/add にアクセス
1. CockroachDBの右上 `Connect` をクリック
1. ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/b2b7fcab-8e1f-110b-f706-b5acc5e69590.png)

1. こんな感じで選択した表示の

1. この `Copy` をクリック
1.![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/91898d10-ef06-fec8-5f85-09bac2e6c2d8.png)

1. 使うのはこの部分から `?sslmode=verify-full` を切り取った部分だけなので、メモ帳にコピーしたものを貼り付けてこの部分だけにする。内容は個人個人で少しづつ異なる。
1. `postgresql://〇〇:<ENTER-SQL-USER-PASSWORD>@〇〇-0000.6xw.aws-ap-southeast-1.cockroachlabs.cloud:12345/defaultdb?sslmode=verify-full`
1. `postgresql://〇〇:<ENTER-SQL-USER-PASSWORD>@〇〇-0000.6xw.aws-ap-southeast-1.cockroachlabs.cloud:12345/defaultdb`
1. から `?sslmode=verify-full` を切り取った残りの次のものを利用する
1. `postgresql://〇〇:<ENTER-SQL-USER-PASSWORD>@〇〇-0000.6xw.aws-ap-southeast-1.cockroachlabs.cloud:12345/defaultdb`
1. なお、 `defaultdb` は、CockroachDBで作成したデータベース名。
1. そして、 `<ENTER-SQL-USER-PASSWORD>` 部分を自分のCockroachDBのパスワードに置き換える
1. パスワードが `123456` の場合は次のようになる。
1. `postgresql://〇〇:123456@〇〇-0000.6xw.aws-ap-southeast-1.cockroachlabs.cloud:12345/defaultdb`
1. このパスワードを置き換えた文字列を再度コピーしておく
1. http://localhost:8080/console/remote-schemas/manage/add を開く
1. 先ほどコピーしたやつをGraphQL Service URLに貼り付けて右下の `Connect` をクリック
1. ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/38ce96d0-9c3b-5a72-662d-3009c9445abd.png)
1. すると接続完了![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/9a58dc7d-3a1d-4080-6bdd-6cc44540b053.png)
1. ここまでで、CockroachDBとHasuraの接続ができた
1. 補足として本当はenvironment variableで設定した方が良い。多分 `.env` 保存するんだろうけどドキュメント書いてあるところ分からなかったから保留![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/1842ffd5-379f-0ee9-7480-9bdc165f24d6.png)

#### dockerベースのURL

今回Dockerを利用しているので次のURLを参考にします

https://hasura.io/docs/latest/deployment/deployment-guides/docker/#docker-networking

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/06817411-532f-ab77-8398-a561900d5e47.png)


![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/4748e71f-6267-6961-4420-90efc5e99ff0.png)

#### ここまで来ていながら

- ここまで来ていながらHasuraはDockerじゃなくても良くね？っておもったので、そもそも登録していたHasuraにログイン

- https://cloud.hasura.io/
- 基本的な設定はこれまでと同様 `DatabaseURL` で、最後の `?sslmode=verify-full` を削除して `Connect` しないと、 `root certificate error` になる点はHasuraWeb側でも同じなので注意。
- なお、この削除する操作がわからず3時間は設定が止まってしまった
- これ以降の操作は公式ページを見ると日本語で書いてある。なぜここまでは、公式ページを見ないのか思い出せたら思い出してみて。
- https://hasura.io/learn/ja/graphql/hasura/data-modeling/

- ご相談お気軽に
- https://park.jp/service_menu/2491
