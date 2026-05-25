%{
#include "y.tab.h"
#include<stdlib.h>
#include<string.h>
%}
%%
[a-zA-Z_][a-zA-Z0-9]* {yylval.text=strdup(yytext);return ID;}
[0-9]+ {yylval.text=strdup(yytext);return NUM;}
[ \t\n]+ ;
. {return yytext[0];}
%%
int yywrap(){
return 1;}
