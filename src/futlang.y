%define api.pure full
%define parse.error detailed
%parse-param { void* scanner }
%lex-param   { void* scanner }

%code requires { #include <string> }
%code {
  #include <cstdio>
  #include <cstdlib>
  #include <iostream>
  using namespace std;
  extern int yylex(YYSTYPE* yylval_param, void* scanner);
  void yyerror(void* /*scanner*/, const char* msg) {
    std::cerr << "[ERRO] sintático: " << msg << std::endl;
  }
}

/* yylval */
%union { int ival; char* str; }

/* tokens (tipados) */
%token TOK_JOGADOR TOK_CARTAO TOK_SUBSTITUICAO TOK_PRORROGACAO TOK_ACRESCIMOS
%token TOK_GOL TOK_CHUTAR TOK_TOCAR TOK_MARCAR
%token <str>  TOK_SENSOR
%token <ival> TOK_BOOL
%token <str>  TOK_IDENT
%token <ival> TOK_INT
%token TOK_EQ TOK_NEQ TOK_LE TOK_GE TOK_AND TOK_OR

/* tipos de não-terminais */
%type <ival> number boolean
%type <str>  ident sensor

/* precedência */
%right '='
%left  TOK_OR
%left  TOK_AND
%left  TOK_EQ TOK_NEQ
%left  '<' '>' TOK_LE TOK_GE
%left  '+' '-'
%left  '*' '/' '%'
%right '!' UMINUS
%nonassoc PREC_IF
%nonassoc TOK_SUBSTITUICAO

%%

programa
  : /* vazio */
  | programa declaracao_ou_comando
  ;

declaracao_ou_comando
  : declaracao
  | comando
  ;

/* declaração completa (com ;) para uso fora do for */
declaracao
  : TOK_JOGADOR ident '=' expr ';'
  | TOK_JOGADOR ident ';'
  ;

/* --- comandos --- */
comando
  : atribuicao ';'
  | acao ';'
  | gol_stmt ';'
  | cartao_stmt
  | prorrogacao_stmt
  | acrescimos_stmt
  | bloco
  ;

bloco
  : '{' lista_decl_cmd '}'
  ;

lista_decl_cmd
  : /* vazio */
  | lista_decl_cmd declaracao_ou_comando
  ;

/* if/else temático */
cartao_stmt
  : TOK_CARTAO '(' expr ')' comando                %prec PREC_IF
  | TOK_CARTAO '(' expr ')' comando TOK_SUBSTITUICAO comando
  ;

/* while temático */
prorrogacao_stmt
  : TOK_PRORROGACAO '(' expr ')' comando
  ;

/* for temático:
   init aceita: vazio | atrib | DECLARAÇÃO SEM ';' */
acrescimos_stmt
  : TOK_ACRESCIMOS '(' init_opt ';' expr_opt ';' step_opt ')' comando
  ;

/* declaração SEM ';' para uso em init do for */
init_decl
  : TOK_JOGADOR ident '=' expr
  | TOK_JOGADOR ident
  ;

init_opt
  : /* vazio */
  | atribuicao
  | init_decl
  ;

step_opt
  : /* vazio */
  | atribuicao
  ;

expr_opt
  : expr
  | /* vazio */
  ;

/* atribuição */
atribuicao
  : ident '=' expr
  ;

/* ações */
acao
  : TOK_CHUTAR '(' expr ')'
  | TOK_TOCAR  '(' ident ')'
  | TOK_MARCAR '(' ident ')'
  ;

/* saída */
gol_stmt
  : TOK_GOL '(' expr ')'
  ;

/* expressões */
expr
  : expr TOK_OR expr
  | expr TOK_AND expr
  | expr TOK_EQ expr
  | expr TOK_NEQ expr
  | expr '<' expr
  | expr '>' expr
  | expr TOK_LE expr
  | expr TOK_GE expr
  | expr '+' expr
  | expr '-' expr
  | expr '*' expr
  | expr '/' expr
  | expr '%' expr
  | '!' expr
  | '-' expr %prec UMINUS
  | '(' expr ')'
  | number
  | boolean
  | sensor
  | ident
  ;

number  : TOK_INT   { $$ = $1; } ;
boolean : TOK_BOOL  { $$ = $1; } ;
ident   : TOK_IDENT { $$ = $1; } ;
sensor  : TOK_SENSOR{ $$ = $1; } ;

%%
