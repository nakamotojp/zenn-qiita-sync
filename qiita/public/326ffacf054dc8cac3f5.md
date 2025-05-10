---
title: Edgeのアドレスバー検索で勝手にBing検索にリダイレクトされるsysredirector.com対策
tags:
  - '#chrome'
  - '#EDGE'
  - '#sysredirector.com'
private: false
updated_at: '2024-04-01T07:58:19+09:00'
id: 326ffacf054dc8cac3f5
organization_url_name: null
slide: false
ignorePublish: false
---
ChatGPT先輩がCopilotに利用されていることもあり、Edgeがデフォルトブラウザになり1年近くになりそうな今日このごろ。

まさかマイクロソフト製のブラウザをデフォルトにする世界になるなんて10年前では考えられませんでした。

1年経過して、Geminiの方が出力が早いのでやっぱりchromeに戻ろうかなっておもっていますが、スイッチングコストの高さを痛感してます。

> Edgeのアドレスバー検索で勝手にBing検索にリダイレクトされるsysredirector.com対策

以前よりEdgeのアドレスバー検索すると、なんだかBingで検索される症状が時々発生していました。

たいていアップデートのタイミングで勝手に設定がデフォルトにもどるから、設定をし直せばどうにかなってました。

ただ、今回のアップデートで、検索エンジンをGoogleにしても、Bingにリダイレクトするsysredirector.comという処理が入っているのは私だけなのかもしれないという状況になってます。

sysredirector.comがなにかについては、朝の忙しい時間なので調べてません。

ただ、Bing検索はなれないので、Google検索に確実に戻す方法を勝手に考えました。

> sysredirector.comでリダイレクトされる仕組み

なんとなく、google.comをデフォルトにしていることで、google.comをキーにしてリダイレクトされる気がしました。

未検証です。

そこで、 `https://www.google.co.jp/search?q=` をキーにすればよいのではと適当に思いつき、設定したらリダイレクトされないので一応良いかなというのが今です。

> 設定手順

1. 次のEdge設定URLをクリック
[edge://settings/?search=%E3%83%90%E3%83%BC%E3%81%A8%E6%A4%9C%E7%B4%A2](edge://settings/?search=%E3%83%90%E3%83%BC%E3%81%A8%E6%A4%9C%E7%B4%A2)


1. 黄色になっている `バーと検索` をクリック
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/9c1526ca-5eda-7fa8-a204-47fa9b1d1cfc.png)


1.  `検索エンジンの管理` をクリック
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/e91e46b5-fb5e-22e2-95da-263af0358ef7.png)

1.  右上の `追加` をクリック
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/359e0469-b36d-f763-94bc-1bf5baa95f30.png)

1.  上から順番に `Google日本` と `https://www.google.co.jp/search?q=%s` を利用してコピー&ペーストで設定する
1.  ![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/5d7a1277-9ae5-bba7-5a1a-d52f3055467f.png)
1. `Google日本` の右端にある `・・・` をクリックして `規定に設定する` を選択して追加する
![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/b443b3e8-773c-4629-2ebb-5b70012f8dfc.png)

1.  ページを戻って次のようになってたらOK

![image.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/39256/cdc828ef-de46-6160-9358-ce918cd7d000.png)

> 教えて

sysredirector.comの処理が入るのが私だけだったら教えて下さい。

一度クリーンインストールし直そうかなって思いながら2年ぐらい経過中。
