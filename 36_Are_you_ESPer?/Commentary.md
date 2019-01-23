# 問題
nc ctfq.sweetduet.info 10777  
http://ksnctf.sweetduet.info/q/36/esp  


# 問題について
あなたはエスパーになれるか！！（無理無理）

# 解法(現在途中まで進行)

1. ファイルをダウンロードしてきます
    ### wgetコマンドでファイルを取得する
    ```
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ wget http://ksnctf.sweetduet.info/q/36/esp
    --2018-09-12 14:50:27--  http://ksnctf.sweetduet.info/q/36/esp
    Resolving ksnctf.sweetduet.info (ksnctf.sweetduet.info)... 49.212.153.157, 2403:3a00:202:1210:49:212:153:157
    Connecting to ksnctf.sweetduet.info (ksnctf.sweetduet.info)|49.212.153.157|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 700946 (685K) [text/plain]
    Saving to: ‘esp’

    esp                        100%[=====================================>] 684.52K  2.88MB/s    in 0.2s    

    2018-09-12 14:50:28 (2.88 MB/s) - ‘esp’ saved [700946/700946]
    ```

    ### ファイル情報を確認

    ```
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ file ./esp 
    ./esp: ELF 32-bit LSB executable, Intel 80386, version 1 (GNU/Linux), statically linked, for GNU/Linux 2.6.18, BuildID[sha1]=945a0a1dedacc4fbf6c3858f7aaacf211049a15b, not stripped

    ```
    32bitの実行ファイルであることがわかります。....ん？

1. 実行してみましょう

    ### 実行する
    ```
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ ./esp
    bash: ./esp: Permission denied
    ```
    エラーが出ました。権限がないと言われています。


1. 実行権限を確認する  

   ### ファイルの権限を確認する。

    ```Bash
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ ls -la 
    total 696
    drwxrwxr-x 2 nyancat86 nyancat86   4096 Sep 12 14:55 .
    drwxrwxr-x 3 nyancat86 nyancat86   4096 Sep 12 14:55 ..
    -rw-rw-r-- 1 nyancat86 nyancat86 700946 Oct 14  2014 esp

    ```

   ### chmodで権限を変更する（sudo必須）

    ```Bash
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ sudo chmod 777 esp 
    ```

   ### 権限が付与されたか確認  

    ```Bash
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ ls -la 
    total 696
    drwxrwxr-x 2 nyancat86 nyancat86   4096 Sep 12 14:55 .
    drwxrwxr-x 3 nyancat86 nyancat86   4096 Sep 12 14:55 ..
    -rwxrwxrwx 1 nyancat86 nyancat86 700946 Oct 14  2014 esp
    ```

1. 再度実行させてみる

   ### 実行する
    ```Bash
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ ./esp 
    Level 1/20, Challenge 1/10
    ? 
    ```  

   ### 何か入力してみる
    ```Bash
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ ./esp 
    Level 1/20, Challenge 1/10
    ? a
    Too small

    Level 1/20, Challenge 2/10
    ? Too small

    Level 1/20, Challenge 3/10
    ? Too small

    Level 1/20, Challenge 4/10
    ? Too small

    Level 1/20, Challenge 5/10
    ? Too small

    Level 1/20, Challenge 6/10
    ? Too small

    Level 1/20, Challenge 7/10
    ? Too small

    Level 1/20, Challenge 8/10
    ? Too small

    Level 1/20, Challenge 9/10
    ? Too small

    Level 1/20, Challenge 10/10
    ? Too small

    Bye
    ```  

    ...`a`を入力しただけで吹っ飛んで`Bye`といわれてしまった...



   ### 数字を入力してみる

    ```
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ ./esp 
    Level 1/20, Challenge 1/10
    ? 6
    Too large

    Level 1/20, Challenge 2/10
    ? 4
    Too large

    Level 1/20, Challenge 3/10
    ? 2
    Too small

    Level 1/20, Challenge 4/10
    ? 3
    Correct!

    Level 2/20, Challenge 1/8
    ? 

    ```  

    どうやら数字を入力しろということですね。  

    わかったことは...  
    - パラメータ  
      - `Level 1/20` : ステージは20問連続でクリアしてね！  
      - `Challenge 1/10` : 試行回数、ステージが上がるごとに10>8>6>4>2>1と減っていきLevel6からミスできない。
    - 判定 
      - `Too small` : その数字より`大きい`よ！
      - `Too large` : その数字より`小さい`よ！
      - `Correct!`  : その数字が`あたり`！  

     ということです。

    ### 20問連続で当てられたらエスパーだこれ。

    ...とまぁこんな具合



