LcParse	: LcParse.hs LcScan.hs
	ghci LcParse.hs

LcParse.hs : LcParse.y
	happy LcParse.y

LcScan	: LcScan.hs
	ghci LcScan.hs

LcScan.hs : LcScan.x
	alex LcScan.x

clean : 
	rm LcParse.hs LcScan.hs *~
