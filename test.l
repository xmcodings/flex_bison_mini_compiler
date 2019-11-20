%{

%}

Token {ID}|{Integer}|{Keyword}|{Delimiter}|{Float}|{Operator}
Keyword "function"|"mainprog"|"procedure"|"begin"|"end"|"if"|"then"|"else"|"nop"|"while"|"return"|"print"|"in"
ID {Letter}({Letter}|{Digit})*
Digit [0-9]
Letter [a-zA-Z]
Integer ({Digit})+
Float ({Digit})*\.({Digit})+
Operator "+"|"*"|"-"|"/"|"<"|"<="|">="|"=="|"!="|">"|"!"
Delimiter ";"|"."|","|"="|"("|")"|"["|"]"|":"
Whitespace [\t\n\ ]|{Comment}
Comment "//"|"/*"({Token}*[\n]*)*"*/"

%%

{Keyword} {printf("%s : Keyword", yytext);}
{ID} {printf("ID");}
{Integer} {printf("Integer");}
{Operator} {printf("Operator");}
{Delimiter} {printf("Delimiter");}
{Float} {printf("Float");}
{Whitespace} {printf("White");}

%%

int yywrap(){
return 1;
}

int main(){
yylex();
return 0;
}