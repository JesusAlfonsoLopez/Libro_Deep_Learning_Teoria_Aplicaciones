%%
% Figura  5.30 Código para crear el data set de MNIST compatible con un image data  % store
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% Rutina para generar la información compatible con el tipo de dato
% ImageDataStore con las imágenes del data set MNIST 
%
% Autor:
%       jalopez@uao.edu.co
%%
clear
close all
%Se cargan los datos de la base de datos mnist
load mnist.mat;
 
%%
% Para crear una estructura de datos compatible con los ImageDataStore
% que se usan en Matlab para trabajar especialmente redes
% convolucionales. Lo que hacemos es crear una carpeta para cada uno
% de los dígitos que  componen el data set de mnist para los datos de
% entrenamiento 
% El siguiente código recorre el data set que hemos trabajado en otros
% ejercicios y dependiente de digito crea una imagen que se guarda en
% la carpeta respectiva. Las carpetas donde se guardarán la imágenes 
% debe ser previamente creadas
Cont=0;
Cont1=0;
Cont2=0;
Cont3=0;
Cont4=0;
Cont5=0;
Cont6=0;
Cont7=0;
Cont8=0;
Cont9=0;
for i=1:60000
    
    if training.labels(i)==0
        Cont=Cont+1;
        NombreImagen=strcat('MnistTrainingData/0/Image',num2str(Cont),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
    end
 
   if training.labels(i)==1
        Cont1=Cont1+1;
        NombreImagen=strcat('MnistTrainingData/1/Image',num2str(Cont1),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
   end
    
   if training.labels(i)==2
        Cont2=Cont2+1;
        NombreImagen=strcat('MnistTrainingData/2/Image',num2str(Cont2),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
    end   
    if training.labels(i)==3
        Cont3=Cont3+1;
        NombreImagen=strcat('MnistTrainingData/3/Image',num2str(Cont3),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
    end
    
    if training.labels(i)==4
        Cont4=Cont4+1;
        NombreImagen=strcat('MnistTrainingData/4/Image',num2str(Cont4),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
    end
 
   if training.labels(i)==5
        Cont5=Cont5+1;
        NombreImagen=strcat('MnistTrainingData/5/Image',num2str(Cont5),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
   end
    
   if training.labels(i)==6
        Cont6=Cont6+1;
        NombreImagen=strcat('MnistTrainingData/6/Image',num2str(Cont6),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
    end   
    if training.labels(i)==7
        Cont7=Cont7+1;
        NombreImagen=strcat('MnistTrainingData/7/Image',num2str(Cont7),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
    end
 
   if training.labels(i)==8
        Cont8=Cont8+1;
        NombreImagen=strcat('MnistTrainingData/8/Image',num2str(Cont8),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
   end
    
   if training.labels(i)==9
        Cont9=Cont9+1;
        NombreImagen=strcat('MnistTrainingData/9/Image',num2str(Cont9),'.png')
        imwrite(training.images(:,:,i),NombreImagen)
    end   
   
    
end;
 
%%
% Lo que se hace es crear una carpeta para cada uno de los dígitos que
% componen el data set de mnist para los datos de validación
% El siguiente código recorre el data set que hemos trabajado en otros
% ejercicios y dependiente de digito crea una imagen que se guarda en
% la carpeta respectiva. Las carpetas donde se guardarán la imágenes 
% debe ser previamente creadas
Cont=0;
Cont1=0;
Cont2=0;
Cont3=0;
Cont4=0;
Cont5=0;
Cont6=0;
Cont7=0;
Cont8=0;
Cont9=0;
for i=1:10000
 
    if test.labels(i)==0
        Cont=Cont+1;
        NombreImagen=strcat('MnistTestData/0/Image',num2str(Cont),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
    end
 
   if test.labels(i)==1
        Cont1=Cont1+1;
        NombreImagen=strcat('MnistTestData/1/Image',num2str(Cont1),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
   end
    
   if test.labels(i)==2
        Cont2=Cont2+1;
        NombreImagen=strcat('MnistTestData/2/Image',num2str(Cont2),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
    end   
    if test.labels(i)==3
        Cont3=Cont3+1;
        NombreImagen=strcat('MnistTestData/3/Image',num2str(Cont3),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
    end
    
    if test.labels(i)==4
        Cont4=Cont4+1;
        NombreImagen=strcat('MnistTestData/4/Image',num2str(Cont4),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
    end
 
   if test.labels(i)==5
        Cont5=Cont5+1;
        NombreImagen=strcat('MnistTestData/5/Image',num2str(Cont5),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
   end
    
   if test.labels(i)==6
        Cont6=Cont6+1;
        NombreImagen=strcat('MnistTestData/6/Image',num2str(Cont6),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
    end   
    if test.labels(i)==7
        Cont7=Cont7+1;
        NombreImagen=strcat('MnistTestData/7/Image',num2str(Cont7),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
    end
 
   if test.labels(i)==8
        Cont8=Cont8+1;
        NombreImagen=strcat('MnistTestData/8/Image',num2str(Cont8),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
   end
    
   if test.labels(i)==9
        Cont9=Cont9+1;
        NombreImagen=strcat('MnistTestData/9/Image',num2str(Cont9),'.png')
        imwrite(test.images(:,:,i),NombreImagen)
    end   
 
 
end;

