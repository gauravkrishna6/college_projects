%{
#include<stdio.h>
int w=0;
int c=0;
int l=0;
%}
WORD	[^ \t\n,\.:]+
EOL	[\n]

%%

{WORD} 	{w++; c=c+yyleng;}
{EOL}	{l++;}
.	{c++;}

%%

int main(){
yyin = fopen("test.txt","r");
yylex();
printf("\n\nnumber of words = %d\n",w);
printf("number of lines = %d\n",l);
printf("number of characters = %d\n",c);
return 0;
}

