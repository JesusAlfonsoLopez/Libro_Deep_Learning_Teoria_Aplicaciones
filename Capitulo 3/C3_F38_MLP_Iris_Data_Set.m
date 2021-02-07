%%
% Figura  3.38 Código para entrenar una red tipo MLP 
% para resolver el problema de clasificación del Iris
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

%Se cargan los datos de un archivo texto y se dividen en los datos que 
%se van a usar para entrenar la red y los que se van a usar para 
%validación
close all
irisdata2=load('iris_data2.txt');
Datos_train_C1=irisdata2(1:35,1:4);
Datos_val_C1=irisdata2(36:50,1:4);
Datos_train_C2=irisdata2(51:85,1:4);
Datos_val_C2=irisdata2(86:100,1:4);
Datos_train_C3=irisdata2(101:135,1:4);
Datos_val_C3=irisdata2(136:150,1:4);
%La variable X tienen los datos de entrenamiento de las tres clases 
X=[Datos_train_C1;Datos_train_C2;Datos_train_C3]';
%La variable Y tienen la salida deseada. En este caso al ser tres 
%clases trabajaremos con tres neuronal en la salida  
Yd=[ones(1,35) zeros(1,70);zeros(1,35) ones(1,35) zeros(1,35);zeros(1,70) ones(1,35) ];
%Creamos la red neuronal con capas oculta y de salida tipo tansig 
red=newff(X,Yd,[10],{'tansig','tansig'},'trainlm');
% Por defecto Matlab particiona los datos de entrenamiento en tres 
% conjuntos. El siguiente comando anula dicha operación 
red.dividefcn='';
% Definimos el número de iteraciones o epocas de entrenamiento y 
% entrenamos la red
 
red.trainparam.epochs=200;
red=train(red,X,Yd);
 
%%
close all
%La variable Xval tienen los datos de validación de las tres clases
Xval=[Datos_val_C1;Datos_val_C2;Datos_val_C3]';
%Calculamos la salida de la red con los datos de validación
Yred1=sim(red,Xval);
 
%Generamos una figura con los datos de entrenamiento. 
%Clase 1=circulos, clase 2=Mases, clase 3=asteriscos
figure
plot3(Datos_train_C1(:,1),Datos_train_C1(:,2),Datos_train_C1(:,3),'ok'),
hold on
plot3(Datos_train_C2(:,1),Datos_train_C2(:,2),Datos_train_C2(:,3),'+k'),
plot3(Datos_train_C3(:,1),Datos_train_C3(:,2),Datos_train_C3(:,3),'*k'), 
hold off
%Generamos una figura con los datos de validación. 
%Clase 1=circulos, clase 2=Mases, clase 3=asteriscos
 
figure
plot3(Datos_val_C1(:,1),Datos_val_C1(:,2),Datos_val_C1(:,3),'ok'),hold on
plot3(Datos_val_C2(:,1),Datos_val_C2(:,2),Datos_val_C2(:,3),'+k'),
plot3(Datos_val_C3(:,1),Datos_val_C3(:,2),Datos_val_C3(:,3),'*k'), hold off
Yred=round(Yred1);
%Generamos una figura con la salida que produce la red con los datos de validación. 
%Clase 1=circulos, clase 2=Mases, clase 3=asteriscos
%Datos mal clasificados = Cuadrados
figure; axis([4 8 2 4 1 7])
hold on
for i=1:15
 if Yred(1,i)==1
 plot3(Datos_val_C1(i,1),Datos_val_C1(i,2),Datos_val_C1(i,3),'ok')
 else
 plot3(Datos_val_C1(i,1),Datos_val_C1(i,2),Datos_val_C1(i,3),'sk')
 end
end;
for i=1:15
 if Yred(2,i+15)==1
 plot3(Datos_val_C2(i,1),Datos_val_C2(i,2),Datos_val_C2(i,3),'+k')
 else
 plot3(Datos_val_C2(i,1),Datos_val_C2(i,2),Datos_val_C2(i,3),'sk')
 end
end;
for i=1:15
 if Yred(3,i+30)==1
 plot3(Datos_val_C3(i,1),Datos_val_C3(i,2),Datos_val_C3(i,3),'*k')
 else
 plot3(Datos_val_C3(i,1),Datos_val_C3(i,2),Datos_val_C3(i,3),'sk')
 end
end;
hold off
%%
%Generación de la matriz de confusión
Ydval=[ones(1,15) zeros(1,30);zeros(1,15) ones(1,15) zeros(1,15);zeros(1,30) ones(1,15) ];
figure;
plotconfusion(Ydval,Yred)
 
