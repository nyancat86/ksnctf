# 問題
 Who is the author of this paper?
Of course, kusano, @kusano_k, ksn,... is not a correct flag.

http://ksnctf.sweetduet.info/q/29/paper.docx


# 問題について
提示されたリンクをクリックするとドキュメントファイルがダウンロードされます。
ファイル形式は.docsですが....





# 解法

1. ファイルが提示されたらまずやりましょう。fileコマンド
    ```
      nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work$ file paper.docx 
      paper.docx: Microsoft Word 2007+
    ```

1. 見てもよくわからなかったのでstringsコマンドでファイルの中の読み取れるバイナリを表示します。
    ```
      nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work$ strings paper.docx 
      [Content_Types].xml 
      )6~o
      '%3h
      DO<R
      CSu)n;
      aU84j
      _rels/.rels 
      A$>"f3
      .b*lI
      word/_rels/document.xml.rels 
      }M" 
      kef4
      uVb*
      )dx=
      EuBZ
      word/document.xml
      'FON
      X*0n
      on.w
      ):^Q
      C_3O
      3ih>Y9
      ;m2C2
      B	-l~L
      5hj9u
      qqpyv
      }^8eW6
      eL75)
      {}vC
      k6kq&
      6`W:s
      WgX<
      9	DJ
      rP><8
      %O::R>
      /:H4|
      w$KC
      _iu%
      $~&`
      t T2B4O
      7k%`
      =B2S-U
      t7<^Or0
      J0#Y
      Oxd_<
      #'p!
      :N38
      pmA[H
      eR7P
      >LG3
      iB(sLU
      l9yzL
      R8-F
      H6Ev
      oJkz
      9P<t
      &YGPI[
      ,v^N
      o.{|
      ef[y
      B$	{
      3Iaa
      5Lew
      %q)D
      iOZf
      W~(N
      QI6U
      moxJ0
      vu2kO
      'K)c
      rfi1
      $kp1`(q
      l9Sp
      :z/0
      *i0&3
      Td,O
      R[Y-R(
      TEm}@U
      )zSC
      ;.%p
      hU=B
      C1?V
      HF}5.
      )Jx(
      J(n=
      word/header3.xml
      Q2ft
      ce`$qv
      (toG
      word/footer2.xml
      nQ2ft
      ce`$qv
      #mER
      cvN$
      rr3i
      word/footer1.xml
      nQ2ft
      ce`$qv
      #mER
      cvN$
      rr3i
      word/header2.xml
      Q2ft
      ce`$qv
      (toG
      word/header1.xml
      Q2ft
      ce`$qv
      (toG
      word/endnotes.xml
      FC]Hv0
      l,oC)
      y/Ss
      Og~vC
      y`t{
      word/footnotes.xml
      8F53
      I:e$
      /cQH
      dyt[$m
      %oj?
      !>M|
      +hb/?
      word/footer3.xml
      nQ2ft
      ce`$qv
      #mER
      cvN$
      rr3i
      word/media/image1.png
      IHDR
      bKGD
      tIME
      IDATx
      QQfF
      !+d%	
      -h2o
      HhvT
      se~K1
      rd$_
      =( f
      8H;Jzz
      g}u/
      N1jLUQ
      xG#JI
      e'jI@&"
      " g"
      *^CU
      aq5rO
      "^_!t
      6WEX
      q r!w
      l%q8
      /*V 
      coWR@
      BKEv
      fdx_
      o&yNU
      7R-Q
      Ih|P
      ?I`l
      RtCj
      4 JJ
      `- M
      /Q[;
      Cq,R
      Ud%	y)"
      ;2(:
      z{%
      >;H
      $[L!
      ?<G!
      ;~/D
      qq=1
      m4^)
      4z6I/
      /G![+
      *Iid{|
      ]g0V)
      6e?K
      9N)L@
      ->](
      E*ZR
      7j_8@F
      w:z0
      K2)j
      YEQJ@&c
      `"rw&
      IH8f"OI
      *|-!
      .. 
      -(^h
      d)+>x
      ($ m
      Q6N%
      _7k 2
      .Uk<
      rSm7!
      zpRhG
      J9M2
      kW,B
      .B*K
      [ W@F
      n\\4b
      #\}]
      l	^a
      +/,E|'
      QvjTn
      ebPX9
      kq8[
      7p_0-U
      A}Bx
      D4-=(
      $W ^AA
      ,wuYJ
      Pa6[
      @?0.6
      nIa8
      V(0_@
      *Gu??G
      z41'
      SLW?
      6!w /
      )Zt&
      u\Z6
      H -2
      qD_0
      a0%Z
      IDAT
      S=F#
      -Hw?
      3Q0n56
      *Rh
      _kt-'#
      p=pE
      {+rgO
      Y.f
      -HOmE
      Nz>I1
      chr[d
      RO& 
      (H#*
      l[RLB
      %Q/*.2(
      %*v!u,,
      "{&\
      iD!^
      O@.K
      X{Tj
      5;`$Rc
      RIfa[^'	
      *Q9d2
      AD?IRE
      S'2Tg
      QprM
      x+bPXt
      qr6!7f
      RX=1
      i ."
      jqZpM
      j]G5
      MQso
      K1Y
      kQ@BL
      ClLG
      |N=U@B
      Cen*
      Q@rq*
      LAer
      z2K6
      %tMD
      :8&x
      / 7r%z
      Qh${
      6$xK
      IEND
      word/theme/theme1.xml
      F{oc'v
      fvg53N
      H\*!!
      : BR
      F\DX
      --W*
      >xjm)
      *F<V
      V4Fj
      &$}A
      >L0t
      Q	|S
      9D{<
      A^&e
      ~^<%OY
      Mw4w
      Tt Q
      y4aS
      "S$C<$i
      bZ~A
      ik8D
      Aa=R
      word/settings.xml
      RiA,~
      9Sy)@Z
      lf0~c
      *^i"
      'YjU
      &q $
      ^YFJ
      &NB<|
      !3pj
      3cS(
      word/webSettings.xml
      ?yh\
      >aM|
      word/stylesWithEffects.xml
      [W<N<
      8`irO
      w1sM
      E(b6
      @! %
      ,8!2.
      3>TQ
      /d2B/
      H[-tn
      d9Mc!
      l p&
      7 XD
      P	kH
      aQNC
      mTSyX
      *y#P
      w3Hw
      27l$oU#
      C`uC
      Qq\H
      Ki0J$
      FM>e
      ^wJl]T
      RY)2c0
      X!)=]Zd
      nonno
      TRa.
      zH{=
      word/styles.xml
      0f`4
      PSW${
      />KNXY
      2x1u!
      $P	$
      + sooEYJ
      @cmQ
      JzP3
      uG-iZw
      uG-%Zw
      E"VKG7
      rZ\?
      s}jq
      }:O<
      {sd`
      v1L;23
      Z@O}
      I@aG
      9FeN
        @ln0l
        Xln
      6=X
      \r_ 
      abv&o
      $*`n
      70cT
      aOTh
      sVDA
      AsLu
      kr&;
      >@Yj
      docProps/core.xml 
      '*!Q
      mj#,"
      oT'S
      word/fontTable.xml
      {,JV
      $U3.
        U"!
      f18*i"
      /9cYm
      y<JB
      kNox
      docProps/app.xml 
      Bhkp
      (CRFw
      +l\nWm8?G~
      [Content_Types].xmlPK
      _rels/.relsPK
      word/_rels/document.xml.relsPK
      word/document.xmlPK
      word/header3.xmlPK
      word/footer2.xmlPK
      word/footer1.xmlPK
      word/header2.xmlPK
      word/header1.xmlPK
      word/endnotes.xmlPK
      y`t{
      word/footnotes.xmlPK
      word/footer3.xmlPK
      word/media/image1.pngPK
      word/theme/theme1.xmlPK
      word/settings.xmlPK
      word/webSettings.xmlPK
      word/stylesWithEffects.xmlPK
      word/styles.xmlPK
      >@Yj
      docProps/core.xmlPK
      word/fontTable.xmlPK
      kNox
      docProps/app.xmlPK
    ```



1. 今出力したファイル...どこかで見覚えがある文字がありますね...何かおわかりでしょうか。


1. わからない方、おそらくstringsコマンドの利用回数が少ない。  
   もしくはそのファイルをstringsにかけた回数が少ないのかもしれません。  
   ...これに見覚えはありませんか？

    ``` 
      nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work$ strings paper.docx | grep PK
      [Content_Types].xmlPK
      _rels/.relsPK
      word/_rels/document.xml.relsPK
      word/document.xmlPK
      word/header3.xmlPK
      word/footer2.xmlPK
      word/footer1.xmlPK
      word/header2.xmlPK
      word/header1.xmlPK
      word/endnotes.xmlPK
      word/footnotes.xmlPK
      word/footer3.xmlPK
      word/media/image1.pngPK
      word/theme/theme1.xmlPK
      word/settings.xmlPK
      word/webSettings.xmlPK
      word/stylesWithEffects.xmlPK
      word/styles.xmlPK
      docProps/core.xmlPK
      word/fontTable.xmlPK
      docProps/app.xmlPK
    ```




1. PKとついていたのは...zipファイルをstringsコマンドで見たときですね。  
では、このファイルをzipに拡張子を変換すれば中を見れそうですね。

    ### コピーしてファイル名はpaper.zipにします。

    ```
    nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work$ cp paper.docx paper.zip
    ```

    ### 中を確認しておきましょう

    ```
    nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work$ ls
    paper.docx  paper.zip
    ```
    ### unzipしてみます
    ```
    nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work$ unzip paper.zip 
    Archive:  paper.zip
      inflating: [Content_Types].xml     
      inflating: _rels/.rels             
      inflating: word/_rels/document.xml.rels  
      inflating: word/document.xml       
      inflating: word/header3.xml        
      inflating: word/footer2.xml        
      inflating: word/footer1.xml        
      inflating: word/header2.xml        
      inflating: word/header1.xml        
      inflating: word/endnotes.xml       
      inflating: word/footnotes.xml      
      inflating: word/footer3.xml        
    extracting: word/media/image1.png   
      inflating: word/theme/theme1.xml   
      inflating: word/settings.xml       
      inflating: word/webSettings.xml    
      inflating: word/stylesWithEffects.xml  
      inflating: word/styles.xml         
      inflating: docProps/core.xml       
      inflating: word/fontTable.xml      
      inflating: docProps/app.xml        
    ```

    ### 展開できました。  

    ```
    nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work$ ls
    '[Content_Types].xml'   docProps   paper.docx   paper.zip   _rels   word
    ```



1. wordディレクトリの中身を見てみましょう。  

    ```
    nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work/word$ ls -la 
    total 148
    drwxrwxr-x 5 nyancat86 nyancat86  4096  8月 29 14:19 .
    drwxrwxr-x 5 nyancat86 nyancat86  4096  8月 29 14:45 ..
    -rw-rw-r-- 1 nyancat86 nyancat86 42869  1月  1  1980 document.xml
    -rw-rw-r-- 1 nyancat86 nyancat86  1466  1月  1  1980 endnotes.xml
    -rw-rw-r-- 1 nyancat86 nyancat86  2060  1月  1  1980 fontTable.xml
    -rw-rw-r-- 1 nyancat86 nyancat86  1222  1月  1  1980 footer1.xml
    -rw-rw-r-- 1 nyancat86 nyancat86  1222  1月  1  1980 footer2.xml
    -rw-rw-r-- 1 nyancat86 nyancat86  1222  1月  1  1980 footer3.xml
    -rw-rw-r-- 1 nyancat86 nyancat86  1472  1月  1  1980 footnotes.xml
    -rw-rw-r-- 1 nyancat86 nyancat86  1222  1月  1  1980 header1.xml
    -rw-rw-r-- 1 nyancat86 nyancat86  1222  1月  1  1980 header2.xml
    -rw-rw-r-- 1 nyancat86 nyancat86  1222  1月  1  1980 header3.xml
    drwxrwxr-x 2 nyancat86 nyancat86  4096  8月 29 14:39 media
    drwxrwxr-x 2 nyancat86 nyancat86  4096  8月 29 14:19 _rels
    -rw-rw-r-- 1 nyancat86 nyancat86  3110  1月  1  1980 settings.xml
    -rw-rw-r-- 1 nyancat86 nyancat86 17515  1月  1  1980 stylesWithEffects.xml
    -rw-rw-r-- 1 nyancat86 nyancat86 16762  1月  1  1980 styles.xml
    drwxrwxr-x 2 nyancat86 nyancat86  4096  8月 29 14:19 theme
    -rw-rw-r-- 1 nyancat86 nyancat86   428  1月  1  1980 webSettings.xml
    ```



1. document.xmlは、本文のデータですね。
   おそらくこの中に、何らかの形でフラグがはいってるのかもしれません。

   ### grepでヒットしないか抽出してみる。
    ```
    nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work/word$ cat document.xml | grep flag
    nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work/word$ 
    ```

    ヒットせず...
  
    念の為、lessコマンドでファイルを開き、検索でflagのワードの破片がないかチェックします。 
    (ここではFLAGでスタートするので大文字で検索)

   ### lessコマンドで検索する。
    ```
    nyancat86@ctf:~/git/ksnctf/29_Double_Blind/work/word$ less document.xml 
    ```

   ### 検索方法
    ```
    /"検索ワード"
    例) /FLAG_
    ```

    そうすると....でてきましたね。
