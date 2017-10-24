%{
#include<stdio.h>
int c=0;
%}

%%
[ \t\n]+	;
[^a-zA-Z]	{c++;}
.	;
%%

int main(){
// yyin = fopen("test.txt","r");
yylex();
printf("%d special chars exits\n",c);
return 0;
}

