/**
* Figura  3.55 Código para implementar la emulación de un sistema dinámico en        
* Arduino usando los pesos de una red MLP ya entrenada
* Autor:
* Jesús Alfonso López S
* jalopez@uao.edu.co
* Del libro: Deep Learning Teoría y aplicaciones.
* Edición: 2021
*
******************************************************************/
#include <math.h>
/******************************************************************
 * Configuración de la Red
 ******************************************************************/
const int NeuronasOculta = 10;
const int NeuronasEntrada = 2;
const int NeuronasSalida = 1;

float Samples=0;
float randNumber;
float Y_K_1=0;
float U_K_1=0;

// Estos valores son necesarios para la normalización de los datos cuando  //entran y salen de la red
// Rango de normalización
const float YMin = -1;
const float YMax = 1;

// Valores para normalizar la entrada de la red
const float X1Min = 0;
const float X1Max = 2.3324;
const float X2Min = 0.0385;
const float X2Max = 4.6735;

// Valores para normalizar la salida de la red
const float DMin =0.0304;
const float DMax =2.3324;
   
// Los pesos de la red fueron obtenidos en Matlab y se copiaron a este programa
// Pesos capa oculta
const float PesosOculta[NeuronasOculta][NeuronasEntrada+1]= {
{   -2.2495,   -0.1810,    2.5180},
{   -3.5054,    3.2482,    3.4958},
{   -3.1974,    0.7027,    3.0622},
{   -0.2848,   -0.0473,    0.0633},
{    1.1805,   -0.1649,   -0.4020},
{    1.8577,   -0.1566,    1.0441},
{  -3.1682,    2.7419 ,  -1.5666},
{    1.8801,    1.2001,    2.1583},
{   -3.3301,    0.1032,   -3.3366},
{   -1.4606,   -3.1980,   -4.9082}
};
// Pesos capa de salida
const float PesosSalida[NeuronasSalida][NeuronasOculta+1] = {
{   -0.0376,    0.0004,   -0.0153,   -2.5372,    0.1394,    0.0718,    0.0001,  0.0044,   -0.0454,   -0.0026,    0.1453}
};  
int i, j, p, q, r;
float Neta;
float CapaOculta[NeuronasOculta];
float CapaSalida[NeuronasSalida];
float CapaEntrada[NeuronasEntrada];
void setup(){
  //start serial connection
  Serial.begin(9600);
  randomSeed(analogRead(0));
}
void loop(){
 float Entrada;
 float Salida;
 float Tiempo;
Samples=Samples+1;

if (Samples==1)
{
  randNumber = random(500);
  Samples=Samples+1;
}

if (Samples>60)
{
  Samples=0;
}
Entrada=(randNumber/100);
// Normalización de las entradas que se usará en la red neuronal
CapaEntrada[0]=YMin+ ((Y_K_1-X1Min)*((YMax-YMin)/(X1Max-X1Min)));
CapaEntrada[1]=YMin+ ((U_K_1-X2Min)*((YMax-YMin)/(X2Max-X2Min)));
/******************************************************************
* Calculo de la salida de la capa oculta
******************************************************************/
    for( i = 0 ; i < NeuronasOculta ; i++ ) {    
      Neta = PesosOculta[i][NeuronasEntrada] ;
      for( j = 0 ; j < NeuronasEntrada ; j++ ) {
        Neta += PesosOculta[i][j]*CapaEntrada[j];
      }
      CapaOculta[i] = (2.0/(1.0 + exp(-2*Neta)))-1.0; 
    }
/******************************************************************
* Calculo de la salida de la red
******************************************************************/
    for( i = 0 ; i < NeuronasSalida ; i++ ) {    
      Neta = PesosSalida[i][NeuronasOculta] ;
      for( j = 0 ; j < NeuronasOculta ; j++ ) {
        Neta +=  PesosSalida[i][j]*CapaOculta[j];
      }
    CapaSalida[i] = Neta; 
    }
// La salida da la red esta nromalizada, para que quede en el rango original //hay que desnormalizar
// Desnormalización de la salida de la red neuronal
Salida=DMin+ ((CapaSalida[0]-YMin)*((DMax-DMin)/(YMax-YMin)));
Y_K_1=Salida;
U_K_1=Entrada;
Serial.print("Salida: "); 
Serial.print( Salida);      
Serial.print("  Entrada: "); 
Serial.println( Entrada);
delay(50);  
}
