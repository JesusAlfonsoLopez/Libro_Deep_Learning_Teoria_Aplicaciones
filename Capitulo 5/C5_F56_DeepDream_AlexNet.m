%%
% Figura  5.56 Código para realizar deepdream con la CNN AlexNet
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%% DeepDreamConAlexNet.m
% Programa que muestra cómo usar la técnica del deepdream para 
% visualizar el procesamiento de información al interior de una red 
% convolucional
%Autor:
%Jesús Alfonso López S.
%jalopez@uao.edu.co
%
 
%% 
% Cargo a red pre-entrenada AlexNet
Red = alexnet;
%% 
% Visualizamos la estructura de la red cargada
Red.Layers
Tam = Red.Layers(1).InputSize 
 
%%
% Selección de la capa donde deseamos visualizar el procesamiento de 
% la red
% Estos valores se obtienen de la estructura obtenida con el comando
% Red.Layers
% Primer capa convolucional 2
% Segunda capa convolucional 6
% Tercer capa convolucional 10
% Cuarta capa convolucional 12
% Quinta capa convolucional 14
% Primer capa totalmente conectada 17
% Segunda capa totalmente conectada 20
% Capa clasificadora 23
 
capa = 23;
 
%%
% Selección de los canales que se desean visualizar.
% La cantidad de canales depende del número de filtros que tenga la 
% capa en la que estemos trabajando.
% Estos valores se obtienen de la estructura obtenida con el comando
% Red.Layers
 
% Primer capa convolucional 96 canales
% Segunda capa convolucional 256 canales
% Tercer capa convolucional 384 canales
% Cuarta capa convolucional 384 canales
% Quinta capa convolucional 256 canales
% Primer capa totalmente conectada 4096 canales
% Segunda capa totalmente conectada 4096 canales
% Capa clasificadora 1000 canales corresponden a la cantidad de clases
%canales = [9 15 20 30 60 80];
%canales = [9 70 150 200 250 380];
 
canales = [9 188 231 563 855 975];
%%
% Si estamos trabajando en la capa clasificadora o 23, estos canales
% corresponden con los categorías o clases que la red ha aprendido
% Para las otras capas esto no se relaciona con la clase de salida, 
% en ese caso los canales corresponden a los mapas de características 
% que deseemos visualizar

% Para la capa 23 los canales seleccionados corresponden a 
%     'hen'
%     'Yorkshire terrier'
%     'Shetland sheepdog'
%     'fountain'
%     'theater curtain'
%     'geyser'

Red.Layers(end).ClassNames(canales)
 
%%
% Definimos la imagen inicial para el proceso deep dream
IniIma = imread('Laguna_Fin.jpg');
% Generamos la imagen con la configuración que hemos definido hasta el
% momento
 
% Para producir imágenes más detalladas podemos incrementar el número
% de niveles piramidales y el número de iteraciones por nivel
% piramidal
% El parámetro 'Verbose' nos permite mostrar o no en pantalla la
% evolución del procesamiento
Niveles = 2;
iteraciones = 20;
 
I = deepDreamImage(Red,capa,canales,'InitialImage',IniIma,...
    'NumIterations',iteraciones ,'Verbose',true,'PyramidLevels',Niveles);
 
% Creamos una figura y visualizamos las imágenes generadas, una por
% cada canal
figure
montage(I)
 
%%
% Si definimos un solo canal, se produce una imagen
% Algunos canales que se pueden usar son, recordar que esto es válido
% si Estamos trabajando con la capa clasificadora.
% La lista total de posibles clases con la que fue entrenada la red la
% podemos visualizar con el comando Red.Layers(end).ClassNames
 
%canales = 12; Pájaro amarillo
%canales = 188; Terrier
%canales = 739; Matera
%canales = 975; Geyser
canales = 975;
 
% Vamos a incrementar el número de iteraciones y niveles piramidales
% para generar una imagen más detallada 
Niveles = 4;
iteraciones = 100;
 
I = deepDreamImage(Red,capa,canales, ...
    'Verbose',false, ...
    'NumIterations',iteraciones, ...
    'PyramidLevels',Niveles,...
    'InitialImage',IniIma);
 
figure
imshow(I)

