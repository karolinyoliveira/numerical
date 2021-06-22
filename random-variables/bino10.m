## Copyright (C) 2021 Karoliny Oliveira Ozias Silva

function bino10 ()
  n = 1000;
  for i = 1:n
    n_caras (i) = 0;
    for j = 1:10
      if (rand () < 0.6) # se for cara
        n_caras (i) = n_caras (i) + 1;
      endif
    endfor
  endfor
  
  hist(n_caras)
  xlabel ("Caras Obtidas");
  ylabel ("Frequencia")
  title ("V.A. Exercicio 0 - Bino10")
  grid
endfunction

