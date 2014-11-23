{
module LcParse where

import LcScan
}
%name parsaLc
%tokentype { LcToken }
%error { parseError }

%token

	'\\'			{ TLam }
	'.'  			{ TDot }
	'('				{ TLPar }		
	')'				{ TRPar }		
	id				{ TVar $$ } 

%%

Expr	: '\\' id '.' Expr  { Abs $2 $4 }
     	| Expa			    { $1 }

Expa	: Expa Atom		    { App $1 $2 }
     	| Atom			    { $1 }

Atom 	: '(' Expr ')'		{ $2 }
      	| id			    { Var $1 }

{

parseError :: [LcToken] -> a
parseError _ = error "Parse error"

type Id = String
data Expr = Abs Id Expr
	  | App Expr Expr
	  | Var Id
	  deriving (Eq,Show)

parseExpr :: String -> Expr
parseExpr = parsaLc . alexScanTokens
}
