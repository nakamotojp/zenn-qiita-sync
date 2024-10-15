# zenn-qiita-sync
<p align="left">
   <img src="https://img.shields.io/badge/language-typescript-blue?style"/>
   <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/github/license/anmol098/waka-readme-stats"/></a>
   <a href="./README.md"><img src="https://img.shields.io/badge/English-README-informational.svg"/></a>
   <a href="./README.ja.md"><img src="https://img.shields.io/badge/日本語-README-informational.svg"/></a>
   <img src="https://img.shields.io/static/v1?label=%F0%9F%8C%9F&message=If%20Useful&style=style=flat&color=BC4E99" alt="Star Badge"/>
</p>

This tool automatically publishes articles to qiita when you push zenn format articles to GitHub. Publishing your articles to multiple platforms can share your knowledge with more people.

<details>
    <summary>&thinsp;&thinsp;<b>Table of Contents</b> (Click to open)</summary>

- [🚀 Getting Started](#-getting-started)
- [🙋‍♂️ Support](#️-support)
- [✉️ Contact](#️-contact)
- [🙏 Acknowledgement](#-acknowledgement)
</details>

## 🚀 Getting Started
You can use this tool by following the steps below. Refer my [repo](https://github.com/C-Naoki/zenn-archive/tree/main) using this tool for practical example.
1. Build directory structure as follows
    ```
    .
    ├── .github
    │   └── workflows
    │       └── publish.yml
    ├── articles
    │   └── <Zenn format articles>
    ├── books
    │   └── <Zenn books (optional)>
    ├── images
    │   └── <Image files used in articles>
    └── qiita
        └── public
            └── <Qiita format articles>
    ```

2. Issue the Qiita access token using `qiita-cli`.
    - I refer you to visit [official repo](https://github.com/increments/qiita-cli/tree/v1) for details.

3. Set the issued token as a secret variable.
   - Go to `https://github.com/<USERNAME>/<REPO>/settings/secrets/actions/new` (by replacing `<USERNAME>` and `<REPO>` with your information).
   - Set the value as `QIITA_TOKEN = <Your Qiita Access Token>`.

        <p align="center">
        <img src="./assets/secrets.png" align=center />
        </p>

4. Create a new workflow (e.g., `publish.yml`) within `.github/workflows` in your own repository.

    <b>Example</b> (Feel free to copy and paste the following)

    ```yml
    name: Publish articles

    on:
      push:
        branches:
          - main
          - master
        workflow_dispatch:

    permissions:
      contents: write

    concurrency:
      group: ${{ github.workflow }}-${{ github.ref }}
      cancel-in-progress: false

    jobs:
      publish_articles:
        runs-on: ubuntu-latest
        timeout-minutes: 5
        steps:
          - name: Checkout
            uses: actions/checkout@v4
            with:
              fetch-depth: 0

          - name: Run
            uses: C-Naoki/zenn-qiita-sync@main
            with:
              qiita-token: ${{ secrets.QIITA_TOKEN }}
    ```

## 🙋‍♂️ Support
💙 If you like this app, give it a ⭐ and share it with friends!

## ✉️ Contact
💥 For questions or issues, feel free to open an [issue](https://github.com/C-Naoki/zenn-qiita-sync/issues). I appreciate your feedback and look forward to hearing from you!

## 🙏 Acknowledgement
I appreciate the following articles and open sources for providing useful information and valuable codes:

- [zennに記事を投稿したらqiitaにも同時に投稿されるツールを作った話](https://qiita.com/shunk_jr/items/7d1029cae8f83ee8fd84)
- [Zenn / Qiitaに投稿する同じ記事を一元管理するGitHubリポジトリを作りました](https://zenn.dev/ot07/articles/zenn-qiita-article-centralized)
- https://github.com/increments/qiita-cli