1. 正攻法で勝てるほど甘くない、デバッグしてレジスタに積まれたデータと比較してるところを先読みしてやろう。  
    Brainf*ckの経験が役に立った。  

    ### GDBデバッガを立ち上げる
    ```Bash
    nyancat86@ubuntu:~/git/ksnctf/36_Are_you_ESPer?/work$ gdb ./esp 
    GNU gdb (Ubuntu 8.1-0ubuntu3) 8.1.0.20180409-git
    Copyright (C) 2018 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "x86_64-linux-gnu".
    Type "show configuration" for configuration details.
    For bug reporting instructions, please see:
    <http://www.gnu.org/software/gdb/bugs/>.
    Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.
    For help, type "help".
    Type "apropos word" to search for commands related to "word"...
    Reading symbols from ./esp...(no debugging symbols found)...done.
    (gdb) 

    ```

    ### `disas main`で逆アセンブル
    ```avrasm
        (gdb) disas main
    Dump of assembler code for function main:
    0x080482c0 <+0>:	push   %ebp
    0x080482c1 <+1>:	mov    %esp,%ebp
    0x080482c3 <+3>:	and    $0xfffffff0,%esp
    0x080482c6 <+6>:	push   %edi
    0x080482c7 <+7>:	push   %esi
    0x080482c8 <+8>:	push   %ebx
    0x080482c9 <+9>:	sub    $0x44,%esp
    0x080482cc <+12>:	movl   $0x0,(%esp)
    0x080482d3 <+19>:	call   0x806b880 <time>
    0x080482d8 <+24>:	mov    %eax,(%esp)
    0x080482db <+27>:	call   0x8054ec0 <srandom>
    0x080482e0 <+32>:	movl   $0x0,0x1c(%esp)
    0x080482e8 <+40>:	call   0x8055490 <rand>
    0x080482ed <+45>:	mov    %eax,%ecx
    0x080482ef <+47>:	mov    $0x66666667,%eax
    0x080482f4 <+52>:	imul   %ecx
    0x080482f6 <+54>:	mov    %ecx,%eax
    0x080482f8 <+56>:	sar    $0x1f,%eax
    0x080482fb <+59>:	mov    %edx,%edi
    0x080482fd <+61>:	mov    0x1c(%esp),%edx
    0x08048301 <+65>:	sar    $0x2,%edi
    0x08048304 <+68>:	sub    %eax,%edi
    0x08048306 <+70>:	lea    (%edi,%edi,4),%edi
    0x08048309 <+73>:	mov    0x80bb260(,%edx,4),%eax
    0x08048310 <+80>:	add    %edi,%edi
    0x08048312 <+82>:	sub    %edi,%ecx
    0x08048314 <+84>:	test   %eax,%eax
    0x08048316 <+86>:	jg     0x8048340 <main+128>
    0x08048318 <+88>:	movl   $0x80bb20c,(%esp)
    0x0804831f <+95>:	call   0x8055df0 <puts>
    0x08048324 <+100>:	mov    0x80e0e40,%eax
    0x08048329 <+105>:	mov    %eax,(%esp)
    0x0804832c <+108>:	call   0x8055720 <fflush>
    0x08048331 <+113>:	add    $0x44,%esp
    0x08048334 <+116>:	xor    %eax,%eax
    0x08048336 <+118>:	pop    %ebx
    0x08048337 <+119>:	pop    %esi
    0x08048338 <+120>:	pop    %edi
    0x08048339 <+121>:	mov    %ebp,%esp
    0x0804833b <+123>:	pop    %ebp
    0x0804833c <+124>:	ret    
    0x0804833d <+125>:	lea    0x0(%esi),%esi
    0x08048340 <+128>:	add    $0x1,%edx
    0x08048343 <+131>:	xor    %ebx,%ebx
    0x08048345 <+133>:	mov    %edx,0x1c(%esp)
    0x08048349 <+137>:	mov    %eax,%edi
    0x0804834b <+139>:	mov    %ecx,0x18(%esp)
    0x0804834f <+143>:	nop
    0x08048350 <+144>:	mov    0x1c(%esp),%edx
    0x08048354 <+148>:	add    $0x1,%ebx
    0x08048357 <+151>:	mov    %edi,0xc(%esp)
    0x0804835b <+155>:	mov    %ebx,0x8(%esp)
    0x0804835f <+159>:	movl   $0x80bb234,(%esp)
    0x08048366 <+166>:	mov    %edx,0x4(%esp)
    0x0804836a <+170>:	call   0x80554a0 <printf>
    0x0804836f <+175>:	mov    0x80e0e40,%eax
    0x08048374 <+180>:	mov    %eax,(%esp)
    0x08048377 <+183>:	call   0x8055720 <fflush>
    0x0804837c <+188>:	lea    0x3c(%esp),%eax
    0x08048380 <+192>:	mov    %eax,0x4(%esp)
    0x08048384 <+196>:	movl   $0x80cc649,(%esp)
    0x0804838b <+203>:	call   0x8055500 <scanf>
    0x08048390 <+208>:	mov    0x18(%esp),%edx
    0x08048394 <+212>:	cmp    0x3c(%esp),%edx
    0x08048398 <+216>:	jg     0x8048478 <main+440>
    0x0804839e <+222>:	jge    0x8048460 <main+416>
    0x080483a4 <+228>:	movl   $0x80bb1f7,(%esp)
    0x080483ab <+235>:	xor    %esi,%esi
    0x080483ad <+237>:	call   0x8055df0 <puts>
    0x080483b2 <+242>:	mov    0x80e0e40,%eax
    0x080483b7 <+247>:	mov    %eax,(%esp)
    0x080483ba <+250>:	call   0x8055720 <fflush>
    0x080483bf <+255>:	cmp    %edi,%ebx
    0x080483c1 <+257>:	jl     0x80483d8 <main+280>
    0x080483c3 <+259>:	mov    %esi,%eax
    0x080483c5 <+261>:	test   %al,%al
    0x080483c7 <+263>:	je     0x8048318 <main+88>
    0x080483cd <+269>:	lea    0x0(%esi),%esi
    0x080483d0 <+272>:	jmp    0x80483e2 <main+290>
    0x080483d2 <+274>:	lea    0x0(%esi),%esi
    0x080483d8 <+280>:	mov    %esi,%eax
    0x080483da <+282>:	test   %al,%al
    0x080483dc <+284>:	je     0x8048350 <main+144>
    0x080483e2 <+290>:	cmpl   $0x14,0x1c(%esp)
    0x080483e7 <+295>:	jne    0x80482e8 <main+40>
    0x080483ed <+301>:	movl   $0x80cdcbb,0x4(%esp)
    0x080483f5 <+309>:	lea    0x26(%esp),%ebx
    0x080483f9 <+313>:	movl   $0x80bb210,(%esp)
    0x08048400 <+320>:	call   0x8055930 <fopen>
    0x08048405 <+325>:	mov    %ebx,(%esp)
    0x08048408 <+328>:	movl   $0x15,0x8(%esp)
    0x08048410 <+336>:	movl   $0x1,0x4(%esp)
    0x08048418 <+344>:	mov    %eax,%esi
    0x0804841a <+346>:	mov    %eax,0xc(%esp)
    0x0804841e <+350>:	call   0x8055b30 <fread>
    0x08048423 <+355>:	mov    %esi,(%esp)
    0x08048426 <+358>:	call   0x8055530 <fclose>
    0x0804842b <+363>:	movb   $0x0,0x3b(%esp)
    0x08048430 <+368>:	movl   $0x80bb223,(%esp)
    0x08048437 <+375>:	call   0x8055df0 <puts>
    0x0804843c <+380>:	mov    %ebx,(%esp)
    0x0804843f <+383>:	call   0x8055df0 <puts>
    0x08048444 <+388>:	mov    0x80e0e40,%eax
    0x08048449 <+393>:	mov    %eax,(%esp)
    0x0804844c <+396>:	call   0x8055720 <fflush>
    0x08048451 <+401>:	add    $0x44,%esp
    0x08048454 <+404>:	xor    %eax,%eax
    0x08048456 <+406>:	pop    %ebx
    0x08048457 <+407>:	pop    %esi
    0x08048458 <+408>:	pop    %edi
    0x08048459 <+409>:	mov    %ebp,%esp
    0x0804845b <+411>:	pop    %ebp
    0x0804845c <+412>:	ret    
    0x0804845d <+413>:	lea    0x0(%esi),%esi
    0x08048460 <+416>:	movl   $0x80bb202,(%esp)
    0x08048467 <+423>:	mov    $0x1,%esi
    0x0804846c <+428>:	call   0x8055df0 <puts>
    0x08048471 <+433>:	jmp    0x80483b2 <main+242>
    0x08048476 <+438>:	xchg   %ax,%ax
    0x08048478 <+440>:	movl   $0x80bb1ec,(%esp)
    0x0804847f <+447>:	xor    %esi,%esi
    0x08048481 <+449>:	call   0x8055df0 <puts>
    0x08048486 <+454>:	jmp    0x80483b2 <main+242>
    End of assembler dump.
    ```
    ### ※注目するべき場所

    ```avrasm
    # 乱数を生成
      0x080482db <+27>:	call   0x8054ec0 <srandom>
      0x080482e0 <+32>:	movl   $0x0,0x1c(%esp)
      0x080482e8 <+40>:	call   0x8055490 <rand>

    # 生成した乱数はアキュムレータレジスタであるeaxを指定
    # カウンタレジスタであるecxにmov命令で移動させる。
      0x080482ed <+45>:	mov    %eax,%ecx

    # アキュムレータレジスタに$0x66666667を設定する
    0x080482ef <+47>:	mov    $0x66666667,%eax

    # カウンタレジスタの値をimul命令で乗算している。
    # このときオペランドは1つしかないためmul命令と同じ動作をする
    # オペランドのサイズに応じて AL,AX,EAXの値を掛けて、DX-AX,EDX:EAXに格納する。
    0x080482f4 <+52>:	imul   %ecx

    # ecxの値をeaxに格納する
    0x080482f6 <+54>:	mov    %ecx,%eax

    # eaxに格納した値だけ0x1fのビットを右または左にシフトする
    0x080482f8 <+56>:	sar    $0x1f,%eax

    # データレジスタからディスとネーションレジスタへデータを格納している
    0x080482fb <+59>:	mov    %edx,%edi

    # スタックポインタレジスタの値をデータレジスタに格納している
    0x080482fd <+61>:	mov    0x1c(%esp),%edx

    # 符号付除算（算術左シフト）：上位ビット側にシフト
    0x08048301 <+65>:	sar    $0x2,%edi

    # 減算：eax - edi = eax
    0x08048304 <+68>:	sub    %eax,%edi

    # 汎用レジスタ[格納先](edi,edi,4)へedi[読み込み元]の実行アドレスを計算して格納する。
    0x08048306 <+70>:	lea    (%edi,%edi,4),%edi

    # eaxに 0x80bb260 の値を格納する
    0x08048309 <+73>:	mov    0x80bb260(,%edx,4),%eax

    # ediにediの値を加算する
    0x08048310 <+80>:	add    %edi,%edi

    # ecxからediの値を減算する
    0x08048312 <+82>:	sub    %edi,%ecx
    
    ...

    と、データの準備をしている先に
    
    ...
    
    # main + 128にジャンプする命令
    0x08048316 <+86>:	jg     0x8048340 <main+128>
    
    # キーボードからの入力待ち
    0x0804838b <+203>:	call   0x8055500 <scanf>
    # 入力をデータレジスタに格納する
    0x08048390 <+208>:	mov    0x18(%esp),%edx
    # 格納したデータとスタックポインタレジスタの値を比較する
    0x08048394 <+212>:	cmp    0x3c(%esp),%edx

    ```

    ### キー入力を受け付ける前後でブレイクポイントを張る

    ```
    (gdb) b * 0x8048340
    Breakpoint 1 at 0x8048340

    (gdb) b * 0x08048394
    Breakpoint 2 at 0x8048394

    ```  

    ### 走らせる
    ```
    (gdb) run
    Starting program: /home/nyancat86/git/ksnctf/36_Are_you_ESPer?/work/esp 

    Breakpoint 1, 0x08048340 in main ()
    ```  


    ...やったぜ（何が）  
    とりあえずレジスタの中身覗く変態になりましょう。
    


    ### 覗く（犯罪臭）

    ```avrasm
    (gdb) info reg
    eax            0xa	10
    ecx            0x4	4
    edx            0x0	0
    ebx            0x0	0
    esp            0xffffd010	0xffffd010
    ebp            0xffffd068	0xffffd068
    esi            0x80543a0	134562720
    edi            0x3d19f0d6	1025110230
    eip            0x8048340	0x8048340 <main+128>
    eflags         0x206	[ PF IF ]
    cs             0x23	35
    ss             0x2b	43
    ds             0x2b	43
    es             0x2b	43
    fs             0x0	0
    gs             0x63	99
    ```  

    ### `c`で抜ける

    ```Bash
    (gdb) c
    Continuing.
    Level 1/20, Challenge 1/10
    ?
    ```

    ### 抜けたところに適当に値を入れてみる
    ```Bash
    Level 1/20, Challenge 1/10
    ? 5

    Breakpoint 2, 0x08048394 in main ()
    ```
    ### 再度レジスタを覗く
    ```avrasm
    (gdb) info reg
    eax            0x1	1
    ecx            0x80e65d4	135161300
    edx            0x4	4
    ebx            0x1	1
    esp            0xffffd010	0xffffd010
    ebp            0xffffd068	0xffffd068
    esi            0x80543a0	134562720
    edi            0xa	10
    eip            0x8048394	0x8048394 <main+212>
    eflags         0x246	[ PF ZF IF ]
    cs             0x23	35
    ss             0x2b	43
    ds             0x2b	43
    es             0x2b	43
    fs             0x0	0
    gs             0x63	99

    ```
    edxには4が格納されています。

    ...あれ？一個前のレジスタでは...　　

    
    ```avrasm
    (gdb) info reg
    eax            0xa	10
    ecx            0x4	4
    ```
    そういうことです。

    ### `ecxの値は比較される値になる`

    ### breakpoint 1を残して、ecxを表示するようにする。プログラムも一度止める。

    ```
    (gdb) delete 2
    (gdb) display $ecx
    1: $ecx = 135161300
    (gdb) stop
    ```

    ### 再度リトライする。


    ```
    (gdb) run
    The program being debugged has been started already.
    Start it from the beginning? (y or n) y
    Starting program: /home/nyancat86/git/ksnctf/36_Are_you_ESPer?/work/esp 

    Breakpoint 1, 0x08048340 in main ()
    1: $ecx = 2
    (gdb)c
    Continuing.
    Level 1/20, Challenge 1/10
    ? 2
    Correct!


    Breakpoint 1, 0x08048340 in main ()
    1: $ecx = 3
    (gdb) c
    Continuing.
    Level 2/20, Challenge 1/8
    ? 3
    Correct!


    Breakpoint 1, 0x08048340 in main ()
    1: $ecx = 5
    (gdb) c
    Continuing.
    Level 3/20, Challenge 1/6
    ? 5
    Correct!


    Breakpoint 1, 0x08048340 in main ()
    1: $ecx = 0
    (gdb) c
    Continuing.
    Level 4/20, Challenge 1/4
    ? 0
    Correct!


    Breakpoint 1, 0x08048340 in main ()
    1: $ecx = 0
    ```  

    ### これであなたもエスパーだ！！

    ...とおもいきや
    ```
    Level 20/20, Challenge 1/1
    ? 0
    Correct!


    Program received signal SIGSEGV, Segmentation fault.
    0x08055b53 in fread ()
    1: $ecx = 4096
    (gdb) 

    ```
    ...なに転けてるの！？ばかぁ！！  
      

    
