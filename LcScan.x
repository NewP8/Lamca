{
module LcScan (LcToken(..),alexScanTokens) where
}

%wrapper "basic"

$digit = 0-9			-- digits
$alpha = [a-zA-Z]		-- alphabetic characters

tokens :-

  $white+				;
  "--".*				;
  \				    	{ \s -> TLam }
  \.  					{ \s -> TDot }
  \(					{ \s -> TLPar }		
  \)					{ \s -> TRPar }		
  $alpha [$alpha $digit \_ \']*		{ \s -> TVar s } 


{
-- Each action has type :: String -> Token

data LcToken =
	  TLam 		
	| TDot  		
	| TLPar		
	| TRPar  		
	| TVar String	
	deriving (Eq,Show)

-- alexScanTokens s)
}
