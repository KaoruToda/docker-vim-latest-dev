# Docker image for building Vim from source

Download the vim source code from github and build it.

If you want to make major changes to the vim configuration file but don't want to change the vim configuration file you normally use, you will need an environment isolated from the vim environment you normally use.

You may also want to upgrade vim, but want to check in advance whether the configuration file works.

In such cases, this Docker container is useful for verifying the vim configuration file in an isolated environment with a Docker container.

github から vim のソースコードをダウンロードし、ビルドします。

vim の設定ファイルを大幅に変更したいが、普段利用している vim の設定ファイルを変更したくないときに、普段利用している vim の環境とは、分離された環境が必要になるでしょう。
vim のバージョンアップを行いたいが、設定ファイルが動作するか、事前に確認したいこともあるでしょう。

そういった場合に、 docker コンテナで分離された環境で、 vim の設定ファイルを検証するために、この Docker コンテナが役に立ちます。
