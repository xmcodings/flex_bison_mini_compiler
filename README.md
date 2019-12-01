# flex_bison_mini_compiler

consists of 2 main files
1. lex file for lexical analyzer
2. bison/yacc file for parsing

*others can be created with 2 files above


## this was a univ. assignment for Programming Languages Course at Chungang Univ., Seoul

### copyright of the assignment to prof. Kim Mu Cheol, CAU 

.

<Lexical Structure>

2. Lexical Structure.
Token ::= ID | int | float | Keyword | Operator | Delimiter ID ::= Letter (Letter | Digit)* Letter ::= a | ... | z | A | ... | Z Digit ::= 0 | ... | 9
Integer ::= Digit+ Float ::= *** You need to define this *** Keyword ::= mainprog | function | procedure | begin | end | if | then | else | nop | while |
return | print | in Operator ::= + | - | * | / | < | <= | >= | > | == | != | !
Delimiter ::= ; | . | , | = | ( | ) | [ | ] | :
Whitespace ::= <space> | <tab> | <newline> | Comment

<grammars>
3. Grammar
<program> ::= "mainprog" id ";" <declarations> <subprogram_declarations> <compound_statement> <declarations> ::= <type> <identifier_list> ";" <declarations> | epsilon <identifier_list> ::= id | id "," <identifier_list> <type> = <standard_type> | <standard_type> "[" num "]" <standard_type> ::= "int" | "float“ <subprogram_declarations> ::= <subprogram_declaration> <subprogram_declarations> | epsilon <subprogram_declaration> ::= <subprogram_head> <declarations> <compound_statement> <subprogram_head> ::= "function" id <arguments> ":" <standard_type> ";" | "procedure" id <arguments> ";“ <arguments> ::= "(" <parameter_list> ")" | epsilon <parameter_list> ::= <identifier_list> ":" <type> | <identifier_list> ":" <type> ";"
<parameter_list>
<compound_statement> ::= "begin" <statement_list> "end" <statement_list> ::= <statement> | <statement> ";" <statement_list> <statement> ::= <variable> "=" <expression> | <print_statement> | <procedure_statement> | <compound_statement> | <if_statement> | <while_statement>| <for_statement> | "return" <expression> | "nop“ <if_statement> ::= “if” <expression> “:” <statement> (“elif” <expression> “:” <statement>)* [“else” “:” <expression>]

<while_statement> ::= “while” <expression> “:” <statement> [“else” “:” <statement>] <for_statement> ::= “for” <expression> “in” <expression> “:” <statement> [“else” “:”
<statement>] <print_statement> ::= "print" | "print" "(" <expression> ")" <variable> ::= id | id "[" <expression> "]" <procedure_statement> ::= id "(" <actual_parameter_expression> ")" <actual_parameter_expression> ::= epsilon | <expression_list> <expression_list> ::= <expression> | expression "," <expression_list> <expression> ::= <simple_expression> | <simple_expression> <relop> <simple_expression> <simple_expression> ::= <term> | <term> <addop> <simple_expression> /* NOTE THE ABOVE GRAMMAR HAS BEEN CHANGED */ <term> ::= <factor> | <factor> <multop> <term> <factor> :: = Integer | Float | <variable> | <procedure_statement> | "!" <factor> | <sign> <factor> /* NOTE THE ABOVE GRAMMAR HAS BEEN CHANGED */ <sign> ::= "+" | "-" <relop> ::= ">" | ">=" | "<" | "<=" | "==" | "!=" | “in” <addop> ::= "+" | "-" <multop> ::= "*" | "/"
