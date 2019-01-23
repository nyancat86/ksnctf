# 問題

EBG KVVV vf n fvzcyr yrggre fhofgvghgvba pvcure gung ercynprf n yrggre jvgu gur yrggre KVVV yrggref nsgre vg va gur nycunorg. EBG KVVV vf na rknzcyr bs gur Pnrfne pvcure, qrirybcrq va napvrag Ebzr. Synt vf SYNTFjmtkOWFNZdjkkNH. Vafreg na haqrefpber vzzrqvngryl nsgre SYNT. 



# 問題について

問題文は、そのままでは読めないように暗号化されています。
文章として読めるように解読する必要があります。まず、文字数が少なく頻出するワードを調べます。

- vf  
- n  
- synt (大小区別しない)  
- gur  

英文であると推測すると
- 1文字で頻出するのは「a」
- 2文字で頻出するのは「is」
- 3文字で頻出するのは「the」

ゲットしたいものは「flag」ですね。





# 解法
1. どうしたら読めるようになるか考えましょう。

	- nをaとして読むにはどうしましょう。aからnまでの距離は...
	> a > b c d e f g h i j k l m n  
	13文字離れています。  

	- vfをisとして読むにはどうしましょう。各文字の距離は...
	> v > w x y z a b c d e f g h i  
	13文字離れています。  

	> f > g h i j k l m n o p q r s  
	13文字離れています。  

だんだんわかってきたと思います。この文章はすべての文字がおそらく13文字ずれているのです。



2. pythonのライブラリには便利なデコード用ライブラリが入っています。  
	これを使って解読してみます。  

- ROT13ライブラリをcodecsから呼び出します。 

```py
nyancat86@NyanCat86:~/git/ksnctf/02_EasyCipher$ python
Python 2.7.15rc1 (default, Apr 15 2018, 21:51:34) 
[GCC 7.3.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.

###### ここでcodecsをインポートします。
>>> import codecs

###### ここで先程の暗号文をROT13でデコードしています。
>>> codecs.decode('EBG KVVV vf n fvzcyr yrggre fhofgvghgvba pvcure gung ercynprf n yrggre jvgu gur yrggre KVVV yrggref nsgre vg va gur nycunorg. EBG KVVV vf na rknzcyr bs gur Pnrfne pvcure, qrirybcrq va napvrag Ebzr. Synt vf SYNTFjmtkOWFNZdjkkNH. Vafreg na haqrefpber vzzrqvngryl nsgre SYNT.','ROT13')
u'ROT XIII is a simple letter substitution cipher that replaces a letter with the letter XIII letters after it in the alphabet. ROT XIII is an example of the Caesar cipher, developed in ancient Rome. Flag is FLAGSwzgxBJSAMqwxxAU. Insert an underscore immediately after FLAG.'
```


フラグをゲット！しましたが、気をつけてくださいね。  
...それは貼ってみてからのお楽しみ。
