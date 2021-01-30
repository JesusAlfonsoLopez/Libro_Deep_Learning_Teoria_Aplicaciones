%%
% Figura  2.15 Código para entrenar una red tipo Perceptron para que 
% aprenda la función lógica AND
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%%
% Definición de la función lógica AND  
% X es la entrada al red  y D es la salida deseada
 X=[0 0 1 1 ;
    0 1 0 1 ] ;
 D=[0 0 0 1] ;
 
%Para ver la gráfica de estos patrones se usa el comando plotpv
 plotpv(X,D)
%Generación de un Perceptrón con unos pesos fijos
 red = newp(X,D)
 red.iw{1,1}=randn(1,2);
 red.b{1}= randn(1,1);
%Visualización de la superficie de separación con los pesos de la red cuando %ha sido creada
 Pesos=red.iw{1,1};
 Bias=red.b{1};
 plotpc(Pesos,Bias)
%Entrenamiento de la red 
 red = train(red,X,D)
%Visualización de la superficie de separación cuando la red ha sido entrenada 
 figure;
 Pesos=red.iw{1,1};
 Bias=red.b{1};
 plotpv(X,D)
 plotpc(Pesos,Bias)

% Prueba de la salida de la red Patrón de prueba [0,0]
 in_prueba=[0;0];   
 a = sim(red, in_prueba) 
%Salida esperada, a = 0
% Prueba de la salida de la red Patrón de prueba [1,1]
 in_prueba=[1;1];   
 a = sim(red, in_prueba) 
%Salida esperada, a = 1
%Exportación de la red simulink
 gensim(red)
