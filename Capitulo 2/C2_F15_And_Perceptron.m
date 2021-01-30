%%
% Figura  2.15 C�digo para entrenar una red tipo Perceptron para que 
% aprenda la funci�n l�gica AND
% Autor:
% Jes�s Alfonso L�pez S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teor�a y aplicaciones.
% Edici�n: 2021
%%
% Definici�n de la funci�n l�gica AND  
% X es la entrada al red  y D es la salida deseada
 X=[0 0 1 1 ;
    0 1 0 1 ] ;
 D=[0 0 0 1] ;
 
%Para ver la gr�fica de estos patrones se usa el comando plotpv
 plotpv(X,D)
%Generaci�n de un Perceptr�n con unos pesos fijos
 red = newp(X,D)
 red.iw{1,1}=randn(1,2);
 red.b{1}= randn(1,1);
%Visualizaci�n de la superficie de separaci�n con los pesos de la red cuando %ha sido creada
 Pesos=red.iw{1,1};
 Bias=red.b{1};
 plotpc(Pesos,Bias)
%Entrenamiento de la red 
 red = train(red,X,D)
%Visualizaci�n de la superficie de separaci�n cuando la red ha sido entrenada 
 figure;
 Pesos=red.iw{1,1};
 Bias=red.b{1};
 plotpv(X,D)
 plotpc(Pesos,Bias)

% Prueba de la salida de la red Patr�n de prueba [0,0]
 in_prueba=[0;0];   
 a = sim(red, in_prueba) 
%Salida esperada, a = 0
% Prueba de la salida de la red Patr�n de prueba [1,1]
 in_prueba=[1;1];   
 a = sim(red, in_prueba) 
%Salida esperada, a = 1
%Exportaci�n de la red simulink
 gensim(red)
