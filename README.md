# Steampipe Sandbox

**Read this in other languages: 日本語 | [English](README.en.md)**

[Steampipe](https://steampipe.io/) を使って AWS リソースを探索するためのサンドボックス環境です。Dev Containers を利用して構築されています。

## 特徴

- 🐳 Dev Container ベースのセットアップ — ローカルへのインストール不要
- 🔌 Steampipe と AWS プラグインをプリインストール済み
- 🚀 コンテナ起動後すぐに SQL で AWS リソースをクエリ可能

## 前提条件

- [Docker](https://www.docker.com/)
- [Visual Studio Code](https://code.visualstudio.com/) と [Dev Containers 拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- AWS の認証情報の設定（例: `~/.aws/credentials`、環境変数、または `aws login`）

## Getting Started

1. このリポジトリをクローンします。

    ```bash
    git clone https://github.com/JHashimoto0518/steampipe-sandbox.git
    cd steampipe-sandbox
    ```

2. VS Code でリポジトリを開き、表示されるプロンプトから Dev Container で再度開きます
   （またはコマンドパレットから **Dev Containers: Reopen in Container** を実行）。

3. コンテナの準備が整ったら、ターミナルから直接 Steampipe のクエリを実行できます。例えば、サンプルクエリを実行する場合：

    ```bash
    steampipe query query-examples/ec2.sql
    ```

## クエリ例

起動中の EC2 インスタンスを一覧表示：

```sql
select
  instance_id,
  instance_type,
  instance_state,
  region
from
  aws_ec2_instance
where
  instance_state = 'running';
```

バージョニングが無効な S3 バケットを一覧表示：

```sql
select
  name,
  region
from
  aws_s3_bucket
where
  versioning_enabled = false;
```

## 参考リンク

- [Steampipe](https://steampipe.io/)
- [Steampipe AWS Plugin](https://hub.steampipe.io/plugins/turbot/aws)

## 関連コンテンツ

- [SteampipeとExcel Power Queryで実現するAWS構成定義書自動化ガイド](https://zenn.dev/jhashimoto/articles/steampipe-powerquery-aws-configdoc)（記事）
- [SteampipeとExcel Power QueryでAWS構成定義書の作成を自動化する - Speaker Deck](https://speakerdeck.com/jhashimoto/steampipe-powerquery-aws-configdoc)（スライド）
- [JAWS-UG東京 ランチタイムLT会 #36 - YouTube](https://www.youtube.com/watch?v=uoA83sV7eUw)（動画）
