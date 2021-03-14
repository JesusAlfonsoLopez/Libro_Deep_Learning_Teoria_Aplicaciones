%%
% Figura  4.47 Código que permite visualizar la información generada en la capa % codificadora
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% Creamos la red neuronal que almacenará los pesos de la parte 
% codificadora del autocodificador. Esta red recibirá la imagen con 
% un total de 784 valores y los pasará por dos capas ocultas de 500
% y 300 neuronas respectivamente para generar una salida de dos
% valores
XtrainLote=XtrainP(:,1:TamanoLote);

codificador=newff(XtrainLote,[ones(2,1) zeros(2,1)],[500 300],{'tansig','tansig','purelin'},'trainscg');
codificador.inputs{1}.processFcns={'mapminmax'};
codificador.outputs{3}.processFcns={'mapminmax'};

% La red creada tiene las dimensiones correctas pero los pesos 
%son los adecuados. Los mismos los extraemos de la red 
%autocodificadora completa ya entrenada y los copiamos la red 
% codificadora que acabamos de crear

 Wco1=red.iw{1};
 Bco1=red.b{1};
 Wco2=red.lw{2,1};
 Bco2=red.b{2};
 WcoCode=red.lw{3,2};
 BcoCode=red.b{3};
 
 codificador.iw{1}=Wco1;
 codificador.b{1}=Bco1;
 codificador.lw{2,1}=Wco2;
 codificador.b{2}=Bco2;
 codificador.lw{3,2}=WcoCode;
 codificador.b{3}=BcoCode;

% Con la red codificadora ya definida, procedemos a sacar 500 
% imágenes del conjunto de validación y generamos los códigos 
NPuntos=500;
Patrones= randperm(Total_Digitost,NPuntos);
Code=(sim(codificador,XtestP(:,Patrones)));

% Los códigos generados los graficamos en un plano. Dependiente del
% carácter que se pasa a la red, pintamos el código generado con un
% caracter determinado, en este caso usaremos el circulos para los 
% unos, signos de suma para y asteríscos para los seis
figure

Escala=minmax(Code);
 
Xmin=Escala(1,1);
Xmax=Escala(1,2);
Ymin=Escala(2,1);
Ymax=Escala(2,2);
for i=1:NPuntos
    if YtestLabelP(Patrones(i))==1
       plot(Code(1,i),Code(2,i),'ok')
       hold on
       axis([Xmin Xmax Ymin Ymax])
    end;
  
    if YtestLabelP(Patrones(i))==5
       plot(Code(1,i),Code(2,i),'+k')
       hold on
      axis([Xmin Xmax Ymin Ymax])
    end;
    if YtestLabelP(Patrones(i))==6
       plot(Code(1,i),Code(2,i),'*k')
       hold on
       axis([Xmin Xmax Ymin Ymax])
    end;
       
end;
