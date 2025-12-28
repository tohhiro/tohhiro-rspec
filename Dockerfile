# Ruby公式イメージを使用
FROM ruby:3.3.0

# 作業ディレクトリを設定
WORKDIR /app

# RSpecをインストール
RUN gem install rspec

# デフォルトコマンド（bashを起動）
CMD ["/bin/bash"]
