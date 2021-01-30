%%
% Figura  2.34 Código para filtrar una señal de voz 
% usando una red ADALINE
% Autor:
% Jesús Alfonso López S.
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%%
% Se cargan los datos de la señal de voz que se desea filtrar 
% desde un archivo *.mat
load filtrado_voz_Adaline 
% Se genera la señal de ruido
ruido=-0.05+0.1*sin(2*pi*10000*[0:33074]/Fs);
ruido=ruido';
% Se contamina la voz con el ruido
voz_contaminada=voz_ori+ruido;
obj_audio=audioplayer(voz_contaminada,Fs);
% Se reproduce la voz contaminada
play(obj_audio);
time = [0:33074]/Fs;
X = ruido';
P = con2seq(X);
T = con2seq(voz_contaminada');
% Creamos una red ADALINE con 15 retardos
net = newlin([-0.2 0.2],1,[0:15],0.01);
%Entrenamiento de la red
[net,Y,E,Pf]=adapt(net,P,T);
%Visualización de las señales trabajadas de la red
plot(time,cat(2,Y{:}),'b', ...
   time,cat(2,T{:}),'r', ...
   time,cat(2,E{:}),'g',[1 2.5],[0 0],'k')
legend({'Salida','Salida Deseada','Voz Filtrada'})
Econ=seq2con(E)
obj_audio=audioplayer(Econ{1,1},Fs);
% Se reproduce la voz filtrada
play(obj_audio);
