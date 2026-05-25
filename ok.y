%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
void yyerror(const char*s);
int yylex();

struct quad{
char op[5],a1[20],a2[20],res[20];
}q[100];
int i=0,t=0;
char *newtemp(){
char *s = malloc(10);
sprintf(s,"t%d",t++);
return s;
}

char *emit(char*op,char*a1,char*a2){
	char *temp=newtemp();
	strcpy(q[i].op,op);
	strcpy(q[i].a1,a1);
	strcpy(q[i].a2,a2);
	strcpy(q[i].res,temp);
	i++;
	return temp;
}
void assign(char*l,char*r){
	strcpy(q[i].op,"=");
	strcpy(q[i].a1,r);
	strcpy(q[i].res,l);
	i++;
}
void print(){
int j=0;
	printf("3 address code \n");
	for(int j=0;j<i;j++){
	if(strcmp(q[i].op,"=")==0){
	printf("%s\t=\t%s\n",q[j].res,q[j].a1);}
	else{
	printf("%s\t=\t%s\t%s\t%s\n",q[j].res,q[j].a1,q[j].op,q[j].a2);
	}
	}
	
	printf("Quad\n");
	printf("index\top\targ1\targ2\tresult\n");
	for (j = 0; j < i; j++) {
        printf("%d\t%s\t%s\t%s\t%s\n",
            j, q[j].op, q[j].a1, q[j].a2, q[j].res);
    }
      printf("\nTriples:\n");
    printf("Index\tOp\tArg1\tArg2\n");
    for (j = 0; j < i; j++) {
        if (strcmp(q[j].op, "=") == 0)
            printf("%d\t=\t%s\t%s\n", j, q[j].a1, q[j].res);
        else
            printf("%d\t%s\t%s\t%s\n", j, q[j].op, q[j].a1, q[j].a2);
    }
}	
	extern FILE *yyin;	
%}
%union{char *text;}
%token<text> ID NUM
%type<text> expr term factor
%left '+' '-'
%left '*' '/'
%%
program : input {print();}
input : ID '=' expr ';' {assign($1,$3);};
expr : expr '+' term {$$=emit("+",$1,$3);}
     | expr '-' term {$$=emit("-",$1,$3);}
     |term {$$ = $1;};
term : term '*' factor {$$=emit("*",$1,$3);}
     |term '/' factor {$$=emit("/",$1,$3);}
     |factor {$$ = $1;};
factor : '(' expr ')' { $$ = $2; }
       | ID { $$ = $1; }
       | NUM { $$ = $1; };
%%
int main(int argc,char *argv[]){
 FILE *fp;

    if (argc > 1) {
        fp = fopen(argv[1], "r");

        if (!fp) {
            printf("Cannot open file\n");
            return 1;
        }

        yyin = fp;   
    }
printf("processing\n");
yyparse();

return 0;
}
void yyerror(const char *c){
printf("error");
}

























