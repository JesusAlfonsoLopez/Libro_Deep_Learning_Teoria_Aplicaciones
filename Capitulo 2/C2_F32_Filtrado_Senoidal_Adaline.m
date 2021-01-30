%%
% Figura  2.32 Código para filtrar una señal senoidal 
% usando una red ADALINE
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%%

%Definición de las señales a procesar
time = 1:0.01:5;
%Señal contaminada
X = sin(2*pi*2*time)+0.5*sin(2*pi*24*time);
P = con2seq(X);
%Señal objetivo
Taux = sin(2*pi*2*time);
T = con2seq(Taux);
figure
plot(time, cat(2,P{:}),time,cat(2,T{:}),'--')
title('Señales de Entrada y Salida Deseada')
xlabel('Tiempo')
legend({'Entrada','Salida Deseada'})
% Creamos una red ADALINE con 5 retardos
net = newlin([-2 2],1,[0 1 2 3 4 5],0.1);
% El peso de tendencia o umbral no se usa para esta aplicación.
net.biasConnect=0; 
 
%Entrenamiento de la red
[net,Y,E,Pf]=adapt(net,P,T);
figure
%Visualización de las señales trabajadas de la red
plot(time,cat(2,Y{:}),'b', ...
   time,cat(2,T{:}),'r', ...
   time,cat(2,E{:}),'g')
legend ({'Salida','Salida Deseada','Error'})
