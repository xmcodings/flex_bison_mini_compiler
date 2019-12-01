%{
#include <stdio.h>
#include "test.tab.h"
int lineno;
%}

Letter [a-zA-Z]
Digit [0-9]
ID {Letter}({Letter}|{Digit})*

Integer {Digit}+
Float {Digit}*\.{Digit}+

Comment "//".*|"/*"[^*]*\*+([^*/][^*]*[*]+)*\/
CL "\n"
Whitespace [\t\ ]|{Comment}

%%
"mainprog" {return MAINPROG;}
"function" {return FUNCTION;}
"procedure" {return PROCEDURE;}
"begin" {return BEGING;}
"end" {return END;}
"if" {return IF;}
"then" {return THEN;}
"elif" {return ELIF;}
"else" {return ELSE;}
"nop" {return NOP;}
"while" {return WHILE;}
"return" {return RETURN;}
"print" {return PRINT;}
"in"  {return IN;}
"int" {return TINT;}
"float" {return TFLOAT;}
"for" {return FOR;}

";"  {return SEMICOLON;}
"."  {return PERIOD;}
","  {return COMMA;}
"="  {return ASSIGN;}
"("  {return LPAREN;}
")"  {return RPAREN;}
"["  {return LSBRACKET;}
"]"  {return RSBRACKET;}
":"  {return COLON;}

"+"  {return PLUS;}
"-"  {return MINUS;}
"*"  {return MUL;}
"/"  {return DIV;}
"<="  {return GE;}
">="  {return LE;}
"<"  {return G;}
">"  {return L;}
"=="  {return EQUAL;}
"!="  {return NEQUAL;}
"!"  {return NOT;}


{ID} {yylval.strval = strdup(yytext); return ID;}
{Integer} {return INTEGER;}
{Whitespace} {}
{CL} {lineno++;}

. {return STRANGE;}

%%

int yywrap(){
return 1;
}