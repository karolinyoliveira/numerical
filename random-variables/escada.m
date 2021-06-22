## Copyright (C) 2021 Karoliny Oliveira Ozias Silva


#Obs.: A probabilidade de que o evento ocorra é muito baixa (52/52)*(4/51)*(4/50)=0.0063
function escada ()
  n = 10000;
  for i = 1:n 
    cartas_retiradas=0; #reseta contagem de cartas
    trinca=0;           #reseta trinca
    
    while (length(trinca)<=3)
      carta=ceil(rand()*52);          #tira uma carta
      if(!any(trinca == carta))       # Se não foi retirada ainda
        trinca=horzcat(trinca,carta); #coloca as cartas em uma matrix (1,4)
      endif
    endwhile
      
      if(trinca(3)==mod((trinca(2)+1),13) && trinca(4)==mod((trinca(3)+1),13)) # Se escada, independente do naipe
        res(i)=1;
        mod(trinca,13)
      else
        res(i)=0;
      endif
  endfor
 
  sum(res) #visualizando o numero de sequencias como a probabilidade é baixa não dá pra ver bem no histograma
  hist(res,[0:5])
  xlabel ("Escada - 1 True 0 False");
  ylabel ("Frequencia")
  title ("V.A. Exercicio 6 - escada")
  grid
endfunction
