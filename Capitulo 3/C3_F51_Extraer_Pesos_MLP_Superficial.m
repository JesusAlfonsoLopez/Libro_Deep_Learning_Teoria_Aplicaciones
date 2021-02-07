%%
% Figura  3.51 Código para extraer los pesos de una red MLP 
% ya entrenada
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
%Código para extraer los pesos de la RNA
% La variable Red tiene almacenada una red ya entrenada

%Extración de los pesos y del bias de la capa oculta
Wco=Red.iw{1};
Bco=Red.b{1};
%Extración de los pesos y del bias de la capa salid
Wcs=Red.lw{2,1};
Bcs=Red.b{2};
%Generación de la matriz de pesos que se copiarán al Arduino
AllWco=[Wco Bco]
AllWcs=[Wcs Bcs]

%Pesos obtenidos en el proceso de entrenamiento
% Hay que tener en cuenta que el valor de los pesos depende 
% de cada sesión de entrenamiento
%
% Ejemplo de pesos generados
% 
% AllWco =
% 
%     9.2604   -9.7782
%     5.5290   -5.3131
%    -2.4016    2.0746
%    -3.7951    1.3718
%    -2.3471    0.3247
%     2.6038    0.3447
%     3.0316    1.0627
%     2.2732    2.0551
%    -6.7281   -6.3793
%    11.4747   11.8336
% 
% AllWcs =
% 
%   Columns 1 through 7
% 
%     0.0532    0.0762   -1.1651    0.0268    0.9367   -0.5716   -0.1500
% 
%   Columns 8 through 11
% 
%     1.3182   -0.0283    0.0240   -0.0797
