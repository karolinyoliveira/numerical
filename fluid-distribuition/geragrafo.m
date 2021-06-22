function [nnos, narestas, C, coord] = geragrafo(n,m)
% funcao que constroi o grafo de malha retangular uniforme
%  ("n" pontos horizontais "m" pontos verticais)
%
%   REDE
%
%   X-----X-----X-----X-----X-----X
%   |     |     |     |     |     |
%   X-----X-----X-----X-----X-----X
%   |     |     |     |     |     |
%   X-----X-----X-----X-----X-----X
%   |     |     |     |     |     |
%   n+1---X-----X-----X-----X-----X
%   |     |     |     |     |     |
%   1-----2-----3-----4-----5-----n
%      I    II    III
%
%   INDEXACAO da lista de arestas:
%     As (n-1)*m primeiras linhas sao as arestas horizontais.
%     Na linha (n-1)*m+1 iniciam-se as arestas verticais,
%     dadas sequencialmente por:
%     (1,n+1), (2,n+2), ... , (n,n+n), ... , (n+1,n+n+1), ... , (n-1)*m + (m-1)*n.

nnos = n*m;
narestas = (n-1)*m + (m-1)*n;
% Arestas horizontais
for j=1:m
  for i=1:n-1
  k = (j-1)*(n-1) + i;
  C(k,1) = (j-1)*n + i;
  C(k,2) = (j-1)*n + i+1;
  end
end
% Arestas verticais
for i=1:n
  for j=1:m-1
  k = (n-1)*m + (j-1)*n + i;
  C(k,1) = i + (j-1)*n;
  C(k,2) = i + j*n;
  end
end
% Coordenadas (para desenhar)
for i=1:n
  for j=1:m
    ig = i + (j-1)*n;
    coord(ig,1) = i-1;
    coord(ig,2) = j-1;
  end
end
return
end