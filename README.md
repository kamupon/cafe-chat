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

# 環境設定
## Java8 (JDK8)
[JDK 8u77](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
※ IPAにより[セキュリティ問題](https://www.ipa.go.jp/security/ciadr/vul/20160324-jre.html)が発表されたため

## IDE
今回は Eclipse を例にとって説明します.
### ダウンロード
バージョン指定は特に無し。基本的には[最新版](https://eclipse.org/downloads/)推奨.
インストーラに従ってダウンロードします.

### Eclipseプラグイン
- GlassFish Tools
Eclipseマーケットプレイスよりプラグインのインストールをします.

## Postgres SQL
[Postgres 9.4.5](http://www.postgresql.org/download/)をダウンロードします.
インストーラに従ってダウンロードします.
管理者ユーザー/パスワードなどは任意に設定してください.

## Payara GlassFish
[Payara 4.1.1.161.1 (Full)](http://www.payara.fish/downloads) をダウンロードします.
任意の場所に配置します.インストールは不要です.
特にこだわりがない場合は /Applications/payara41、C:¥Program Files¥payara41 などに配置してください.

### Apache Maven
[Maven Apache](http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip)をダウンロードします.
任意の場所に配置します.
特にこだわりがない場合は /Applications/maven、C:¥Program Files¥maven などに配置してください.

### Gitコマンド
[Git](https://git-for-windows.github.io/)をダウンロードする.


# 環境設定(プロジェクト固有設定編)
## ソースコードの取得
ソースコードのworkspaceディレクトリを作成します.

1. Git Bashを開き以下コマンドを実行します.

``` bash
mkdir -p ~/git/github
```

2. Githubよりソースコードを取得します.

``` bash
cd ~/git/github
git cloen https://github.com/kamupon/cafe-chat.git
```

3. 開発ブランチ(develop)に切り替えを行います.

``` bash
cd ~/git/github/cafe-chat
git fetch --all
git checkout develop
```

4. ソースコードが取得できているかを確認します.

``` bash
ll
```

## GlassFish Server
### IDEにてServerの作成
基本的には[この手順](https://blogs.oracle.com/yosshi/entry/glassfish%E3%81%A8eclipse%E3%81%AE%E9%80%A3%E6%90%BA%E6%96%B9%E6%B3%95%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6)に従います.
注意点は 「Payara」を使用するので、「アプリケーション・サーバ・ディレクトリ」をPayaraに設定します.

### Postgres JDBCドライバの配置
${PAYARA_HOME}/glassfish/domains/domain1/lib/ext 配下にドライバpostgresql-9.4-1204.jdbc42.jarを配置します.
次以降のステップでDataSourceクラスを使用できるようにするために配置します.

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
 - Additional Properties
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
 - JNDI Name
 jdbc/test
 - Pool Name
 pool/test

# GlassFish起動
## Eclipseにソースコードをimport
~/git/github/cafe-chat などに取得してきたプロジェクトをIDEにインポートする.
## GlassFishサーバの起動
予めGlassFishのドメインdomain1を起動しておく.

- Eclipseの場合
ビューServersより Payara GlassFishを選択し、Start（起動）をおこなう.

- Command Lineの場合

```bash
cd {Payaraホーム}/glassfish
bin/asadmin start-domain domain1
```

## Mavenによるソースコード起動
EclipseのRun Configurations>Mavenにて以下の実行構成を作成する.
 - base project
${workspace_loc:/cafe-caht-server}
 - Goals
 
```bash 
clean package glassfish:deploy
```