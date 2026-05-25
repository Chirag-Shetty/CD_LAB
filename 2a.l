%{
#include<stdio.h>
int pf=0,nf=0,p=0,n=0;
%}
%%
([0-9]+\.[0-9]+)|([+][0-9]+\.[0-9]+)|([+][0-9]+\/[1-9][0-9]*)|([0-9]+\/[1-9][0-9]*)   { pf++; }
([-][0-9]+\.[0-9]+)|([-][0-9]+\/[1-9][0-9]*)   { nf++; }
([0-9]+)|(\+[0-9]+) {p++;}
(\-[0-9]+) {n++;}
[ \t\n]+ ;
. ;

%%
int main(){
printf("Enter the number");
yylex();
printf("positive integer %d\n",p);
printf("negative integer %d\n",n);
printf("positive fraction %d\n",pf);
printf("negative fraction %d\n",nf);
return 0;
}
int yywrap(){
return 1;}

