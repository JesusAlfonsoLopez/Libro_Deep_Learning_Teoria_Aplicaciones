%%
% Figura  2.24 Código para entrenar una red tipo Perceptron para que aprenda los
% números de 0 al 9 codificados en una matriz de 5x3
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%%

%Matriz de entrada con los bits que representan los diferentes 
%números del 0 al 9 

Xaux=[1 1 1 1 0 1 1 0 1 1 0 1 1 1 1; %bits del cero
0 1 0 0 1 0 0 1 0 0 1 0 0 1 0; %bits del uno …
1 1 1 0 0 1 1 1 1 1 0 0 1 1 1;
1 1 1 0 0 1 1 1 1 0 0 1 1 1 1;
1 0 1 1 0 1 1 1 1 0 0 1 0 0 1;
1 1 1 1 0 0 1 1 1 0 0 1 1 1 1;
1 0 0 1 0 0 1 1 1 1 0 1 1 1 1;
1 1 1 0 0 1 0 0 1 0 0 1 0 0 1;
1 1 1 1 0 1 1 1 1 1 0 1 1 1 1;
1 1 1 1 0 1 1 1 1 1 0 1 0 0 1 ]; %bits del nueve
%Se transpone la matriz para que quede con las dimensiones que la 
% red neuronal necesita
X=Xaux';
% Salida deseada de la red neuronal, Corresponde al código binario % del número decimal respectivo codificado en 4 bits
Daux=[0 0 0 0;
0 0 0 1;
0 0 1 0;
0 0 1 1;
0 1 0 0;
0 1 0 1;
0 1 1 0;
0 1 1 1;
1 0 0 0;
1 0 0 1 ];
%Se transpone la matriz para que quede con las dimensiones que la 
% red neuronal necesita
D=Daux'; 
% Se crea la red y se entrena 
Red=newp(X,D);
Red=train(Red,X,D);
%Validación de la red, se pide digitar un patrón
disp('para validar la red, digite el vector de patrones de entrada')                
disp('Numero de 10 binarios entre [ ]')
%Patrón de entrada
X1=input('X1=')                                            
%Simulación de la red
Y = sim(Red, X1');                                          
disp('el numero resultante, en binario, leído de arriba para abajo es:')
Y
