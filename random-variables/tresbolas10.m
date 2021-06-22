## Copyright (C) 2021 Karoliny Oliveira Ozias Silva

function tresbolas10 ()
  n = 1000;  
  for i = 1:n 
    bolas_verdes(i) = 0; #inicializa contagem da repetição i
    bolas_retiradas=11;  #inicializa e reseta as bolas que serão retiradas
    
    for j = 1:3
      bola=ceil(rand()*10);
      if(!any(bolas_retiradas == bola)) # Se não foi retirada ainda
        if (bola>5)                     # Se a bola é verde 
          bolas_verdes(i) ++;
        endif
        bolas_retiradas=horzcat(bolas_retiradas,bola);
      else
        j--; #tira uma nova bola se a bola já tiver sido usada
      endif
      
    endfor
  endfor
  
  hist(bolas_verdes)
  xlabel ("Bolas Verdes Retiradas");
  ylabel ("Frequencia")
  title ("V.A. Exercicio 2 - tresbolas10")
  grid
endfunction
