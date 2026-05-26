%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token NUM

%left '+' '-'
%left '*' '/'

%%

S : E
    {
        printf("Result = %d\n", $1);
        return 0;
    }
    ;

E : E '+' E   { $$ = $1 + $3; }
  | E '-' E   { $$ = $1 - $3; }
  | E '*' E   { $$ = $1 * $3; }
  | E '/' E
        {
            if($3 == 0)
            {
                yyerror("Division by zero");
            }
            else
            {
                $$ = $1 / $3;
            }
        }
  | '(' E ')' { $$ = $2; }
  | NUM       { $$ = $1; }
  | '-' NUM   { $$ = -$2; }
  ;

%%

int main()
{
    printf("Enter expression:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
    exit(1);
}
