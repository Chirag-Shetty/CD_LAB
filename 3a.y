%{
#include <stdlib.h>
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}
%token NUM ID FOR PRINTF CON
%%
program: for1 {printf("number of 3 for loop\n");};
for1 : FOR '(' expr ';' expr ';' expr ')' '{' for2 '}'; 
for2 : FOR '(' expr ';' expr ';' expr ')' '{' for3 '}';
for3 : FOR '(' expr ';' expr ';' expr ')' '{' moreloops '}';
moreloops : FOR '(' expr ';' expr ';' expr ')' '{' moreloops '}'
          | stmt;
stmt : expr ';' ;
expr : ID '=' expr 
      | expr '+' expr 
      | expr '-' expr 
      | expr '*' expr 
      | expr '/' expr 
      | expr '<' expr
      | expr '>' expr
      |NUM
      |ID;
%%
int main(){
printf("enter\n");
yyparse();
return 0;
}
void yyerror(const char *s){
printf("error");
}

      
