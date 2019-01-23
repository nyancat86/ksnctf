# 問題文  
```
What anyone uses is actually secure?

The ASCII art has no meaning.

　　　　　　　　　　 |;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ノ|
　　　　　　　　　　 |丶､ ;;; __;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;_,,: ィ";;_|
　　　　　　　　　　 ﾄ､;;;;;;;;;;;;;;;｀ ` '' ー -- ‐ '' ";;;;;;;;;,:ィ;:;!
　　　　　　　　　　,';:｀`' ‐ｮ ､ ,_ ;;;;;;;;;;;;;;;;;;;;;;;;;;; , - '"l;:;:;:;:l
　　　　　　　　　　l;:;:;:;:;:;:;ﾐ　　 ｀ ` '' ｰ -‐ '"　　　 ,ﾘ;:;:;:l
　　　　　　　　　　l;:;:;:;:;:;:;:ゝ　　 く三)　　　(三ｼ　　｀ヾ;:t、
　　　　　　　　　fﾐ{;:;:;:;:f'´　 , -－-_,, _,ｨ ､_,,ｨ,.-－､　 };f }
　　　　　　　　　l ﾄl;:;:;:;:l　　､,ィ或tｭ､ﾞ:ミ　{,'ィt或ｱﾁ　l:l,/
　　　　　　　　　ﾞi,tヾ:;:;:!　　｀ヽ 二ノ　　　ﾄ ` ‐''"´　 l:l:f
　　　　　　　　　 http://ksnctf.sweetduet.info/q/19/flag.zip
　　　　　　　　　　 ｀"^l:l　　　　　 ,/ﾞｰ､　 ,r'ヽ　　　　l
　　　　　　　　　　　　　ﾞi　　　　,ノ　 　 `'"　 丶.　　 ,
　　　　　　　　　 　 　 　ﾞl､　　 ′ ,, ｨrｪェzｭ､,_ 〉 } /
　　　　　　　　　　　　　　',ヽ　　ヘヾ'zｪｪｪッ',ｼ'　//ヽ
　　　　　　　　　　　　　　 }　丶、　` ｰ--‐ '"'´,/ノ:.:.:ヽ
　　　　　　　　　　　　　　/l　　 丶、　　　 　 ,.ｲ:.:.:.:.:.:.:.:丶､、
　　　　　　　　　　　 ,r'"^l　!　　　　` ー‐;オ´:.:.:.:.:.:.:.:.:.,ノ　 ,}、
　　　　　　　,. -ｧ＝く（:.:.:.l　 l　　　　　 ／/:.:.:.:.:.:., - '"　 ,／　ヽ、
　　　 , - '"´ ／　,／｀＞'t､_」＿＿_,ｨ'ﾞ,ィ,.: -‐ '"　,. -‐ '"　　　　＼　
```





# 問題について  
zipのパスワードを解読して中からフラグをゲットしてください。  
という問題です。

桁数が少なければブルートフォース攻撃を利用して総当りできますが...?




# 解法

1. パスワードを解析する方法を探しましよう。  

1. 使える方法は...  
   - pkcrackを利用した```既知平文攻撃```
   - fcrackzipを利用した```ブルートフォース攻撃```

1. 一見ブルートフォースで総当りすれば高速に解決するかと思いきや...?  
    処理はなかなか終わらず。

1. stringsコマンドを利用してファイルの中を確認します。  
    ※ 今回はヒントが書かれているが、本来の解析では出ない。

    ```t    
    nyancat86@nyancat:~/git/ksnctf/19_ZIPdekure/work$ file flag.zip flag.zip: Zip archive data, at least v1.0 to extract nyancat86@nyancat:~/git/ksnctf/19_ZIPdekure/work$ strings flag.zip 
    ~略~
    flag.htmlPK
    Standard-lock-key.jpgPK
    Hint: 
    - It is known that the encryption system of ZIP is weak against known-plaintext attacks.
    - We employ ZIP format not for compression but for encryption.
    ```

    現在、把握できているのは

    - flag.html
    - Standard-lock-key.jpg

    の２つである。  

    flag.htmlというファイルの中身を知ることが今回の目的。  

    どうしたら解読できるか...
    ここで、`既知平文攻撃`が役に立ちます。  

    
    ### `既知平文攻撃`とは:
    ```
    暗号化されたzipファイルがあり、その中にアーカイブされているファイルの中で  
    一つでも復号化した状態でデータを持っている場合。  
    その復号化されているデータを使って鍵を逆算することができるという手法である。  
    ```

1. 一緒にアーカイブされているStandard-lock-key.jpgというファイルを探しましょう。  
    手に入れることができれば一瞬でパスワードの暗号化を突破できます。  

    ファイル名をもとに検索すると、Wikipediaに保管されている鍵の画像であることがわかったので、データを拾ってきます。  

    https://ja.wikipedia.org/wiki/%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB:Standard-lock-key.jpg
  

1. 解析してみましょう  

    ```s
     nyancat86@ubuntu:~/git/ksnctf/19_ZIPdekure/work$ sudo ./pkcrack-1.2.2/src/pkcrack -C ./flag.zip -c Standard-lock-key.jpg -p ./Standard-lock-key.jpg -d ./decoded 



    Files read. Starting stage 1 on Wed Aug  8 16:02:11 2018
    Generating 1st generation of possible key2_255975 values...done.
    Found 4194304 possible key2-values.
    Now we're trying to reduce these...
    Lowest number: 986 values at offset 248213
    Lowest number: 948 values at offset 248202
    Lowest number: 945 values at offset 247980
    Lowest number: 928 values at offset 247965
    Lowest number: 894 values at offset 247957
    Lowest number: 883 values at offset 244764
    Lowest number: 825 values at offset 244113
    Lowest number: 820 values at offset 243180
    Lowest number: 769 values at offset 243179
    Lowest number: 758 values at offset 243175
    Lowest number: 723 values at offset 243172
    Lowest number: 702 values at offset 243171
    Lowest number: 694 values at offset 243170
    Lowest number: 657 values at offset 243162
    Lowest number: 653 values at offset 243151
    Lowest number: 652 values at offset 243149
    Lowest number: 638 values at offset 243143
    Lowest number: 621 values at offset 243106
    Lowest number: 567 values at offset 243104
    Lowest number: 546 values at offset 243103
    Lowest number: 534 values at offset 243102
    Lowest number: 510 values at offset 243073
    Lowest number: 498 values at offset 243054
    Lowest number: 476 values at offset 242992
    Lowest number: 472 values at offset 242990
    Lowest number: 396 values at offset 242989
    Lowest number: 359 values at offset 242984
    Lowest number: 321 values at offset 242983
    Lowest number: 311 values at offset 242977
    Lowest number: 310 values at offset 242939
    Lowest number: 296 values at offset 242935
    Lowest number: 270 values at offset 242934
    Lowest number: 268 values at offset 242921
    Lowest number: 244 values at offset 242915
    Lowest number: 224 values at offset 242880
    Lowest number: 215 values at offset 242879
    Lowest number: 209 values at offset 242878
    Lowest number: 188 values at offset 242877
    Lowest number: 187 values at offset 242867
    Lowest number: 186 values at offset 242866
    Lowest number: 167 values at offset 242865
    Lowest number: 164 values at offset 242670
    Lowest number: 157 values at offset 242669
    Lowest number: 141 values at offset 242655
    Lowest number: 132 values at offset 242654
    Lowest number: 112 values at offset 242652
    Lowest number: 91 values at offset 242651
    Done. Left with 91 possible Values. bestOffset is 242651.
    Stage 1 completed. Starting stage 2 on Wed Aug  8 16:02:24 2018
    Ta-daaaaa! key0=7adffffe, key1=468d5ff6, key2=259a116a
    Probabilistic test succeeded for 13329 bytes.
    Ta-daaaaa! key0=7adffffe, key1=468d5ff6, key2=259a116a
    Probabilistic test succeeded for 13329 bytes.
    Ta-daaaaa! key0=7adffffe, key1=468d5ff6, key2=259a116a
    Probabilistic test succeeded for 13329 bytes.
    Ta-daaaaa! key0=7adffffe, key1=468d5ff6, key2=259a116a
    Probabilistic test succeeded for 13329 bytes.
    Ta-daaaaa! key0=7adffffe, key1=468d5ff6, key2=259a116a
    Probabilistic test succeeded for 13329 bytes.
    Ta-daaaaa! key0=7adffffe, key1=468d5ff6, key2=259a116a
    Probabilistic test succeeded for 13329 bytes.
    Ta-daaaaa! key0=7adffffe, key1=468d5ff6, key2=259a116a
    Probabilistic test succeeded for 13329 bytes.
    Ta-daaaaa! key0=7adffffe, key1=468d5ff6, key2=259a116a
    Probabilistic test succeeded for 13329 bytes.
    Stage 2 completed. Starting zipdecrypt on Wed Aug  8 16:02:27 2018
    Decrypting flag.html (250d8b78ce908fe210d7c091)... OK!
    Decrypting Standard-lock-key.jpg (037d8119e2c2884a4a665d91)... OK!
    Finished on Wed Aug  8 16:02:27 2018
    ```

    さて...これで

    decode.zipを展開すれば...?あとはお察し。

    ちなみに、最近高速なマシンならばブルートフォース攻撃でも簡単かつ高速にこじ開けることができます  
    （PC一台なら5桁で数分、6桁なら1時間程度）  
    スパコンや、Azureでマシンを大量にデプロイして一瞬でグリッドコンピューティングする方法ならばfcrackzipでうまく行くはずです。




