%{
#include<stdio.h>
int v_count =0;
int c_count =0;
%}

vowel	[aeiouAEIOU]

%%

{vowel}	v_count++;

[a-zA-Z] c_count++;

.|\n	;

%%

int main(){
//yyin = fopen("test.txt","r");
yylex();
printf("\n--------------------\n");
printf("No. of vowels : %d \n",v_count);
printf("No. of consonants : %d \n",c_count);
return 0;
}
