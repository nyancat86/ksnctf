# 問題
http://ksnctf.sweetduet.info/q/3/unya.html


# 問題について
指定されているウェブページからフラグをゲットしてくださいということです。
ウェブページを開くと、入力ボックスと[Submit Query]と書かれたボタンの2つ構成です。
試しに入力ボックスにtestを入力して、[Submit Query]を押してみましょう。
..."No"と返ってきました。

どうやら、何やら正しいものを入れると"yes"と返ってくるのでしょう。






# 解法

1.	ウェブページのソースを解析しましょう。  
    ChromeやFireFoxの要素検証を立ち上げます。  
    
1.  なにやらsubmitというソースが見つかりました。

    ```js
    function() {
      var t = $('input[type="text"]').val();
      var p = Array(70, 152, 195, 284, 475, 612, 791, 896, 810, 850, 737, 1332, 1469, 1120, 1470, 832, 1785, 2196, 1520, 1480, 1449);
      var f = false;
      if (p.length == t.length) {
        f = true;
        for (var i = 0; i < p.length; i++)
          if (t.charCodeAt(i) * (i + 1) != p[i]) f = false;
        if (f) alert("(」・ω・)」うー!(/・ω・)/にゃー!");
      }
      if (!f) alert("No");
      return false;
    }
    ```



1.  submitは、javascryptで囲われた部分に埋め込まれています。  
    おそらく、配列pに格納されているデータを何らかの形に変換して入力したデータと比較している。
    ということがわかりました。




1.	以下の部分に注目します。
    ``` js
      if (p.length == t.length) {
        f = true;
        for (var i = 0; i < p.length; i++)
          if (t.charCodeAt(i) * (i + 1) != p[i]) f = false;
        if (f) alert("(」・ω・)」うー!(/・ω・)/にゃー!");
      }
    ```

1.    ここでは、入力された文字列と比較することと同時に、  
      ``` t.charCodeAt(i) * (i + 1) ```が一致していることを確認。  
      そうであれば"(」・ω・)」うー!(/・ω・)/にゃー!"を返してくるようです。

	    すなはち、フラグの値は。  
		`配列に格納されているパラメータ / ( 配列番号 + 1 )` ということになります。  
		この数式で割り出した値をASCIIとして文字に変換すればフラグゲットできますね。






 1.	  Pythonでこの文字を変換してやりましょう。
      ``` bash
      nyancat86@NyanCat86:~/git/ksnctf/03_CrawlingChaos$ python
      Python 2.7.15rc1 (default, Apr 15 2018, 21:51:34) 
      [GCC 7.3.0] on linux2
      Type "help", "copyright", "credits" or "license" for more information.

      ## 配列を使うためにnumpyを呼び出します。めんどうなのでnで呼び出せるようにします。
      >>> import numpy as n

      ## 配列に先程のコードのパラメータを流し込みます。
      >>> arr = n.array([70, 152, 195, 284, 475, 612, 791, 896, 810, 850, 737, 1332, 1469, 1120, 1470, 832, 1785, 2196, 1520, 1480, 1449])

      for文で演算します。
      >>> for i in range(21):
      ...     c = i + 1
      ...     a = arr[i] / c
      ...     chr(a)
      ... 
      'F'
      'L'
      'A'
      'G'
      '_'
      'f'
      'q'
      'p'
      'Z'
      'U'
      'C'
      'o'
      'q'
      'P'
      'b'
      '4'
      'i'
      'z'
      'P'
      'J'
      'E'
      ```


