yacc -d yaccfile.y
lex lexfile.l
gcc y.tab.c lex.yy.c -ll
