%{
#include "y.tab.h"
#include <stdio.h>
%}
%%
"for" {return FOR;}
"printf" {return PRINTF;}
\"[^\"]*\" {return CON;}
"(" {return '(';}
")" {return ')';}
"{" {return '{';}
"}" {return '}';}
";" {return ';';}
"," {return ',';}
"=" {return '=';}
"<" {return '<';}
">" {return '>';}
"+"             { return '+'; }  
"-"             { return '-'; }   
"*"             { return '*'; }   
"/"             { return '/'; }   
[0-9]+          { return NUM; }
[A-Za-z][A-Za-z0-9]* { return ID; }
[ \t\n]+        ;
.               { printf("unknown char: %s\n", yytext); }
%%
int yywrap() { return 1; }   
