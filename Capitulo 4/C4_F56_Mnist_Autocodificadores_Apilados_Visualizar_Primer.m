%%
% Figura  4.56 Código para visualizar los pesos de la capa oculta del primer             
% autocodificador
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

% Extraemos los pesos de la parte codificadora del autocodificador.
PesosCodificador=autoenc1.EncoderWeights;

% Cada neurona tiene 784 pesos que podemos visualizar como imágenes de
% 28x28. Para efectos de poder visualizar bien las imágenes 
% resultantes, solo mostraremos los pesos de las primeras 25 neuronas
figure
for i=1:5
    for j=1:5
       Salida=PesosCodificador(((i-1)*5)+j,:);
       Ima_Salida=reshape(Salida,28,28);
       subplot(5,5,((i-1)*5)+j)
% Los rangos de visualización pueden variar dependiendo del
% entrenamiento, estos valores se pueden obtener con el comando minmax
% aplicado a la matriz de peso
       imshow(Ima_Salida,'DisplayRange',[-0.2047 0.3066]);
      
    end
end
