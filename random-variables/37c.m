1;

function confiabilidade ()
  horizonte_tempo = 1000;   n=10;                           # Parâmetros iniciais (n==numero de máquinas)
  reservas=300;                                             
  colapso=zeros(1,reservas);                                # Contador de colapsos pra cada valor de s
  n_repeticoes=10;
  
  for repeticoes=1:n_repeticoes                             # Loop diferentes repetições para cada valor de S
    for s = 1:reservas                                      # Loop diferentes valores de S
      disp=construir_sistema(n,s);                          # 0 Em funcionamento // 1 Disponível // -1 Em reparo
      t_reparos=zeros(1,n+s);                               # >0 tempo de funcionamento // <0 tempo que falta para reparo
      tempo_atual=1;
      p=0.01495; 
      while(tempo_atual<horizonte_tempo && sum(disp==0)>=n) # Loop temporal
        p=p+0.0005;
        for k=1:n+s                                         # Loop de máquinas
          if(disp(k)==0)                                    # Se em funcionamento
            if(rand()<p)                                    # Se máquina quebrou
              disp(k)=-1;                                   # Coloca a máquina em reparo
              t_reparos(k)=-reparo();                       # Determina tempo de reparo
              
              valor=0;index=1;
              while(valor!=1 && index<=n+s)                 # Procura máquina disponível e coloca em funcionamento
                valor=disp(index);
                index++;
              endwhile;
              
              if(index<=n+s)                                # Se tiver máquina disponível            
                disp(index)=0;
              else                                          # Se não encontrar declara colapso
                tempo_atual=7003;                           # FLAG 7003 = não houveram máquinas disponíveis
              endif;
            endif;
          endif;            
          if(disp(k)==-1)                                   # Se máquina estiver em reparo
            if(t_reparos(k)==0)                             # Se o tempo de reparo passou, coloca como disponível
              disp(k)=1;
            endif;
                       
          endif;
        t_reparos.+1;
        tempo_atual++;                                      # Incremento no tempo          
        endfor;

      endwhile;
      if(tempo_atual<1000 || tempo_atual==7004)             # Se o tempo máximo não for atingido ou 7004 == colapso
        colapso(s)++;
      endif;
   endfor;
  endfor;

  prob=colapso/n_repeticoes;
  desvio = std(prob)/sqrt(n_repeticoes)
  plot([1:reservas],prob)
  ylabel ("Probabilidade de Colapso t<1000","fontsize",34);
  xlabel ("Máquinas Adicionais S","fontsize",34);
  grid
endfunction

function res=reparo();
  val_possiveis= [20:20:60];
  res=val_possiveis(ceil(rand()*3));
endfunction

function res=construir_sistema(n,s);
  em_func=zeros(1,n);
  reservas=ones(1,s);
  res=[em_func,reservas];
endfunction