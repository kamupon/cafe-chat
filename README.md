cafe-chat
-----------------------------------------------

# お勉強
## git
http://blog.takanabe.tokyo/2014/12/13/74/

## JavaEE 7
http://masatoshitada.hatenadiary.jp/entry/2015/01/04/120321

## Apache Maven
http://www.techscore.com/tech/Java/ApacheJakarta/Maven/index/

## GlassFish
かなり日本語のドキュメントが少ない。
 - [公式サイト](https://glassfish.java.net/)
 - [GlassFish4.1を利用するにあたって](http://www.coppermine.jp/docs/programming/2014/12/using-glassfish.html)

## React.js
こちらは技術者ブログなどでドキュメントは豊富。
 - [公式サイト](https://facebook.github.io/react/)
 - [出来る限り短く説明するReact.js入門](http://qiita.com/rgbkids/items/8ec309d1bf5e203d2b19)

# 環境設定(インストール編)

## Java
[JDK 8u77](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

## IDE
今回は Eclipse を例にとって説明します.
### ダウンロード
https://eclipse.org/downloads/
バージョン指定は特に無し.最新版推奨.
### インストール
インストーラに従ってダウンロードします.
### プラグイン
- GlassFish Tools
Eclipseマーケットプレイスよりプラグインのインストールをします.

## Postgres SQL
### ダウンロード
http://www.postgresql.org/download/
### インストール
インストーラに従ってダウンロードします.

## Payara GlassFish
### ダウンロード
Payara 4.1.1.154 (Full) をダウンロードします.
http://www.payara.fish/downloads
### 配置
任意の場所に配置します.インストールは不要です.
特にこだわりがない場合は /Applications/payara41 などに配置してください.

### Maven
以下からダウンロードする.
[Maven Apache](http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip)


# 環境設定(プロジェクト固有設定編)

## GlassFish Server
### IDEにてServerの作成
基本的には以下の手順に従います.
https://blogs.oracle.com/yosshi/entry/glassfish%E3%81%A8eclipse%E3%81%AE%E9%80%A3%E6%90%BA%E6%96%B9%E6%B3%95%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6
注意点は 「Payara」を使用するので、「アプリケーション・サーバ・ディレクトリ」をPayaraに設定します.
### JDBCの設定
ミドルウェアのGlassFishに、接続するDBを登録します.
GlassFishの管理コンソール画面に遷移します（デフォルトは http://localhost:4848）.

#### JDBC Connection Pools
 - Pool Name
pool/test
 - Resource Type
javax.sql.DataSource
 - Datasource Classname
org.postgresql.ds.PGSimpleDataSource
- serverName
localhost
- portNumber
5432
- databaseName
（作成したDB）
- User
（作成したユーザ）
- Password
（作成したユーザパスワード）

#### JDBC Resource
