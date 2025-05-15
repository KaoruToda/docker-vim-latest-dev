# ベースイメージとして Ubuntu の最新 LTS を使用
FROM ubuntu:latest

LABEL maintainer="Kaoru"
LABEL description="Docker image for building Vim from source"

ENV TERM=xterm-256color

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    git \
    ca-certificates \
    npm \
    clangd \
    gopls \
    python3-pip \
    python3-pylsp \
    build-essential \
    ncurses-dev \
    git \
    liblua5.3-dev \
    python3-dev \
    ruby-dev \
    lua5.3 \
    python3 \
    ruby \
    libperl-dev \
    perl \
    gettext \
    libxt-dev \
    libgtk-3-dev \
    libxmu-dev \
    libmotif-dev \
    libsm-dev \
    libice-dev \
    libncursesw5-dev \
    libtool \
    autoconf \
    automake \
    pkg-config  \
    zsh

#    python3-pyls
#    && rm -rf /var/lib/apt/lists/*

RUN npm install -g deno


RUN pip install --break-system-packages python-lsp-server


WORKDIR /home/ubuntu/vim

RUN git clone --depth 1 https://github.com/vim/vim.git .

RUN ./configure \
    --with-features=huge \
    --enable-multibyte \
    --enable-gui=auto \
    --enable-luainterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-perlinterp \
    --enable-cscope \
    --with-compiledby="Docker User" && \
    make -j$(nproc) && \
    make install


# 作業ディレクトリを ubuntu のホームディレクトリに設定
WORKDIR /home/ubuntu

# 以降のコマンドを ubuntu ユーザーとして実行
USER ubuntu

ENV PATH="/usr/local/bin:$PATH"

# コンテナ起動時のデフォルトコマンドを vim に設定
CMD ["vim"]
