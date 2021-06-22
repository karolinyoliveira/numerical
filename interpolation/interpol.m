1;
function [res err]=resultado(h)
  x=[0 ; 0.1; 0.2; 0.5; 0.8; 0.9; 1];
  M=ones(7,1);                             #Criação da matriz com a base canônica de P^6 (1+x+x²+x³+x⁴+x⁵+x⁶)
  for k=1:6    
    M=[M x.^k]; 
  end
  a=M\h                                    # Print dos valores de a para fazer a sqder(x) com os valores corretos
  [res, ier, nfun, err]=quad('sqder',0,1); # Cálculo da integral definida [0,1] da derivada do polinômio interpolado (com os parâmetros de a).

  #Plotting
  c=0.0:0.005:1;
  for k=1:length(c)
    p(k)=a(1);
    pl(k)=0;
    for m=1:6
      p(k)=p(k)+a(m+1)*c(k)^m;             # Valor do polinômio interpolado p/ cada valor de c
      pl(k)=pl(k)+a(m+1)*m*c(k)^(m-1);     # Primeira derivada de p(k) p/ cada valor de c
    end
  end
  
  scatter(x,h,160,"filled");  hold on      # Pontos (x,h)
  plot(c,p,"linewidth",3)                  # P(k)
  area(c, pl.^2);                          # área abaixo da curva de (p'(k))^2
  plot(c,pl.^2,"linewidth",2)              # (P'(k))^2
  ylabel ("Espessura (mm)","fontsize",34);
  xlabel ("Comprimento (m)","fontsize",34);
  grid on
  hold off
endfunction

########################################## Exemplos ############################################

%p/ h(2)=3;
function y=sqder(x)
  y=0+71.4286-740.0794*2*x^1+2662.6984*3*x^2-4375.0000*4*x^3+3373.0159*5*x^4-992.0635*6*x^5;
  y=y.^2;
endfunction

% p/ h=[1 ; 2.3; 1.2; 1.5; 0.8; 2.9; 4];
% function y=sqder(x)
%   y=0+50.2897-567.0317*2*x^1+2351.0913*3*x^2-4480.1587*4*x^3+3958.3333*5*x^4-1309.5238*6*x^5;
%   y=y^2;
% endfunction

% p/ h=[2 ; 2.1; 2.2; 2.1; 2.0; 1.9; 2];
% function y=sqder(x)
%   y=0+0.0031746+18.1515873*2*x^1-101.4880952*3*x^2+216.2698413*4*x^3-204.3650794*5*x^4+71.4285714*6*x^5;
%   y=y^2;
% endfunction

h=ones(7,1); #nesse caso a derivada será nula p/ todo x então res=0
h(2)=3

#h=[1 ; 2.3; 1.2; 1.5; 0.8; 2.9; 4];

#h=[2 ; 2.1; 2.2; 2.1; 2.0; 1.9; 2];

[res err]=resultado(h)

