.PHONY: help build up down restart exec test init shell clean

help: ## ヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Dockerイメージをビルド
	docker compose build

up: ## コンテナをバックグラウンドで起動
	docker compose up -d

down: ## コンテナを停止
	docker compose down

restart: ## コンテナを再起動
	docker compose restart

exec: ## コンテナ内にbashで入る
	docker compose exec rspec bash

test: ## RSpecテストを実行
	docker compose exec rspec rspec

test-doc: ## RSpecテストを詳細表示で実行
	docker compose exec rspec rspec -f d

test-file: ## 特定のファイルをテスト (例: make test-file FILE=spec/calc_spec.rb)
	docker compose exec rspec rspec $(FILE)

init: ## RSpecを初期化
	docker compose exec rspec rspec --init

shell: ## コンテナをrunで起動してbashに入る
	docker compose run --rm rspec bash

clean: ## コンテナとボリュームを削除
	docker compose down -v

ruby-version: ## Rubyのバージョン確認
	docker compose exec rspec ruby --version

rspec-version: ## RSpecのバージョン確認
	docker compose exec rspec rspec --version
