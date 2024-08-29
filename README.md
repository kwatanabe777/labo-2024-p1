# プログラムコンペ用実行環境

## 概要
- コンペ用の共通実行環境  
  - php-8.3.10 (コマンドラインツールのみ)
  - pcntl(プロセス制御) extensionを有効にしてある
  - リソース制限を入れてある  
    cpu:2, mem:2GB  
- このコンテナ定義(docker-compose.yaml)で良いパフォーマンスが出るように開発を行う
- 実際の計測時も同じコンテナで行う(コンテナ起動までの時間は計測対象外)


## 利用方法
- setup.shをsourceするとシェル関数labo-phpが登録されるので、コマンドラインにて実行する  

- セットアップ
  ```bash
  . setup.sh
  ```

- 実行例  
  - 初回実行はimageのpullとbuildが走るので少し時間がかかる  
  - 本directory外では実行できないので注意(docker-compose.yamlを置けば可能)
  ```bash
  $ labo-php -v
   PHP 8.3.10 (cli) (built: Aug  1 2024 19:53:18) (NTS)
   Copyright (c) The PHP Group
   Zend Engine v4.3.10, Copyright (c) Zend Technologies
  
  $ labo-php -f src/hello.php
   Hello labo!!
  
  $ cd src
  $ labo-php -f hello.php
   Hello labo!!
  ```

- CleanUp  
  コンテナimageとbuildキャッシュが残るので気になるなら削除
  ```bash
  docker rmi php:8.3.10-cli-labo
  docker builder prune
  #(他の未使用キャッシュも全て削除されるので注意)
  ```
  関数削除
  ```bash
  unset -f labo-php
  ``` 

