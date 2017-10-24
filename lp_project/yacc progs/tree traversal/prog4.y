%{
	#include<stdio.h>
	#include<ctype.h>
	#include <stdlib.h>
	#include <string.h>

  typedef struct node
  {
    struct node *left;
    struct node *right;
    char token;
  } node;

  node *mknode(node *left, node *right, char token);
  void printtree(node *tree);

#define YYSTYPE struct node *

	
%}

%token  I;
%left '+';
%left '*';
%token NL;
%glr-parser;

%% 

S : E NL { printf("PRE ORDER: ");preprinttree($1) ;printf("\n");printf("IN ORDER:");inprinttree($1);printf("\n");printf("POST ORDER:");posprinttree($1);printf("\n");printf("\nend of parsing\n"); return 1;}
  ;

E : E '+' E  {$$=mknode($1,$3,'+');}
  | E '*' E  {$$=mknode($1,$3,'*');}
  | I	     {$$=mknode(0,0,((char)yylval)+'0');}
  ;


%%
int yyerror(char *s)
{
	
	printf("does not accept grammar\n");
	return 0;
}
main()
{
	yyparse();
}

node *mknode(node *left, node *right, char token)
{
  /* malloc the node */
  node *newnode = (node *)malloc(sizeof(node));
  newnode->left = left;
  newnode->right = right;
  newnode->token = token;
  return(newnode);
}

void preprinttree(node *tree)
{
  int i;

  printf(" %c ", tree->token);

  if (tree->left)
    preprinttree(tree->left);
  if (tree->right)
    preprinttree(tree->right);

  
}

void inprinttree(node *tree)
{
  int i;

  if (tree->left || tree->right)
    printf("(");

  if (tree->left)
    inprinttree(tree->left);

   printf(" %c ", tree->token);
  if (tree->right)
    inprinttree(tree->right);

  if (tree->left || tree->right)
    printf(")");
}

void posprinttree(node *tree)
{
  int i;

  if (tree->left)
    posprinttree(tree->left);
  if (tree->right)
    posprinttree(tree->right);
	
   printf(" %c ", tree->token);
  
}
