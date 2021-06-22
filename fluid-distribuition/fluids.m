1;
function R=obstrucao(R,p)
  for i=1:size(R)(1)
    if(rand()<p)
      R(i,i)=10;
    endif;
  endfor
endfunction

function J=incidencia(m,n,C)
  J=zeros(m,n);
  for i=1:m
    J(i,C(i,1))=1;
    J(i,C(i,2))=-1;
  endfor;
endfunction

function pmin=fluidDistributor()
  p=0.05; P=0; n1=5; n2=4; a=1; r=1; R=1;

  [n,m,C,coord]=geragrafo(n1,n2);               # Gera grafo 20 nodes e 31 arestas
  
                                                # Inicializando d                                
  d=[zeros(m,1);ones(n,1).*(-1)];               # m primeiras -> zerado porque não ha bomba no sistema e n segundas -> consumo de cada nó = -1
  d(m+1)=P;                                     # vértice inferior esquerdo recebe o fluido do reservatório
  
                                                # Construindo B
  R=eye(m);                                     # Matriz identidade já que as resistências iniciais são 1
  R=obstrucao(R,p);                             # Gera obstruções randomicas com R=10
  J=incidencia(m,n,C);
  B=[R -J; J' zeros(n)];
  B(m+1,:)=eye(m+n)(m+1,:);                     # Substituição de P no vértice inferior esquerdo
  x=B\d;                                        # m primeiras -> fluxos (f) e n segundas -> vazão (q) a serem calculados
  q=x(m+1:m+n);                     
  pmin=sort(q)(1);                              # pressão mínima do experimento
endfunction

function [prob desvio]=evalProb()
  n_ocorrencias=0;
  n_repeticoes=1000;
  n_probs=10;
  prob=[];
  for i=1:n_probs
    for i=1:n_repeticoes
      pmin=fluidDistributor();
      if(pmin<=-40)
        n_ocorrencias++;
       endif;
    endfor;
    prob=[prob ; n_ocorrencias/n_repeticoes];   # Append no vetor de probabilidades geradas 
    n_ocorrencias=0;
  endfor;
  desvio = std(prob);                           # Desvio padrão
  prob=mean(prob);                              # Média
endfunction;

[prob desvio]=evalProb()


