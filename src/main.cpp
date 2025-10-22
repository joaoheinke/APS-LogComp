#include <cstdio>
#include <cstdlib>
#include <iostream>

extern int yyparse(void* scanner);
extern int yylex_init(void** scanner);
extern int yylex_destroy(void* scanner);
extern void yyset_in(FILE* in_str, void* scanner);

int main(int argc, char** argv) {
  if (argc < 2) {
    std::cerr << "Uso: futlang <arquivo.fut>\n";
    return 1;
  }
  FILE* f = fopen(argv[1], "r");
  if (!f) { std::perror("Erro ao abrir arquivo"); return 1; }

  void* scanner = nullptr;
  yylex_init(&scanner);
  yyset_in(f, scanner);

  int rc = yyparse(scanner);

  fclose(f);
  yylex_destroy(scanner);

  if (rc == 0) {
    std::cout << "Parse OK\n";
    return 0;
  }
  std::cerr << "Falha na análise sintática\n";
  return 2;
}
