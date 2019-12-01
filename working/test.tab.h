/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2006, 2009-2010 Free Software
   Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 258,
     INTEGER = 259,
     FLOAT = 260,
     OPERATOR = 261,
     MAINPROG = 262,
     FUNCTION = 263,
     PROCEDURE = 264,
     BEGING = 265,
     END = 266,
     IF = 267,
     THEN = 268,
     ELIF = 269,
     ELSE = 270,
     NOP = 271,
     WHILE = 272,
     RETURN = 273,
     PRINT = 274,
     IN = 275,
     TINT = 276,
     TFLOAT = 277,
     FOR = 278,
     SEMICOLON = 279,
     PERIOD = 280,
     COMMA = 281,
     ASSIGN = 282,
     LPAREN = 283,
     RPAREN = 284,
     LSBRACKET = 285,
     RSBRACKET = 286,
     COLON = 287,
     DELIMITER = 288,
     WHITESPACE = 289,
     PLUS = 290,
     MINUS = 291,
     MUL = 292,
     DIV = 293,
     GE = 294,
     LE = 295,
     G = 296,
     L = 297,
     EQUAL = 298,
     NEQUAL = 299,
     NOT = 300
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1685 of yacc.c  */
#line 40 "test.y"
 
	char* strval;
	char* ival;



/* Line 1685 of yacc.c  */
#line 103 "test.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


