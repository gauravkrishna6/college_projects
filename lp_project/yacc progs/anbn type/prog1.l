%{
#include "y.tab.h"
#include <stdlib.h>
/*void yyerror(char *);*/
%}
%%

a	return A;
b	return B;
.|\n	return (yytext[0]);

%%

/* int yywrap(void){
return 1;
} */

 
