%%
% Figura  4.38 Código para entrenar la red neuronal profunda con el conjunto de datos MNIST
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
%
%Entrenamiento de la red neuronal profunda
% Se define el tamaño de batch o lote para el entrenamiento
TamanoLote=1000;
 
% Se genera el primer lote para definir la estructura de la red
XtrainLote=Xtrain(:,1:TamanoLote);
YtrainLote=Ytrain(:,1:TamanoLote);
 
%Creamos la red neuronal con tres capas ocultas tipo tansig una capa 
% de salida tipo softmax 
red=newff(XtrainLote,YtrainLote,[100,100,100],{'tansig','tansig','tansig','softmax'},'trainscg');
% Definimos como función de pérdida la crossentropy 
red.performFcn='crossentropy';
%Cancelamos la opción que por defecto tiene Matlab de eliminar las filas de
% valores constantes, de esta manera la red siempre reciba los 784 pixeles 
%de la imagen
red.inputs{1}.processFcns={'mapminmax'};
% Por defecto Matlab normaliza la salida. Al trabajar con función de 
% salida tipo softmax hay que anular esta operación 
red.outputs{4}.processFcns={}
% Por defecto Matlab particiona los datos de entrenamiento en tres 
% conjuntos. El siguiente comando anula dicha operación 
red.dividefcn='';
% Definimos el número de iteraciones o épocas de entrenamiento y 
% entrenamos la red
 
%Se define la cantidad de imágenes a procesar
Total_Digitos=60000;
for epochs=1:5
% SE calculan la cantidad de lotes que se usarán en el proceso de entrenamiento   
% Se recomienda una cantidad de lotes que sea divisor del número total del 
% imágenes a procesar
N=ceil(Total_Digitos/TamanoLote);
% Se entrena la red por cada uno de los lotes     
for i=1:N
% En cada iteración se obtiene el lote respectivo del data set
% Las imágenes a procesar se definen de manera aleatoria
    Indices_Lote = randperm(Total_Digitos,TamanoLote);
    XtrainLote=Xtrain(:,Indices_Lote);
    YtrainLote=Ytrain(:,Indices_Lote);
 
% Cada lote se entrenará cinco iteraciones    
    red.trainparam.epochs=10;
% Se entrena la red   
    red=train(red,XtrainLote,YtrainLote);
%Visualización de la época y de lote que se está trabajando
    epochs
    i
  
end;
 
end;
view(red)
