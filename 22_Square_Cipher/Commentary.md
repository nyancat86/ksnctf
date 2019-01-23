# 問題
```
oomktvziqtaovmmpxzoqrzsxlpwpgoj
uDQEMISYnnVYnvyWRhHsDXnSCXAVVZj
tZbknedErdpvAwQWpUiLqOxIqpafvXp
dXoAVWcKppbEPuaqmXWjXJwRoRFOoEg
pDiRUXlQjKJlslskVpGwtljGyVJPxHv
bQsQNKxCsdYMdQPJiBmyrsuOrJQOtXg
pMekeinUaMoDXqFzweLKipkBuggnsUv
eQFYCJSKfBgHaJgZnZoWmOmAOJLVQHi
hljrplajyKNXtwmfOjRwOqcqeeplyzy
gkFOltsOyrPgIaerIaSjQQaVMyEhfyd
vEaRHbBzfrcwJbCZmHdddLpuEJwspbt
sXQGkwpKaTZmWJiZzpbkpHNiToawxKn
wJpIKbGhnLjVAJNcxrqkKEJCKCOocSv
mTRDNDpFtRUmcHoRELeSqXoGUIIsuYu
ajeHaSVlQGLaEprSQarDzTomJdAWfqb
zIJLHRBXMvNDegYeaoVRDuWBbdSBtLv
xIeKdAYwajGHMgRLDGgDinBiLNBgatb
kHepNsCQSJjTRmQrCHYWJqIPOVAUOer
rvhmZfmogPglGNuLyAuSivBctlvVfzb
qBJdHUkSaTArlgkhtHPyGhXOPkwmkBq
rvbzZfwvLtTnhyXVHPlwsuGZQnNiNcm
yCMtAVwYVgtZHVNznolGMBETIHFmoWj
wfezbysbvOzsAhxSZFFAfOouyHldEYh
gNHKKSFUtcUxfRyXHMugYBtAxBwDJZh
rHmsozuNeoJqyzMDHsNbUDwzaNLtdxr
bVmQMHyNndOWCZLnhrPxZXCYLDTWQre
aSiEEJjZtoRpUzgsxsiiGzvnRpKLMrk
qTzGCKvNhUhjrmCjAdwQAvkgqHyJZLm
sSxzwjxAnWesTszIxirRwcWIXUPtwwa
nTDEMTRGyhzdCtkTTDWbxdSjsNYlfXz
eawtidzosgaofjxxyfcdoiulemirqap
```


# 問題について
Square : 四角  
Cipher : 暗号

四角の暗号と言っています。
...正確にはSquareは正方形？





# 解法

1. この問題で言っている四角とはどんなものでしょうか...


1. ITの技術で見かける四角いもの....情報を持つ....
   なんとなくそれだなというものが思い浮かぶと思います。


1. バーコード...にしては含むことができる情報が多すぎますね。
   情報は`31行x31列`...フォントでわかりませんでしたが、正方形ですね。


1. 多次元バーコード...QR....という可能性が出てきました。


1. どうやったらこの暗号をQRコードにできるか考えてみましょう。


1.	使われている文字は？A-Z,a-zですね。  
    大文字のアルファベッドか小文字のアルファベッド....数字は使われていない。  
    ※まるで0か1かのような感じがしますよね。


