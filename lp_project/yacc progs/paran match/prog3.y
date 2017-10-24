%{
/*  yacc parser to recognize the regular language (a|b)*abb  */
#include <string.h>
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token LEFTPAREN RIGHTPAREN

%%

S0: S1 S0   { printf("accepted\n"); }
  | S1      {printf("accepted\n");}  
  ;

S1: LEFTPAREN S2 RIGHTPAREN      
  | LEFTPAREN RIGHTPAREN         
  ;

S2: S1 S2     
  | S1         
%%

void yyerror(char *s){
printf("Invalid !!\n");
}

int main(){
printf("Enter String: ");
yyparse();
return 0;
}
