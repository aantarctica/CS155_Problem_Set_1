%option noyywrap

%{
#include <stdlib.h>
#include <stdio.h>
int lineno = 1;
void ret_print(char *token_type);
void yyerror();
%}

RESERVED_CONDITIONAL	(endcase|case|else|if|then)
RESERVED_ITERATION	(endfor|endwhile|while|do|repeat|until|loop|forever|for)
RESERVED_IO		(input|output)
RESERVED_DECLARATION	(array|node)
RESERVED_CONTROL	(call|return|stop|end)
RESERVED_FUNCTION	(procedure)
OPERATOR_LOGICAL	(and|or|not)
OPERATOR_MISC		(mod)
OPERATOR_ARITHMETIC	(\+|-|\/|\*|\^)
OPERATOR_RELATIONAL	(<=|>=|!=|>|<|=)
DELIMITER	(\(|\)|,|;|:|'|←)
INTEGER	(0|[1-9]\d*)
IDENTIFIER	([a-zA-Z_][a-zA-Z_0-9]*)

%%
{RESERVED_CONDITIONAL}  {ret_print("RESERVED_CONDITIONAL"); }
{RESERVED_ITERATION}    {ret_print("RESERVED_ITERATION"); }
{RESERVED_IO}           {ret_print("RESERVED_IO"); }
{RESERVED_DECLARATION}  {ret_print("RESERVED_DECLARATION"); }
{RESERVED_CONTROL}      {ret_print("RESERVED_CONTROL"); }
{RESERVED_FUNCTION}     {ret_print("RESERVED_FUNCTION"); }
{OPERATOR_LOGICAL}      {ret_print("OPERATOR_LOGICAL"); }
{OPERATOR_MISC}         {ret_print("OPERATOR_MISC"); }
{OPERATOR_ARITHMETIC}   {ret_print("OPERATOR_ARITHMETIC"); }
{OPERATOR_RELATIONAL}   {ret_print("OPERATOR_RELATIONAL"); }
{DELIMITER}             {ret_print("DELIMITER"); }
{INTEGER}               {ret_print("INTEGER"); }
{IDENTIFIER}            {ret_print("IDENTIFIER"); }
"\n"                        {lineno += 1; }
[ \t\r\f]+      
.                           {yyerror("Unrecognized character"); }    
%%

void ret_print(char *token_type){
    printf("TOKEN:\t%s\tTOKEN_CLASS:\t%s\tLINE_NUMBER:\t%d\n", yytext, token_type, lineno);
}

void yyerror(char *message){
    printf("\tError:\t%s\n", yytext);
    // printf("Error: \"%s\" in line %d. Token = %s\n", message, lineno, yytext);
    // exit(1);
}


int main(int argc, char *argv[]){
  yyin = fopen(argv[1], "r");
  yylex();
  fclose(yyin);
  return 0;
}
