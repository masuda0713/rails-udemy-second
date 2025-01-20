FROM ruby:3.2.2
RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs
RUN npm install --global yarn

# rubygemsのアップデートを追加
RUN gem update --system

# ホストのユーザーIDを取得し、コンテナ内ユーザーを作成
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID appgroup && useradd -m -u $UID -g appgroup appuser

WORKDIR /samplerails
COPY Gemfile Gemfile.lock /samplerails/
RUN bundle install

# コンテナ内で指定のユーザーを使用
USER appuser
CMD ["rails", "server", "-b", "0.0.0.0"]
