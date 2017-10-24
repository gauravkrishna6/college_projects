%{
#include<stdio.h>
int neg_int=0;
int pos_int=0;
int pos_frac=0;
int neg_frac=0;
%}

DIGIT	[0-9]                   

%%

\+?{DIGIT}+		pos_int++;
-{DIGIT}+		neg_int++;
\+?{DIGIT}*\.{DIGIT}+	pos_frac++;          
-{DIGIT}*\.{DIGIT}+	neg_frac++;

.|\n 			;

%%

int main(){
// yyin = fopen("test.txt","r");
yylex();
printf("---------------------------------------\n");
printf("No. of positve integers : %d\n",pos_int);
printf("No. of negative integers : %d\n",neg_int);
printf("No. of positive fractions : %d\n",pos_frac);
printf("No. of negative fractions : %d\n",neg_frac);

return 0;
}

