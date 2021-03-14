%%
% Figura  4.50 Código que permite generar imágenes de caracteres mano escritos con la 
% capa decodificadora
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% Creamos la red neuronal que almacenará los pesos de la parte 
% decodificadora del autocodificador. Esta red recibirá el código de 
% dimensión 2 y lo pasará por dos capas ocultas de 300 y 500 neuronas
% respectivamente para generar una salida de 784 valores 

XtrainLote=XtrainP(:,1:TamanoLote);
Decodificador=newff([ones(2,1) zeros(2,1)],XtrainLote,[300 500],{'tansig','tansig','purelin'},'trainscg');
Decodificador.inputs{1}.processFcns={'mapminmax'};
Decodificador.outputs{3}.processFcns={'mapminmax'};

% La red creada no tiene las conexiones adecuadas. Las mismas las 
% extraemos de la red autocodificadora completa y los copiamos a la red 
% decodificadora que acabamos de crear

 Wco1=red.lw{4,3};
 Bco1=red.b{4};
 Wco2=red.lw{5,4};
 
 Bco2=red.b{5};
 Wco3=red.lw{6,5};
 Bco3=red.b{6};
 
 Decodificador.iw{1}=Wco1;
 Decodificador.b{1}=Bco1;
 Decodificador.lw{2,1}=Wco2;
 Decodificador.b{2}=Bco2;
 Decodificador.lw{3,2}=Wco3;
 Decodificador.b{3}=Bco3;
 

% Para usar la componente decodificadora, simulamos esta red con un 
% código de dos valores y graficamos la salida con una imagen de 28x28.
% Hay que tener en cuenta que los códigos usar dependerán de cómo el 
% autocodificador haya realizado la reducción de dimensión. Para esto 
% recomendamos visualizar primero las gráficas de los códigos generados
% para ver las zonas que corresponde a cada número
 % Código para generar un uno
 Salida=(sim(Decodificador,[0.95;0.3]));
 
 % Código para generar un seis
 % Salida=(sim(Decodificador,[-1;-6]));
  
  % Código para generar un cinco
   %Salida=(sim(Decodificador,[0.5;-2]));
  
% Graficación del carácter generado 
 Ima_Salida=reshape(Salida,28,28);
 figure
 imshow(Ima_Salida);

