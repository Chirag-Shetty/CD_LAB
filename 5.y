%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%union{
    int num;
    char id;
}

%token<num> NUM
%token<id> ID
%token INT PRINTF MAIN

%%

program :
        INT MAIN '(' ')' '{' stmts '}'
        ;

stmts :
        stmts stmt
      | stmt
      ;

stmt :
        INT ID '=' NUM ';'
        {
            printf("MOV %c, #%d\n", $2, $4);
        }

      | ID '=' ID '+' ID ';'
        {
            printf("MOV R0, %c\n", $3);
            printf("ADD R0, %c\n", $5);
            printf("MOV %c, R0\n", $1);
        }

      | ID '=' ID '-' ID ';'
        {
            printf("MOV R0, %c\n", $3);
            printf("SUB R0, %c\n", $5);
            printf("MOV %c, R0\n", $1);
        }

      | ID '=' ID '*' ID ';'
        {
            printf("MOV R0, %c\n", $3);
            printf("MUL R0, %c\n", $5);
            printf("MOV %c, R0\n", $1);
        }

      | ID '=' ID '/' ID ';'
        {
            printf("MOV R0, %c\n", $3);
            printf("DIV R0, %c\n", $5);
            printf("MOV %c, R0\n", $1);
        }

      | PRINTF '(' ID ')' ';'
        {
            printf("PRINT %c\n", $3);
        }
      ;

%%

int main()
{
    printf("Enter the code:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}