1.	では、大文字と小文字を何らかの等幅フォントで並べてみましょう。
	面倒なので　▪　と　▫　で表します

	### データを用意します  
	```
	nyancat86@ctf:~/git/ksnctf/22_Square_Cipher/work$ cat data
	oomktvziqtaovmmpxzoqrzsxlpwpgoj
	uDQEMISYnnVYnvyWRhHsDXnSCXAVVZj
	tZbknedErdpvAwQWpUiLqOxIqpafvXp
	dXoAVWcKppbEPuaqmXWjXJwRoRFOoEg
	pDiRUXlQjKJlslskVpGwtljGyVJPxHv
	bQsQNKxCsdYMdQPJiBmyrsuOrJQOtXg
	pMekeinUaMoDXqFzweLKipkBuggnsUv
	eQFYCJSKfBgHaJgZnZoWmOmAOJLVQHi
	hljrplajyKNXtwmfOjRwOqcqeeplyzy
	gkFOltsOyrPgIaerIaSjQQaVMyEhfyd
	vEaRHbBzfrcwJbCZmHdddLpuEJwspbt
	sXQGkwpKaTZmWJiZzpbkpHNiToawxKn
	wJpIKbGhnLjVAJNcxrqkKEJCKCOocSv
	mTRDNDpFtRUmcHoRELeSqXoGUIIsuYu
	ajeHaSVlQGLaEprSQarDzTomJdAWfqb
	zIJLHRBXMvNDegYeaoVRDuWBbdSBtLv
	xIeKdAYwajGHMgRLDGgDinBiLNBgatb
	kHepNsCQSJjTRmQrCHYWJqIPOVAUOer
	rvhmZfmogPglGNuLyAuSivBctlvVfzb
	qBJdHUkSaTArlgkhtHPyGhXOPkwmkBq
	rvbzZfwvLtTnhyXVHPlwsuGZQnNiNcm
	yCMtAVwYVgtZHVNznolGMBETIHFmoWj
	wfezbysbvOzsAhxSZFFAfOouyHldEYh
	gNHKKSFUtcUxfRyXHMugYBtAxBwDJZh
	rHmsozuNeoJqyzMDHsNbUDwzaNLtdxr
	bVmQMHyNndOWCZLnhrPxZXCYLDTWQre
	aSiEEJjZtoRpUzgsxsiiGzvnRpKLMrk
	qTzGCKvNhUhjrmCjAdwQAvkgqHyJZLm
	sSxzwjxAnWesTszIxirRwcWIXUPtwwa
	nTDEMTRGyhzdCtkTTDWbxdSjsNYlfXz
	eawtidzosgaofjxxyfcdoiulemirqap
	```

	### 大文字を変換します。
	```
	nyancat86@ctf:~/git/ksnctf/22_Square_Cipher/work$ cat data | sed -e 's/[A-Z]/▫/g'
	oomktvziqtaovmmpxzoqrzsxlpwpgoj
	u▫▫▫▫▫▫▫nn▫▫nvy▫▫h▫s▫▫n▫▫▫▫▫▫▫j
	t▫bkned▫rdpv▫w▫▫p▫i▫q▫x▫qpafv▫p
	d▫o▫▫▫c▫ppb▫▫uaqm▫▫j▫▫w▫o▫▫▫o▫g
	p▫i▫▫▫l▫j▫▫lslsk▫p▫wtlj▫y▫▫▫x▫v
	b▫s▫▫▫x▫sd▫▫d▫▫▫i▫myrsu▫r▫▫▫t▫g
	p▫ekein▫a▫o▫▫q▫zwe▫▫ipk▫uggns▫v
	e▫▫▫▫▫▫▫f▫g▫a▫g▫n▫o▫m▫m▫▫▫▫▫▫▫i
	hljrplajy▫▫▫twmf▫j▫w▫qcqeeplyzy
	gk▫▫lts▫yr▫g▫aer▫a▫j▫▫a▫▫y▫hfyd
	v▫a▫▫b▫zfrcw▫b▫▫m▫ddd▫pu▫▫wspbt
	s▫▫▫kwp▫a▫▫m▫▫i▫zpbkp▫▫i▫oawx▫n
	w▫p▫▫b▫hn▫j▫▫▫▫cxrqk▫▫▫▫▫▫▫oc▫v
	m▫▫▫▫▫p▫t▫▫mc▫o▫▫▫e▫q▫o▫▫▫▫su▫u
	aje▫a▫▫l▫▫▫a▫pr▫▫ar▫z▫om▫d▫▫fqb
	z▫▫▫▫▫▫▫▫v▫▫eg▫eao▫▫▫u▫▫bd▫▫t▫v
	x▫e▫d▫▫waj▫▫▫g▫▫▫▫g▫in▫i▫▫▫gatb
	k▫ep▫s▫▫▫▫j▫▫m▫r▫▫▫▫▫q▫▫▫▫▫▫▫er
	rvhm▫fmog▫gl▫▫u▫y▫u▫iv▫ctlv▫fzb
	q▫▫d▫▫k▫a▫▫rlgkht▫▫y▫h▫▫▫kwmk▫q
	rvbz▫fwv▫t▫nhy▫▫▫▫lwsu▫▫▫n▫i▫cm
	y▫▫t▫▫w▫▫gt▫▫▫▫znol▫▫▫▫▫▫▫▫mo▫j
	wfezbysbv▫zs▫hx▫▫▫▫▫f▫ouy▫ld▫▫h
	g▫▫▫▫▫▫▫tc▫xf▫y▫▫▫ug▫▫t▫x▫w▫▫▫h
	r▫msozu▫eo▫qyz▫▫▫s▫b▫▫wza▫▫tdxr
	b▫m▫▫▫y▫nd▫▫▫▫▫nhr▫x▫▫▫▫▫▫▫▫▫re
	a▫i▫▫▫j▫to▫p▫zgsxsii▫zvn▫p▫▫▫rk
	q▫z▫▫▫v▫h▫hjrm▫j▫dw▫▫vkgq▫y▫▫▫m
	s▫xzwjx▫n▫es▫sz▫xir▫wc▫▫▫▫▫twwa
	n▫▫▫▫▫▫▫yhzd▫tk▫▫▫▫bxd▫js▫▫lf▫z
	eawtidzosgaofjxxyfcdoiulemirqap
	```  

	### 小文字を変換します  

	```
	nyancat86@ctf:~/git/ksnctf/22_Square_Cipher/work$ cat data | sed -e 's/[A-Z]/▫/g' | sed -e 's/[a-z]/▪/g'
	▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪
	▪▫▫▫▫▫▫▫▪▪▫▫▪▪▪▫▫▪▫▪▫▫▪▫▫▫▫▫▫▫▪
	▪▫▪▪▪▪▪▫▪▪▪▪▫▪▫▫▪▫▪▫▪▫▪▫▪▪▪▪▪▫▪
	▪▫▪▫▫▫▪▫▪▪▪▫▫▪▪▪▪▫▫▪▫▫▪▫▪▫▫▫▪▫▪
	▪▫▪▫▫▫▪▫▪▫▫▪▪▪▪▪▫▪▫▪▪▪▪▫▪▫▫▫▪▫▪
	▪▫▪▫▫▫▪▫▪▪▫▫▪▫▫▫▪▫▪▪▪▪▪▫▪▫▫▫▪▫▪
	▪▫▪▪▪▪▪▫▪▫▪▫▫▪▫▪▪▪▫▫▪▪▪▫▪▪▪▪▪▫▪
	▪▫▫▫▫▫▫▫▪▫▪▫▪▫▪▫▪▫▪▫▪▫▪▫▫▫▫▫▫▫▪
	▪▪▪▪▪▪▪▪▪▫▫▫▪▪▪▪▫▪▫▪▫▪▪▪▪▪▪▪▪▪▪
	▪▪▫▫▪▪▪▫▪▪▫▪▫▪▪▪▫▪▫▪▫▫▪▫▫▪▫▪▪▪▪
	▪▫▪▫▫▪▫▪▪▪▪▪▫▪▫▫▪▫▪▪▪▫▪▪▫▫▪▪▪▪▪
	▪▫▫▫▪▪▪▫▪▫▫▪▫▫▪▫▪▪▪▪▪▫▫▪▫▪▪▪▪▫▪
	▪▫▪▫▫▪▫▪▪▫▪▫▫▫▫▪▪▪▪▪▫▫▫▫▫▫▫▪▪▫▪
	▪▫▫▫▫▫▪▫▪▫▫▪▪▫▪▫▫▫▪▫▪▫▪▫▫▫▫▪▪▫▪
	▪▪▪▫▪▫▫▪▫▫▫▪▫▪▪▫▫▪▪▫▪▫▪▪▫▪▫▫▪▪▪
	▪▫▫▫▫▫▫▫▫▪▫▫▪▪▫▪▪▪▫▫▫▪▫▫▪▪▫▫▪▫▪
	▪▫▪▫▪▫▫▪▪▪▫▫▫▪▫▫▫▫▪▫▪▪▫▪▫▫▫▪▪▪▪
	▪▫▪▪▫▪▫▫▫▫▪▫▫▪▫▪▫▫▫▫▫▪▫▫▫▫▫▫▫▪▪
	▪▪▪▪▫▪▪▪▪▫▪▪▫▫▪▫▪▫▪▫▪▪▫▪▪▪▪▫▪▪▪
	▪▫▫▪▫▫▪▫▪▫▫▪▪▪▪▪▪▫▫▪▫▪▫▫▫▪▪▪▪▫▪
	▪▪▪▪▫▪▪▪▫▪▫▪▪▪▫▫▫▫▪▪▪▪▫▫▫▪▫▪▫▪▪
	▪▫▫▪▫▫▪▫▫▪▪▫▫▫▫▪▪▪▪▫▫▫▫▫▫▫▫▪▪▫▪
	▪▪▪▪▪▪▪▪▪▫▪▪▫▪▪▫▫▫▫▫▪▫▪▪▪▫▪▪▫▫▪
	▪▫▫▫▫▫▫▫▪▪▫▪▪▫▪▫▫▫▪▪▫▫▪▫▪▫▪▫▫▫▪
	▪▫▪▪▪▪▪▫▪▪▫▪▪▪▫▫▫▪▫▪▫▫▪▪▪▫▫▪▪▪▪
	▪▫▪▫▫▫▪▫▪▪▫▫▫▫▫▪▪▪▫▪▫▫▫▫▫▫▫▫▫▪▪
	▪▫▪▫▫▫▪▫▪▪▫▪▫▪▪▪▪▪▪▪▫▪▪▪▫▪▫▫▫▪▪
	▪▫▪▫▫▫▪▫▪▫▪▪▪▪▫▪▫▪▪▫▫▪▪▪▪▫▪▫▫▫▪
	▪▫▪▪▪▪▪▫▪▫▪▪▫▪▪▫▪▪▪▫▪▪▫▫▫▫▫▪▪▪▪
	▪▫▫▫▫▫▫▫▪▪▪▪▫▪▪▫▫▫▫▪▪▪▫▪▪▫▫▪▪▫▪
	▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪▪
	```


	...おや




	### では　⬛　と　⬜　でやってみましょう
	```
	nyancat86@ctf:~/git/ksnctf/22_Square_Cipher/work$ cat data | sed -e 's/[A-Z]/⬛/g' | sed -e 's/[a-z]/⬜/g'
	⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜
	⬜⬛⬛⬛⬛⬛⬛⬛⬜⬜⬛⬛⬜⬜⬜⬛⬛⬜⬛⬜⬛⬛⬜⬛⬛⬛⬛⬛⬛⬛⬜
	⬜⬛⬜⬜⬜⬜⬜⬛⬜⬜⬜⬜⬛⬜⬛⬛⬜⬛⬜⬛⬜⬛⬜⬛⬜⬜⬜⬜⬜⬛⬜
	⬜⬛⬜⬛⬛⬛⬜⬛⬜⬜⬜⬛⬛⬜⬜⬜⬜⬛⬛⬜⬛⬛⬜⬛⬜⬛⬛⬛⬜⬛⬜
	⬜⬛⬜⬛⬛⬛⬜⬛⬜⬛⬛⬜⬜⬜⬜⬜⬛⬜⬛⬜⬜⬜⬜⬛⬜⬛⬛⬛⬜⬛⬜
	⬜⬛⬜⬛⬛⬛⬜⬛⬜⬜⬛⬛⬜⬛⬛⬛⬜⬛⬜⬜⬜⬜⬜⬛⬜⬛⬛⬛⬜⬛⬜
	⬜⬛⬜⬜⬜⬜⬜⬛⬜⬛⬜⬛⬛⬜⬛⬜⬜⬜⬛⬛⬜⬜⬜⬛⬜⬜⬜⬜⬜⬛⬜
	⬜⬛⬛⬛⬛⬛⬛⬛⬜⬛⬜⬛⬜⬛⬜⬛⬜⬛⬜⬛⬜⬛⬜⬛⬛⬛⬛⬛⬛⬛⬜
	⬜⬜⬜⬜⬜⬜⬜⬜⬜⬛⬛⬛⬜⬜⬜⬜⬛⬜⬛⬜⬛⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜
	⬜⬜⬛⬛⬜⬜⬜⬛⬜⬜⬛⬜⬛⬜⬜⬜⬛⬜⬛⬜⬛⬛⬜⬛⬛⬜⬛⬜⬜⬜⬜
	⬜⬛⬜⬛⬛⬜⬛⬜⬜⬜⬜⬜⬛⬜⬛⬛⬜⬛⬜⬜⬜⬛⬜⬜⬛⬛⬜⬜⬜⬜⬜
	⬜⬛⬛⬛⬜⬜⬜⬛⬜⬛⬛⬜⬛⬛⬜⬛⬜⬜⬜⬜⬜⬛⬛⬜⬛⬜⬜⬜⬜⬛⬜
	⬜⬛⬜⬛⬛⬜⬛⬜⬜⬛⬜⬛⬛⬛⬛⬜⬜⬜⬜⬜⬛⬛⬛⬛⬛⬛⬛⬜⬜⬛⬜
	⬜⬛⬛⬛⬛⬛⬜⬛⬜⬛⬛⬜⬜⬛⬜⬛⬛⬛⬜⬛⬜⬛⬜⬛⬛⬛⬛⬜⬜⬛⬜
	⬜⬜⬜⬛⬜⬛⬛⬜⬛⬛⬛⬜⬛⬜⬜⬛⬛⬜⬜⬛⬜⬛⬜⬜⬛⬜⬛⬛⬜⬜⬜
	⬜⬛⬛⬛⬛⬛⬛⬛⬛⬜⬛⬛⬜⬜⬛⬜⬜⬜⬛⬛⬛⬜⬛⬛⬜⬜⬛⬛⬜⬛⬜
	⬜⬛⬜⬛⬜⬛⬛⬜⬜⬜⬛⬛⬛⬜⬛⬛⬛⬛⬜⬛⬜⬜⬛⬜⬛⬛⬛⬜⬜⬜⬜
	⬜⬛⬜⬜⬛⬜⬛⬛⬛⬛⬜⬛⬛⬜⬛⬜⬛⬛⬛⬛⬛⬜⬛⬛⬛⬛⬛⬛⬛⬜⬜
	⬜⬜⬜⬜⬛⬜⬜⬜⬜⬛⬜⬜⬛⬛⬜⬛⬜⬛⬜⬛⬜⬜⬛⬜⬜⬜⬜⬛⬜⬜⬜
	⬜⬛⬛⬜⬛⬛⬜⬛⬜⬛⬛⬜⬜⬜⬜⬜⬜⬛⬛⬜⬛⬜⬛⬛⬛⬜⬜⬜⬜⬛⬜
	⬜⬜⬜⬜⬛⬜⬜⬜⬛⬜⬛⬜⬜⬜⬛⬛⬛⬛⬜⬜⬜⬜⬛⬛⬛⬜⬛⬜⬛⬜⬜
	⬜⬛⬛⬜⬛⬛⬜⬛⬛⬜⬜⬛⬛⬛⬛⬜⬜⬜⬜⬛⬛⬛⬛⬛⬛⬛⬛⬜⬜⬛⬜
	⬜⬜⬜⬜⬜⬜⬜⬜⬜⬛⬜⬜⬛⬜⬜⬛⬛⬛⬛⬛⬜⬛⬜⬜⬜⬛⬜⬜⬛⬛⬜
	⬜⬛⬛⬛⬛⬛⬛⬛⬜⬜⬛⬜⬜⬛⬜⬛⬛⬛⬜⬜⬛⬛⬜⬛⬜⬛⬜⬛⬛⬛⬜
	⬜⬛⬜⬜⬜⬜⬜⬛⬜⬜⬛⬜⬜⬜⬛⬛⬛⬜⬛⬜⬛⬛⬜⬜⬜⬛⬛⬜⬜⬜⬜
	⬜⬛⬜⬛⬛⬛⬜⬛⬜⬜⬛⬛⬛⬛⬛⬜⬜⬜⬛⬜⬛⬛⬛⬛⬛⬛⬛⬛⬛⬜⬜
	⬜⬛⬜⬛⬛⬛⬜⬛⬜⬜⬛⬜⬛⬜⬜⬜⬜⬜⬜⬜⬛⬜⬜⬜⬛⬜⬛⬛⬛⬜⬜
	⬜⬛⬜⬛⬛⬛⬜⬛⬜⬛⬜⬜⬜⬜⬛⬜⬛⬜⬜⬛⬛⬜⬜⬜⬜⬛⬜⬛⬛⬛⬜
	⬜⬛⬜⬜⬜⬜⬜⬛⬜⬛⬜⬜⬛⬜⬜⬛⬜⬜⬜⬛⬜⬜⬛⬛⬛⬛⬛⬜⬜⬜⬜
	⬜⬛⬛⬛⬛⬛⬛⬛⬜⬜⬜⬜⬛⬜⬜⬛⬛⬛⬛⬜⬜⬜⬛⬜⬜⬛⬛⬜⬜⬛⬜
	⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜
	```

	な...何だこれは....
