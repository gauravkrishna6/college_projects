%{
	#include<stdio.h>
	//#include<stdlib.h>
	
	//int yyerror();
	int yylex();
%}

%token  A;
%token  B;
%token NL;
%glr-parser

%% 
	S : X NL {printf("Valid palindrome\n"); return 1;}
	    ;

	X : A X A
	    | B X B
	    | A
	    | B
	    | 
	    ;
%%

/*int yyerror()
{
	
	printf("Not a palindrome\n");
	return 0;
}
*/
int main()
{
	printf("\nEnter a string \n");
	yyparse();
	return 0;
}
