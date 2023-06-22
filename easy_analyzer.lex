%option noyywrap

%{
#include <stdlib.h>
#include <stdio.h>
int lineno = 1;
void ret_print(char *token_type);
void yyerror();
%}

RESERVED_FUNCTION   "procedure"
IDENTIFIER          [a-z][a-zA-Z0-9_]*

%%
{RESERVED_FUNCTION}	        {ret_print("RESERVED_FUNCTION"); }
{IDENTIFIER}	            {ret_print("IDENTIFIER"); }
"+"                         {ret_print("PLUS"); }
"*"                         {ret_print("TIMES"); }
"\n"            {lineno += 1; }
[ \t\r\f]+      
.               {yyerror("Unrecognized character"); }    
%%

void ret_print(char *token_type){
    printf("yytext: %s\ttoken: %s\tlineno: %d\n", yytext, token_type, lineno);
}

void yyerror(char *message){
    printf("Error: \"%s\" in line %d. Token = %s\n", message, lineno, yytext);
    exit(1);
}


int main(int argc, char *argv[]){
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
  return 0;
}
