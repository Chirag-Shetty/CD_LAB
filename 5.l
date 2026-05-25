%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
"int" {return INT;}
"main" {return MAIN;}
"printf" {return PRINTF;}
[0-9]+      { yylval.num = atoi(yytext); return NUM; }
[a-zA-Z]    { yylval.id = yytext[0]; return ID; }

"+"         return '+';
"-"         return '-';
"*"         return '*';
"/"         return '/';

"="         return '=';
"("         return '(';
")"         return ')';
";"         return ';';
","         return ',';
"{"         return '{';
"}"         return '}';

[ \t\n]     ;   /* ignore spaces */
%%
int yywrap(){ return 1; }

