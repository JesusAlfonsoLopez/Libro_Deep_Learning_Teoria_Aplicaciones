%%
% Figura  5.26 Código para cargar una CNN pre-entrenada en Matlab y usarla para   
% clasificar una imagen
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% 
% Programa que usa la red VGG-16 para clasificar el objeto de una 
% imagen
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
%
% Cargamos el modelo preentrenado. En este caso VGGNet 16 
Red = vgg16()
% Visualizar la arquitectura de la red
Red.Layers
% Cargamos la imagen a clasificar 
I = imread('Perro.jpg');
% Redimensionamos la imágenes para ser procesada por la red 
sz = Red.Layers(1).InputSize 
I = I(1:sz(1),1:sz(2),1:sz(3));
% Clasificamos la imagen usando la red cargada VGG-16 
Clase = classify(Red, I);
% Visualizamos la imagen y el resultado de la clasificación 
figure; 
imshow(I) 
text(10, 20, char(Clase),'Color','blue')

