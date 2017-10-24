%{
#include<stdio.h>
int count=0;
%}
STRING 	[a-zA-A]
%%
	
{STRING}{3,5}	{count++; }

{STRING}{0,2} |
{STRING}{6,}	;
.		;
%%

int main(){
yylex();
printf(" number of words of given length range  : %d\n",count);
return 0;
}

