%%
% Figura  5.47 Código para redimensionar las imágenes del data set original a un          % tamaño compatible con AlexNet
% Autor:
% Jesús Alfonso López S
% jalopez@uao.edu.co
% Del libro: Deep Learning Teoría y aplicaciones.
% Edición: 2021
%
%%

% Creación del data set con las imágenes del tamaño requerido por 
% AlexNet. Se debe tener descargado el data set original en la carpeta
% de nombrr flower_photos
FloresDatasetPath ='flower_photos/';
 FloresData = imageDatastore(FloresDatasetPath, ...
     'IncludeSubfolders',true,'LabelSource','foldernames');
 
 N=length(FloresData.Files)
 
Cont=0;
Cont2=0;
Cont3=0;
Cont4=0;
Cont5=0
 for i=1:N
     
         if string(FloresData.Labels(i))=='daisy'
             Cont=Cont+1;
            I = imread(FloresData.Files{i});
            J = imresize(I,[227 227]);
            NombreImagen=strcat('FloresData/Margaritas/Image',num2str(Cont),'.jpg')
            imwrite(J,NombreImagen)
         end;
         
         if string(FloresData.Labels(i))=='dandelion'
             Cont2=Cont2+1;
            I = imread(FloresData.Files{i});
            J = imresize(I,[227 227]);
            NombreImagen=strcat('FloresData/DienteLeon/Image',num2str(Cont2),'.jpg')
            imwrite(J,NombreImagen)
         end;
 
         if string(FloresData.Labels(i))=='roses'
             Cont3=Cont3+1;
            I = imread(FloresData.Files{i});
            J = imresize(I,[227 227]);
            NombreImagen=strcat('FloresData/Rosas/Image',num2str(Cont3),'.jpg')
            imwrite(J,NombreImagen)
         end;
         
         if string(FloresData.Labels(i))=='sunflowers'
             Cont4=Cont4+1;
            I = imread(FloresData.Files{i});
            J = imresize(I,[227 227]);
            NombreImagen=strcat('FloresData/Girasoles/Image',num2str(Cont4),'.jpg')
            imwrite(J,NombreImagen)
         end;
         
         if string(FloresData.Labels(i))=='tulips'
             Cont5=Cont5+1;
            I = imread(FloresData.Files{i});
            J = imresize(I,[227 227]);
            NombreImagen=strcat('FloresData/Tulipanes/Image',num2str(Cont5),'.jpg')
            imwrite(J,NombreImagen)
         end;
                  
end;

