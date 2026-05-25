%{
#include<stdio.h>
int l=0,w=0,ws=0,c=0;
%}
%%
\n {l++;c++;}
[ \t] {ws++;c++;}
[A-Za-z]+ {w++;c+=yyleng;}
. {c++;}
%%
int main(){
printf("Enter text\n");
yylex();
printf("number of char %d ,words %d,wehitespace%d,line %d",c,w,ws,l);
return 0;
}
int yywrap(){
return 1;}

