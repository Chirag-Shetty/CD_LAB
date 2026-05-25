%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}
%union{int num;char id;}
%token<num> NUM
%token<id> ID
%token INT PRINTF MAIN
%%
program : INT MAIN '(' ')' '{' stmts'}' ;
stmts : stmts stmt
      | stmt;
stmt : INT ID '=' NUM ';' {printf("movl $%d, %c\n",$4,$2);}
   | ID '=' ID '+' ID ';'{printf("movl %c,%%eax\n",$3);
   		printf("addl %c,%%eax\n",$5); 
   		printf("movl %%eax,%c\n",$1);}
   | ID '=' ID '-' ID ';' {printf("movl %c,%%eax\n",$3);
   		printf("subl %c,%%eax\n",$5); 
   		printf("movl %%eax,%c\n",$1);}	
   | ID '=' ID '*' ID ';' {printf("movl %c,%%eax\n",$3);
   		printf("multl %c,%%eax\n",$5); 
   		printf("imovl %%eax,%c\n",$1);}	
   | ID '=' ID '/' ID ';' {printf("movl %c,%%eax\n",$3);
   		printf("idivl %c\n",$5); 
   		printf("movl %%eax,%c\n",$1);}
   | PRINTF '(' ID ')' ';' {printf("movl %c,%%edi\n",$3);};
   
%%
int main(){
 printf("enter the code:");
 yyparse();
 return 0;
 }
 void yyerror(const char *s){
 printf("error");
 }
  
   

