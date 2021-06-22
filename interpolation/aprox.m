1;
function res=phi(k,x)
  res=x.^(k-1);
end

function res=fmodel(theta,x)
  m=length(theta);
  res=theta(1)*phi(1,x);
  for k=2:m
    res=res+theta(k)*phi(k,x);
  end
end

function ll=perda(theta) #erro quadrático médio
  global xx 
  global yy 
  x=xx; y=yy; nx=length(x);
  fx=fmodel(theta,x);
  ll=(fx-y)*(fx-y)'/nx;
end

function res=resultado2(x,h)
  global xx
  global yy
  m=6;n=100;
  xx=x;
  yy=h;
  ci=ones(7,1);
  theta=sqp(ci,@perda);
  coefder=polyder(theta);

  #Foi calculado a integral p/ qualquer coefder via integral-calculator e o resultado foi: 
  res=(1260*coefder(6).^2+(2772*coefder(5)+3080*coefder(4)+3465*coefder(3)+3960*coefder(2)+4620*coefder(1))*coefder(6)+1540*coefder(5).^2+(3465*coefder(4)+3960*coefder(3)+4620*coefder(2)+5544*coefder(1))*coefder(5)+1980*coefder(4).^2+(4620*coefder(3)+5544*coefder(2)+6930*coefder(1))*coefder(4)+2772*coefder(3).^2+(6930*coefder(2)+9240*coefder(1))*coefder(3)+4620*coefder(2).^2+13860*coefder(1)*coefder(2)+13860*coefder(1).^2)/13860;

  if (1)
    figure 2
    hold on
    scatter(xx,yy,100,"+r")
    hold on
    scatter(xx,yy,100,15,"filled")
    xg=0:.05:1;
    fxg=fmodel(theta,xg);
    plot(xg,fxg,"r-","linewidth",3)
    ylabel ("Espessura (mm)","fontsize",34);
    xlabel ("Comprimento (m)","fontsize",34);
    hold off
    pause
  end
  
endfunction

% ########################################## Exemplos ############################################
x=linspace(0,1,100);
h=rand(1,100)*2;
%h=[ones(1,15)*1.2  ones(1,14).*3  ones(1,14).*2.1 ones(1,14).*1.9 ones(1,14).*1.4 ones(1,14).*2.2 ones(1,15)];

res=resultado2(x,h)
