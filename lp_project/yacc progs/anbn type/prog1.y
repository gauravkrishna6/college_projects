%{
#include<stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token A B
%%

stmt:	s'\n'	{printf("Valid !!\n"); return 0;}

s:	A B
	| A s B
	;
%%

void yyerror(char *s){
printf("Invalid !!\n");
}

int main(){
printf("Enter String: ");
yyparse();
return 0;
}


