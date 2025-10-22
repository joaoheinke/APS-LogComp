%option noyywrap nodefault yylineno reentrant bison-bridge noinput nounput

%x COMMENT  

%{
  #include "futlang.tab.hpp"
  #include <cstdlib>
  #include <cstring>
%}

%%

[ \t\r\n]+                      ;

"//".*                          ;

"/\\*"                          { BEGIN(COMMENT); }
<COMMENT>[^*]+                  ;
<COMMENT>"*"+[^*/]              ;
<COMMENT>"*"+"/"                { BEGIN(INITIAL); }
<COMMENT><<EOF>>                { BEGIN(INITIAL); return 0; }


"jogador"                       { return TOK_JOGADOR; }
"cartao"                        { return TOK_CARTAO; }
"substituicao"                  { return TOK_SUBSTITUICAO; }
"prorrogacao"                   { return TOK_PRORROGACAO; }
"acrescimos"                    { return TOK_ACRESCIMOS; }
"gol"                           { return TOK_GOL; }
"chutar"                        { return TOK_CHUTAR; }
"tocar"                         { return TOK_TOCAR; }
"marcar"                        { return TOK_MARCAR; }


"placar"                        { yylval->str = strdup("placar"); return TOK_SENSOR; }
"tempo"                         { yylval->str = strdup("tempo");  return TOK_SENSOR; }
"estadio"                       { yylval->str = strdup("estadio");return TOK_SENSOR; }


"verdadeiro"                    { yylval->ival = 1; return TOK_BOOL; }
"falso"                         { yylval->ival = 0; return TOK_BOOL; }


[0-9]+                          { yylval->ival = atoi(yytext);   return TOK_INT;   }
[A-Za-z_][A-Za-z0-9_]*          { yylval->str  = strdup(yytext); return TOK_IDENT; }


"=="                            { return TOK_EQ; }
"!="                            { return TOK_NEQ; }
"<="                            { return TOK_LE;  }
">="                            { return TOK_GE;  }
"&&"                            { return TOK_AND; }
"||"                            { return TOK_OR;  }

"="                             { return '='; }
"<"                             { return '<'; }
">"                             { return '>'; }
"+"                             { return '+'; }
"-"                             { return '-'; }
"*"                             { return '*'; }
"/"                             { return '/'; }
"%"                             { return '%'; }
"!"                             { return '!'; }
";"                             { return ';'; }
","                             { return ','; }
"("                             { return '('; }
")"                             { return ')'; }
"{"                             { return '{'; }
"}"                             { return '}'; }


.                               { return yytext[0]; }

%%
