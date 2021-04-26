%%
% Código para crear el data set de Fashion MNIST compatible 
% con un image data  store
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%
% Rutina para generar la información compatible con el tipo de dato
% ImageDataStore con las imágenes del data set Fashion MNIST 
%
% Autor:
%       jalopez@uao.edu.co
%%
clear
close all
%Se cargan los datos de la base de datos mnist
load fashionmnist.mat;
 
%%
% Para crear una estructura de datos compatible con los ImageDataStore
% que se usan en Matlab para trabajar especialmente redes
% convolucionales. Lo que hacemos es crear una carpeta para cada una
% de las clases que  componen el data set de fashion mnist para los datos de
% entrenamiento 
% El siguiente código recorre el data set previamente cargado
% dependiente de digito crea una imagen que se guarda en
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
    
    if TrainFashionMnist.labels(i)==0
        Cont=Cont+1;
        NombreImagen=strcat('FashionMnistTrainingData/0/Image',num2str(Cont),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
    end
 
   if TrainFashionMnist.labels(i)==1
        Cont1=Cont1+1;
        NombreImagen=strcat('FashionMnistTrainingData/1/Image',num2str(Cont1),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
   end
    
   if TrainFashionMnist.labels(i)==2
        Cont2=Cont2+1;
        NombreImagen=strcat('FashionMnistTrainingData/2/Image',num2str(Cont2),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
    end   
    if TrainFashionMnist.labels(i)==3
        Cont3=Cont3+1;
        NombreImagen=strcat('FashionMnistTrainingData/3/Image',num2str(Cont3),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
    end
    
    if TrainFashionMnist.labels(i)==4
        Cont4=Cont4+1;
        NombreImagen=strcat('FashionMnistTrainingData/4/Image',num2str(Cont4),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
    end
 
   if TrainFashionMnist.labels(i)==5
        Cont5=Cont5+1;
        NombreImagen=strcat('FashionMnistTrainingData/5/Image',num2str(Cont5),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
   end
    
   if TrainFashionMnist.labels(i)==6
        Cont6=Cont6+1;
        NombreImagen=strcat('FashionMnistTrainingData/6/Image',num2str(Cont6),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
    end   
    if TrainFashionMnist.labels(i)==7
        Cont7=Cont7+1;
        NombreImagen=strcat('FashionMnistTrainingData/7/Image',num2str(Cont7),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
    end
 
   if TrainFashionMnist.labels(i)==8
        Cont8=Cont8+1;
        NombreImagen=strcat('FashionMnistTrainingData/8/Image',num2str(Cont8),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
   end
    
   if TrainFashionMnist.labels(i)==9
        Cont9=Cont9+1;
        NombreImagen=strcat('FashionMnistTrainingData/9/Image',num2str(Cont9),'.png')
        imwrite(TrainFashionMnist.images(:,:,i),NombreImagen)
    end   
   
    
end;
 
%%
% Lo que se hace es crear una carpeta para cada uno de las clases que
% componen el data set de fashion mnist para los datos de validación
% El siguiente código recorre el data set previamente cargado
% dependiente de digito crea una imagen que se guarda en
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
 
    if TestFashionMnist.labels(i)==0
        Cont=Cont+1;
        NombreImagen=strcat('FashionMnistTestData/0/Image',num2str(Cont),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
    end
 
   if TestFashionMnist.labels(i)==1
        Cont1=Cont1+1;
        NombreImagen=strcat('FashionMnistTestData/1/Image',num2str(Cont1),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
   end
    
   if TestFashionMnist.labels(i)==2
        Cont2=Cont2+1;
        NombreImagen=strcat('FashionMnistTestData/2/Image',num2str(Cont2),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
    end   
    if TestFashionMnist.labels(i)==3
        Cont3=Cont3+1;
        NombreImagen=strcat('FashionMnistTestData/3/Image',num2str(Cont3),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
    end
    
    if TestFashionMnist.labels(i)==4
        Cont4=Cont4+1;
        NombreImagen=strcat('FashionMnistTestData/4/Image',num2str(Cont4),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
    end
 
   if TestFashionMnist.labels(i)==5
        Cont5=Cont5+1;
        NombreImagen=strcat('FashionMnistTestData/5/Image',num2str(Cont5),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
   end
    
   if TestFashionMnist.labels(i)==6
        Cont6=Cont6+1;
        NombreImagen=strcat('FashionMnistTestData/6/Image',num2str(Cont6),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
    end   
    if TestFashionMnist.labels(i)==7
        Cont7=Cont7+1;
        NombreImagen=strcat('FashionMnistTestData/7/Image',num2str(Cont7),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
    end
 
   if TestFashionMnist.labels(i)==8
        Cont8=Cont8+1;
        NombreImagen=strcat('FashionMnistTestData/8/Image',num2str(Cont8),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
   end
    
   if TestFashionMnist.labels(i)==9
        Cont9=Cont9+1;
        NombreImagen=strcat('FashionMnistTestData/9/Image',num2str(Cont9),'.png')
        imwrite(TestFashionMnist.images(:,:,i),NombreImagen)
    end   
 
 
end;

