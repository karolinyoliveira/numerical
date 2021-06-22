## Copyright (C) 2021 Karoliny Oliveira Ozias Silva

function fullhousea ()
  n = 1000;
  for i = 1:n 
    cartas_retiradas=53;  #Reseta as cartas (com valor invalido) que serão retiradas
    
    #Retirada de duas cartas iguais
    carta=ceil(rand()*13); #Prob desconsiderando naipe 1/13=4/52, então não tem problema não usar rand()*52
    for j=1:2
      cartas_retiradas=horzcat(cartas_retiradas,carta);
    endfor     
    
    #Retira outras três aleatórias
     while (length(cartas_retiradas)<=5)
      carta=ceil(rand()*13);                              #tira uma carta
      if(sum(cartas_retiradas == carta)<=4)               #Se não foram retirados os 4 naipes de carta
        cartas_retiradas=horzcat(cartas_retiradas,carta); #coloca as cartas em uma matrix (1,6)
      endif
    endwhile
   
    #Check FullHouse com vetor de frequencia para cada possivel carta (desconsidera naipe)
    isFullHouse=zeros(13,1);
    for j=2:6
      isFullHouse(cartas_retiradas(j))++;
    endfor
    
    if(any(isFullHouse == 2) && any(isFullHouse == 3))
      res(i)=1;
    else
      res(i)=0;
    endif
  endfor
  
  sum(res) #visualizando o numero de fullhouses como a probabilidade é baixa não dá pra ver bem no histograma
  hist(res)
  xlabel ("FullHouse - 1 True 0 False");
  ylabel ("Frequencia")
  title ("V.A. Exercicio 8 - fullhousea")
  grid
endfunction
