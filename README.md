# peercaststation-docker

Docker コンテナで動く PeerCastStation です。相性の良いバージョンの
mono ランタイムが同梱されており、隔離された環境で動作します。

## 要るもの

Docker が必要です。インストールの手順は Docker のサイトを参照してください。
(https://docs.docker.com/installation/)

## インストール

システムにサービスとしてインストールします。init スクリプトを
/etc/init.d にコピーしてください。

    $ sudo install -m 755 peercaststation-docker /etc/init.d
    $ sudo service daemon-reload

ブート時に起動させたい場合は以下のように設定してください。

    $ sudo update-rc.d peercaststation-docker defaults 98 02

## 使い方

サービスを起動するには以下のようにしてください。http://localhost:7144/
で HTML UI にアクセスできるようになります。

    $ sudo service peercaststation-docker start

初回起動時には Docker Hub からイメージがダウンロードされます。これには
数分かかることがあります。

サービスを停止するには以下のようにしてください。

    $ sudo service peercaststation-docker stop

設定ファイルは /etc/peercaststation/PeCaSettings.xml に保存されます。
