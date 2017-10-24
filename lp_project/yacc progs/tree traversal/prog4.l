%option noyywrap
%{
	#include<stdio.h>
	#include "y.tab.h"

%}

%%
[0-9]+  {yylval=atoi(yytext);return I;}
\n {return NL;}
. {return yytext[0];}
%%