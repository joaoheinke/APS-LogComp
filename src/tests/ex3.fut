// while e for
jogador dx = 3;
jogador dy = 2;

prorrogacao (dx + dy > 0) {
  marcar(zagueiro);
  dx = dx - 1;
  dy = dy - 1;
}

acrescimos (jogador i = 0; i < 3; i = i + 1) {
  gol(i);
}
