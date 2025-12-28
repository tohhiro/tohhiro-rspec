# RSpec 学習リポジトリ

Docker を使って RSpec を学習するためのリポジトリです。

## 環境

- Ruby 3.3.0
- RSpec

## セットアップ

### 1. Docker イメージのビルド

```bash
docker compose build
```

### 2. コンテナの起動

```bash
docker compose run --rm rspec
```

コンテナ内の bash が起動します。

## よく使う Docker コマンド

### コンテナに入る

```bash
docker compose run --rm rspec
```

- `--rm`: コンテナ終了時に自動削除
- `rspec`: サービス名（docker-compose.yml で定義）

### バックグラウンドでコンテナを起動

```bash
docker compose up -d
```

### 起動中のコンテナに入る

```bash
docker compose exec rspec bash
```

### コンテナを停止

```bash
docker compose down
```

### イメージを再ビルド（キャッシュなし）

```bash
docker compose build --no-cache
```

### コンテナ内でコマンドを実行

```bash
docker compose run --rm rspec ruby --version
docker compose run --rm rspec rspec --version
```

## RSpec の使い方

コンテナ内で以下のコマンドを実行します。

### RSpec の初期化

```bash
rspec --init
```

これで`.rspec`と`spec/spec_helper.rb`が作成されます。

### テストファイルの作成

例: `spec/sample_spec.rb`

```ruby
RSpec.describe 'サンプルテスト' do
  it '1 + 1 は 2' do
    expect(1 + 1).to eq(2)
  end
end
```

### テストの実行

```bash
# すべてのテストを実行
rspec

# 特定のファイルを実行
rspec spec/sample_spec.rb

# 特定の行のテストを実行
rspec spec/sample_spec.rb:3
```

## ディレクトリ構成

```
.
├── Dockerfile           # Dockerイメージの定義
├── docker-compose.yml   # Docker Composeの設定
├── README.md           # このファイル
├── lib/                # 実装コード（作成予定）
└── spec/               # テストコード（作成予定）
```

## Tips

- ホストの現在のディレクトリがコンテナの`/app`にマウントされます
- コンテナ内で作成したファイルはホストからも確認できます
- `exit`でコンテナから抜けられます
