/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_BUILD_FUTLANG_TAB_HPP_INCLUDED
# define YY_YY_BUILD_FUTLANG_TAB_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 6 "src/futlang.y"
 #include <string> 

#line 52 "build/futlang.tab.hpp"

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TOK_JOGADOR = 258,             /* TOK_JOGADOR  */
    TOK_CARTAO = 259,              /* TOK_CARTAO  */
    TOK_SUBSTITUICAO = 260,        /* TOK_SUBSTITUICAO  */
    TOK_PRORROGACAO = 261,         /* TOK_PRORROGACAO  */
    TOK_ACRESCIMOS = 262,          /* TOK_ACRESCIMOS  */
    TOK_GOL = 263,                 /* TOK_GOL  */
    TOK_CHUTAR = 264,              /* TOK_CHUTAR  */
    TOK_TOCAR = 265,               /* TOK_TOCAR  */
    TOK_MARCAR = 266,              /* TOK_MARCAR  */
    TOK_SENSOR = 267,              /* TOK_SENSOR  */
    TOK_BOOL = 268,                /* TOK_BOOL  */
    TOK_IDENT = 269,               /* TOK_IDENT  */
    TOK_INT = 270,                 /* TOK_INT  */
    TOK_EQ = 271,                  /* TOK_EQ  */
    TOK_NEQ = 272,                 /* TOK_NEQ  */
    TOK_LE = 273,                  /* TOK_LE  */
    TOK_GE = 274,                  /* TOK_GE  */
    TOK_AND = 275,                 /* TOK_AND  */
    TOK_OR = 276,                  /* TOK_OR  */
    UMINUS = 277,                  /* UMINUS  */
    PREC_IF = 278                  /* PREC_IF  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 19 "src/futlang.y"
 int ival; char* str; 

#line 95 "build/futlang.tab.hpp"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif




int yyparse (void* scanner);


#endif /* !YY_YY_BUILD_FUTLANG_TAB_HPP_INCLUDED  */
