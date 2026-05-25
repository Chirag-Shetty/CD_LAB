%{
#include "y.tab.h"
%}
%%
[0-9]+ {yylval=atoi(yytext);return NUMBER}
[ \t]  ;
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"/" {return '/';}
"(" {return '(';}
")" {return ')';}
. {return yytext[0];}
%%
int yywrap(){
return 1;
}

