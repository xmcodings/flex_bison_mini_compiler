%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int lineno;

struct Variable{
   char* type;
   char* name;
   char* scope;
};
struct Variable myvar[1000];

struct Method{
   int count;
   char* ptype[100];
   char* name;
};
struct Method mymethod[500];


char *type;
char *scope = "mainprog";
int varcnt;
int identcnt;
int paracnt;
int funcnt;
int isarg;

int yylex();
void yyerror(char *s);
void print_varlist();
void print_func();
void isMethodExist(char* id);
void isExist(char* id);
void methodOverlap(char* id);
%}

%union { 
   char* strval;
   char* ival;
}

%token <strval> ID

%token INTEGER
%token FLOAT
%token OPERATOR

%token MAINPROG
%token FUNCTION
%token PROCEDURE
%token BEGING
%token END
%token IF
%token THEN
%token ELIF
%token ELSE
%token NOP
%token WHILE
%token RETURN
%token PRINT
%token IN
%token TINT
%token TFLOAT
%token FOR

%token SEMICOLON
%token PERIOD
%token COMMA
%token ASSIGN
%token LPAREN
%token RPAREN
%token LSBRACKET
%token RSBRACKET
%token COLON

%token DELIMITER
%token WHITESPACE

%token PLUS
%token MINUS
%token MUL
%token DIV
%token GE
%token LE
%token G
%token L
%token EQUAL
%token NEQUAL
%token NOT
%token STRANGE

%type <strval> identifier_list

%left PLUS MINUS
%left MUL DIV
%error-verbose
%%
program: MAINPROG ID SEMICOLON declarations subprogram_declarations{scope = "mainprog"} compound_statement;
declarations: type identifier_list SEMICOLON declarations
         |  ;
identifier_list: ID {
      for(int i = 0; i < varcnt; i++){
         if(!strcmp($1, myvar[i].name))
            if(!strcmp(scope, myvar[i].scope))
               yyerror("variable already declared");
      }
       if(!scope){
        myvar[varcnt].scope = "mainprog";
       }else{
        myvar[varcnt].scope = scope;
       }
       myvar[varcnt].name = $1;
       myvar[varcnt++].type = type;
      if(isarg == 1){
       mymethod[funcnt - 1].count = paracnt + 1;
       mymethod[funcnt - 1].ptype[paracnt++] = type;
      }
       }
         | ID COMMA identifier_list {
      for(int i = 0; i < varcnt; i++){
         if(!strcmp($1, myvar[i].name))
            if(!strcmp(scope, myvar[i].scope))
               yyerror("variable already declared");
      }
       if(!scope){
        myvar[varcnt].scope = "mainprog";
       }else{
        myvar[varcnt].scope = scope;
       }
       myvar[varcnt].name = $1;
       myvar[varcnt++].type = type;
      if(isarg == 1){
       mymethod[funcnt - 1].count = paracnt + 1;
       mymethod[funcnt - 1].ptype[paracnt++] = type;
      }
       };
type: standard_type
         | standard_type LSBRACKET INTEGER RSBRACKET {type = "int[]"; }
standard_type: TINT{ type = "int"; }
        | TFLOAT{ type = "float"; } ;

subprogram_declarations: subprogram_declaration subprogram_declarations
         | ;
subprogram_declaration: subprogram_head declarations compound_statement ;

subprogram_head: FUNCTION ID{scope = $2; methodOverlap($2); mymethod[++funcnt - 1].name = $2; paracnt = 0; isarg = 1;} arguments COLON standard_type SEMICOLON {isarg = 0}
         | PROCEDURE ID{scope = $2; methodOverlap($2); mymethod[++funcnt - 1].name = $2;paracnt = 0; isarg = 1;} arguments SEMICOLON {isarg = 0};

arguments: LPAREN parameter_list RPAREN
         | ;
parameter_list: identifier_list COLON type
         | identifier_list COLON type SEMICOLON parameter_list;


compound_statement: BEGING statement_list END;
statement_list: statement
       | statement SEMICOLON statement_list ;
statement: variable ASSIGN expression
       | print_statement
       | procedure_statement
       | compound_statement
       | if_statement
       | while_statement
       | for_statement
       | RETURN expression
       | NOP ;
if_statement: IF expression COLON statement elseif_statement else_statement
elseif_statement: elseif_statement ELIF expression COLON statement_list
       |  ;
else_statement: ELSE COLON statement_list
       |  ;
while_statement: WHILE expression COLON statement else_statement ;
for_statement: FOR expression IN expression COLON statement else_statement ;
print_statement: PRINT
       | PRINT LPAREN expression RPAREN;
variable: ID {isExist($1);}
       | ID LSBRACKET expression RSBRACKET {isExist($1);};
procedure_statement: ID LPAREN{paracnt = 0;} actual_parameter_expression RPAREN  { isMethodExist($1); };
actual_parameter_expression: 
       | expression_list;
expression_list: expression {paracnt++;}
       | expression COMMA expression_list {paracnt++;};
expression: simple_expression
         | simple_expression relop simple_expression ;
simple_expression: term
         | term addop simple_expression ;
term: factor
       | factor multop term ;
factor: INTEGER
         | FLOAT
         | variable
         | procedure_statement
         | NOT factor
         | sign factor ;
sign: PLUS | MINUS ;
relop: L | LE | G | GE | EQUAL | NEQUAL | IN ;
addop: PLUS | MINUS ;
multop: MUL | DIV ;
%%
int main(int argc, char *argv)
{
   yyparse();
   return 0;
}

void isMethodExist(char* id){
   int error = 1;
   
   for(int i = 0; i < funcnt; i++)
      if(!strcmp(id, mymethod[i].name) && paracnt == mymethod[i].count){
         error = 0;
         break;
      }
   if(error == 1)
      yyerror("invalid method name or input parameters");
}
void isExist(char* id){
   int error = 1;
   for(int i = 0; i < varcnt; i++){
      if(!strcmp(id, myvar[i].name))
         if(!strcmp(scope, myvar[i].scope)){
            error = 0;
            break;
         }
   }
   if(error == 1)
      yyerror("variable not declared");
}
void  methodOverlap(char* id){
   int error = 0;
   for(int i = 0; i < funcnt; i++)
      if(!strcmp(id, mymethod[i].name))
         error = 1;
   if(error == 1)
      yyerror("method already declared");
}
void yyerror(char *s){
fprintf(stderr, "error: %s  line: %d\n", s, lineno + 1);
}