1. フォールトした原因を探る

    ### 原因を整理しましょう
    ```
    Program received signal SIGSEGV, Segmentation fault.
    0x08055b53 in fread ()
    ```
    fread()の0x08055b53がセグメンテーション違反している...


    ###fread()を逆アセンブルする
    ```
    (gdb) disas fread
    Dump of assembler code for function fread:
    0x08055b30 <+0>:	push   %ebp
    0x08055b31 <+1>:	mov    %esp,%ebp
    0x08055b33 <+3>:	sub    $0x1c,%esp
    0x08055b36 <+6>:	mov    %ebx,-0xc(%ebp)
    0x08055b39 <+9>:	mov    0xc(%ebp),%ebx
    0x08055b3c <+12>:	mov    %edi,-0x4(%ebp)
    0x08055b3f <+15>:	mov    0x10(%ebp),%edi
    0x08055b42 <+18>:	mov    %esi,-0x8(%ebp)
    0x08055b45 <+21>:	mov    0x14(%ebp),%esi
    0x08055b48 <+24>:	imul   %edi,%ebx
    0x08055b4b <+27>:	test   %ebx,%ebx
    0x08055b4d <+29>:	je     0x8055bf8 <fread+200>
    => 0x08055b53 <+35>:	cmpw   $0x0,(%esi)
    0x08055b57 <+39>:	js     0x8055b92 <fread+98>
    0x08055b59 <+41>:	mov    0x48(%esi),%edx
    0x08055b5c <+44>:	mov    %gs:0x8,%eax
    0x08055b62 <+50>:	mov    %eax,-0x10(%ebp)
    0x08055b65 <+53>:	cmp    %eax,0x8(%edx)
    0x08055b68 <+56>:	je     0x8055b8e <fread+94>
    0x08055b6a <+58>:	xor    %eax,%eax
    0x08055b6c <+60>:	mov    $0x1,%ecx
    0x08055b71 <+65>:	cmpl   $0x0,%gs:0xc
    0x08055b79 <+73>:	je     0x8055b7c <fread+76>
    0x08055b7b <+75>:	lock cmpxchg %ecx,(%edx)
    0x08055b7f <+79>:	jne    0x8055c40 <_L_lock_47>
    0x08055b85 <+85>:	mov    0x48(%esi),%edx
    0x08055b88 <+88>:	mov    -0x10(%ebp),%eax
    0x08055b8b <+91>:	mov    %eax,0x8(%edx)
    0x08055b8e <+94>:	addl   $0x1,0x4(%edx)
    0x08055b92 <+98>:	mov    0x8(%ebp),%eax
    0x08055b95 <+101>:	mov    %ebx,0x8(%esp)
    0x08055b99 <+105>:	mov    %esi,(%esp)
    0x08055b9c <+108>:	mov    %eax,0x4(%esp)
    0x08055ba0 <+112>:	call   0x805a1a0 <_IO_sgetn>
    0x08055ba5 <+117>:	cmpw   $0x0,(%esi)
    0x08055ba9 <+121>:	mov    %eax,%edx
    0x08055bab <+123>:	js     0x8055bd8 <fread+168>
    0x08055bad <+125>:	mov    0x48(%esi),%ecx
    0x08055bb0 <+128>:	mov    0x4(%ecx),%eax
    0x08055bb3 <+131>:	sub    $0x1,%eax
    0x08055bb6 <+134>:	test   %eax,%eax
    0x08055bb8 <+136>:	mov    %eax,0x4(%ecx)
    0x08055bbb <+139>:	jne    0x8055bd8 <fread+168>
    0x08055bbd <+141>:	movl   $0x0,0x8(%ecx)
    0x08055bc4 <+148>:	cmpl   $0x0,%gs:0xc
    0x08055bcc <+156>:	je     0x8055bcf <fread+159>
    0x08055bce <+158>:	lock subl $0x1,(%ecx)
    0x08055bd2 <+162>:	jne    0x8055c4c <_L_unlock_92>
    0x08055bd4 <+164>:	nopl   0x0(%eax)
    0x08055bd8 <+168>:	cmp    %edx,%ebx
    0x08055bda <+170>:	je     0x8055be5 <fread+181>
    0x08055bdc <+172>:	mov    %edx,%eax
    0x08055bde <+174>:	xor    %edx,%edx
    0x08055be0 <+176>:	divl   0xc(%ebp)
    0x08055be3 <+179>:	mov    %eax,%edi
    0x08055be5 <+181>:	mov    %edi,%eax
    0x08055be7 <+183>:	mov    -0xc(%ebp),%ebx
    0x08055bea <+186>:	mov    -0x8(%ebp),%esi
    0x08055bed <+189>:	mov    -0x4(%ebp),%edi
    0x08055bf0 <+192>:	mov    %ebp,%esp
    0x08055bf2 <+194>:	pop    %ebp
    0x08055bf3 <+195>:	ret    
    0x08055bf4 <+196>:	nopl   0x0(%eax)
    0x08055bf8 <+200>:	xor    %edi,%edi
    0x08055bfa <+202>:	mov    -0xc(%ebp),%ebx
    0x08055bfd <+205>:	mov    %edi,%eax
    0x08055bff <+207>:	mov    -0x8(%ebp),%esi
    0x08055c02 <+210>:	mov    -0x4(%ebp),%edi
    0x08055c05 <+213>:	mov    %ebp,%esp
    0x08055c07 <+215>:	pop    %ebp
    0x08055c08 <+216>:	ret    
    0x08055c09 <+217>:	cmpw   $0x0,(%esi)
    0x08055c0d <+221>:	mov    %eax,%ecx
    0x08055c0f <+223>:	js     0x8055c38 <fread+264>
    0x08055c11 <+225>:	mov    0x48(%esi),%edx
    0x08055c14 <+228>:	mov    0x4(%edx),%eax
    0x08055c17 <+231>:	sub    $0x1,%eax
    0x08055c1a <+234>:	test   %eax,%eax
    0x08055c1c <+236>:	mov    %eax,0x4(%edx)
    0x08055c1f <+239>:	jne    0x8055c38 <fread+264>
    0x08055c21 <+241>:	movl   $0x0,0x8(%edx)
    0x08055c28 <+248>:	cmpl   $0x0,%gs:0xc
    0x08055c30 <+256>:	je     0x8055c33 <fread+259>
    0x08055c32 <+258>:	lock subl $0x1,(%edx)
    0x08055c36 <+262>:	jne    0x8055c58 <_L_unlock_167>
    0x08055c38 <+264>:	mov    %ecx,(%esp)
    0x08055c3b <+267>:	call   0x8051a90 <_Unwind_Resume>
    End of assembler dump.
    ```
    ご丁寧にフォールトした位置でポインタが止まってるって表示になってます。

    ### ※注目するポイント
    ```
    # ベースポインタをプッシュしている（関数に移動するときにやる処理）
    0x08055b30 <+0>:	push   %ebp
    ## スタックポインタレジスタの値をベースポインタレジスタに設定する(プログラムの終点を設定している)
    0x08055b31 <+1>:	mov    %esp,%ebp
    
    # 0x08055b33 <+3>:	sub    $0x1c,%esp
    # 0x08055b36 <+6>:	mov    %ebx,-0xc(%ebp)
    # 0x08055b39 <+9>:	mov    0xc(%ebp),%ebx
    # 0x08055b3c <+12>:	mov    %edi,-0x4(%ebp)
    # 0x08055b3f <+15>:	mov    0x10(%ebp),%edi
    # 0x08055b42 <+18>:	mov    %esi,-0x8(%ebp)
    # 0x08055b45 <+21>:	mov    0x14(%ebp),%esi
    
    # edi = edi * ebx
    0x08055b48 <+24>:	imul   %edi,%ebx

    # AND回路で比較し、EFLAGの値を設定する
    0x08055b4b <+27>:	test   %ebx,%ebx
    # fread+200へジャンプする
    0x08055b4d <+29>:	je     0x8055bf8 <fread+200>

    => 0x08055b53 <+35>:	cmpw   $0x0,(%esi)
    ```
    ジャンプ先で何か起きている可能性があります。



    ### `fread+200`を見る
    ```
    # xorでediとediを比較している＝ここで必ずFALSEが返る
    0x08055bf8 <+200>:	xor    %edi,%edi

    0x08055bfa <+202>:	mov    -0xc(%ebp),%ebx
    0x08055bfd <+205>:	mov    %edi,%eax
    0x08055bff <+207>:	mov    -0x8(%ebp),%esi
    0x08055c02 <+210>:	mov    -0x4(%ebp),%edi
    0x08055c05 <+213>:	mov    %ebp,%esp

    # ebpからデータを取り出す
    0x08055c07 <+215>:	pop    %ebp

    # 関数から抜ける
    0x08055c08 <+216>:	ret    
    0x08055c09 <+217>:	cmpw   $0x0,(%esi)
    0x08055c0d <+221>:	mov    %eax,%ecx
    0x08055c0f <+223>:	js     0x8055c38 <fread+264>
    ```
    ...わからんｗｗ