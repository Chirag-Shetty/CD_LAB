%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token TYP ID LP RP LB RB SC CM EQ OP RETURN NUM

%%

prog :
        func
     ;

func :
        TYP ID LP params RP LB stmts RB
        {
            printf("Valid Function\n");
        }
     ;

params :
          /* empty */
        | param
        | param CM param
       ;

param :
        TYP ID
      ;

stmts :
        stmt
      | stmts stmt
      ;

stmt :
        TYP ID SC
      | TYP ID EQ expr SC
      | expr SC
      | RETURN expr SC
      ;

expr :
        ID
      | NUM
      | ID EQ expr
      | expr OP expr
      | LP expr RP
      ;

%%

int main()
{
    printf("Enter function:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    printf("Invalid Function\n");
}
