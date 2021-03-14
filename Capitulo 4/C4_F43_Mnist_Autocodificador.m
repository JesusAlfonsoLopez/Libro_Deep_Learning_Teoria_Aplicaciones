%%
% Figura  4.43 Código para entrenar un autocodificador con el conjunto de datos   
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
 XtrainLote=XtrainP(:,1:TamanoLote);
 
%Creamos la red neuronal con capas oculta y de salida tipo tansig 
red=newff(XtrainLote,XtrainLote,[500 300 2 300 500],{'tansig','tansig','purelin','tansig','tansig','purelin'},'trainscg');

% No se permite que se eliminar filas constantes de valores en los 
% datos. Esto garantiza que la red siempre tendrá el total de 
% entradas y salidas. Solo se hará como procesamiento a la entrada
% y en la salida la normalización.     
red.inputs{1}.processFcns={'mapminmax'};
red.outputs{6}.processFcns={'mapminmax'};
 
red.dividefcn='';
 
% Cada lote se entrenará cinco iteraciones    
red.trainparam.epochs=5;
%BatchSize=10000;
for epochs=1:5
% Se calculan la cantidad de lotes que se usarán en el proceso de 
% entrenamiento   
% Se recomienda una cantidad de lotes que sea divisor del número 
% total de imágenes 
rng('shuffle') 
%Total_Digitos
N=ceil(Total_Digitos/TamanoLote);
% Se entrena la red por cada uno de los lotes     
for i=1:N
% En cada iteración se obtiene el lote respectivo del data set
    Indices_Lote = randperm(Total_Digitos,TamanoLote);
    XtrainLote=XtrainP(:,Indices_Lote);

% Se entrena la red    
    red=train(red,XtrainLote,XtrainLote);
%Visualización de la época y de lote que se está trabajando
    epochs
    i
  
end;
 
end;
 
