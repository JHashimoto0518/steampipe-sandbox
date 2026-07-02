# Steampipe Sandbox

**Read this in other languages: [日本語](README.md) | English**

A sandbox environment for exploring AWS resources using [Steampipe](https://steampipe.io/), powered by Dev Containers.

## Features

- 🐳 Dev Container-based setup — no local installation required
- 🔌 Steampipe and the AWS plugin pre-installed
- 🚀 Ready to query your AWS resources with SQL right after container startup

## Prerequisites

- [Docker](https://www.docker.com/)
- [Visual Studio Code](https://code.visualstudio.com/) with the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- AWS credentials configured (e.g. via `~/.aws/credentials` or environment variables, or `aws login`)

## Getting Started

1. Clone this repository:

    ```bash
    git clone https://github.com/JHashimoto0518/steampipe-sandbox.git
    cd steampipe-sandbox
    ```

2. Open the repository in VS Code, then reopen it in the Dev Container when prompted
   (or run **Dev Containers: Reopen in Container** from the Command Palette).

3. Once the container is ready, you can run Steampipe queries directly from the terminal.

    to run a sample query:

    ```bash
    steampipe query query-examples/ec2.sql
    ```

    to run queries interactively:

    ```bash
    steampipe query
    ```

## Example Queries

List all running EC2 instances:

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

List S3 buckets without versioning enabled:

```sql
select
  name,
  region
from
  aws_s3_bucket
where
  versioning_enabled = false;
```

## References

- [Steampipe](https://steampipe.io/)
- [Steampipe AWS Plugin](https://hub.steampipe.io/plugins/turbot/aws)

## Related Content

- [SteampipeとExcel Power Queryで実現するAWS構成定義書自動化ガイド](https://zenn.dev/jhashimoto/articles/steampipe-powerquery-aws-configdoc) (Article, Japanese)
- [SteampipeとExcel Power QueryでAWS構成定義書の作成を自動化する - Speaker Deck](https://speakerdeck.com/jhashimoto/steampipe-powerquery-aws-configdoc) (Slides, Japanese)
- [JAWS-UG東京 ランチタイムLT会 #36 - YouTube](https://www.youtube.com/watch?v=uoA83sV7eUw) (Video, Japanese)
