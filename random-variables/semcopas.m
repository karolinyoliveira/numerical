## Copyright (C) 2021 Karoliny Oliveira Ozias Silva

function semcopas ()
  n = 1000;
  for i = 1:n 
    cartas_de_copas = 0;  #inicializa e reseta contagem de cartas de copas
    cartas_retiradas=53;  #inicializa e reseta as cartas (com valor invalido) que serão retiradas
    n_cartas_retiradas(i)=0;
    
    while(length(cartas_retiradas)!=53)   #53 considerando o valor de inicialização
      carta=ceil(rand()*52);              #tira uma carta
      if(!any(cartas_retiradas == carta)) # Se não foi retirada ainda
        if (carta>13 && carta<=26)        # Se a carta é de copas [13...26]
          cartas_de_copas ++;
        endif
        cartas_retiradas=horzcat(cartas_retiradas,carta);
      endif
      
      if(cartas_de_copas==13)
        n_cartas_retiradas(i)=length(cartas_retiradas);
        break;
      endif
      
    endwhile
  endfor
  
  hist(n_cartas_retiradas,[13:52])
  xlabel ("Cartas Retiradas");
  ylabel ("Frequencia")
  title ("V.A. Exercicio 4 - semcopas")
  grid
endfunction
