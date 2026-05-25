%{
#include<stdio.h>
#include<stdlib.h>
int cnta=0;int cntb=0;int cntc=0;
void yyerror(const char *s);
int yylex();
%}
%token A B C
%%
S : X Y '\n'{
	if(cntb == cnta+cntc) {
	printf("string accepted\n");
	}
	else {
	printf("string not accepted");
	}
	}
  ;
X : A X B {cnta++;cntb++;}
 |
 ;
Y : B Y C {cntb++;cntc++;}
 |
 ;
%%
void yyerror(const char*s)
{
printf("Invalid string\n");
}
int main(){
printf("enter \n");
yyparse();
return 0;
}


