%%
% Figura  3.48 Código para entrenar la red neuronal superficial con el conjunto de datos  
% MNIST
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

% Se define el tamaño de batch o lote para el entrenamiento
TamanoLote=1000;
 
% Se genera el primer lote para definir la estructura de la red
XtrainLote=Xtrain(:,1:TamanoLote);
YtrainLote=Ytrain(:,1:TamanoLote);
%Creamos la red neuronal con capas oculta y de salida tipo tansig 
%Se recomienda usar como algoritmo de entrenamiento traingdx o trainscg

red=newff(XtrainLote,YtrainLote,[50],{'tansig','tansig'},'trainscg');
%Matlab por defecto anulas las entradas con valores repetidos.
%Cancelamos esta acción para que la red siempre reciba los 784 pixeles de
%la imagen
red.inputs{1}.processFcns={'mapminmax'};
red.outputs{2}.processFcns={'mapminmax'};
red.dividefcn='';
 
%Se define la cantidad de imágenes a procesar
Total_Digitos=60000;

%Es posible modificar el siguiente ciclo for para lograr entrenar la red %más épocas. En ese caso un época se define cuando se han generado la %cantidad suficiente de minilotes para cubrir todo el data set
for epochs=1:1
% Se calculan la cantidad de lotes que se usarán en el proceso de entrenamiento   
% Se recomienda una cantidad de lotes que sea divisor del número total %de imágenes a procesar
N=ceil(Total_Digitos/TamanoLote);
% Se entrena la red por cada uno de los lotes     
for i=1:N
% En cada iteración se obtiene el lote respectivo del data set
% Las imágenes a procesar se definen de manera aleatoria
    Indices_Lote = randperm(Total_Digitos,TamanoLote);
    XtrainLote=Xtrain(:,Indices_Lote);
    YtrainLote=Ytrain(:,Indices_Lote);
 
% Cada lote se entrenará diez iteraciones    
    red.trainparam.epochs=10;
% Se entrena la red   
    red=train(red,XtrainLote,YtrainLote);
%Visualización de la época y de lote que se está trabajando
    epochs
    i
  
end;
 
end;
 
