/**
* Figura  3.53 Código para implementar un generador de ondas senoidales en Arduino usando 
* los pesos de una red MLP ya entrenada
* Autor:
* Jesús Alfonso López S
* jalopez@uao.edu.co
* Del libro: Deep Learning Teoría y aplicaciones.
* Edición: 2021
**
******************************************************************/
#include <math.h>
/******************************************************************
 * Configuración de la Red
 ******************************************************************/
const int NeuronasOculta = 10;
const int NeuronasEntrada = 1;
const int NeuronasSalida = 1;

// Al usar una red entrenada en Matlab. La red trabaja con los datos //normalizados en la entrada y en la salida
// Estos valores son necesarios para la normalización de los datos cuando 
// ingresan y salen de la red.
// Rango de normalización, se usa el que por defecto utiliza Matlab
const float YMin = -1;
const float YMax = 1;

// Valores para normalizar la entrada de la red
const float XMin = 0;
const float XMax = 6.2832;
// Valores para normalizar la salida de la red
const float DMin = -2;
const float DMax = 2;

// Los pesos de la red fueron obtenidos en Matlab y se copiaron a este //programa
// Pesos capa oculta
const float PesosOculta[NeuronasOculta][NeuronasEntrada+1]= {
{    9.2604,   -9.7782},
{    5.5290,   -5.3131},
{   -2.4016,    2.0746},
{   -3.7951,    1.3718},
{   -2.3471,    0.3247},
{    2.6038,    0.3447},
{    3.0316,    1.0627},
{    2.2732,    2.0551},
{   -6.7281,   -6.3793},
{   11.4747,   11.8336}
 };
  
// Pesos capa de salida
const float PesosSalida[NeuronasSalida][NeuronasOculta+1]  = {
{    0.0532,    0.0762,   -1.1651,    0.0268,    0.9367,   -0.5716,   -0.1500,   1.3182,   -0.0283,    0.0240,   -0.0797 }
};

int i, j, p, q, r;
float Neta;
float CapaOculta[NeuronasOculta];
float CapaSalida[NeuronasSalida];
float CapaEntrada[NeuronasEntrada];
 
void setup(){
  //Iniciamos la comunicación serial
  Serial.begin(9600);
}

void loop(){
float Entrada;
float Salida;
 float Tiempo;

Tiempo=millis();
Entrada=(fmod(Tiempo,6283))/1000; 

// Normalización de la entrada que se usará en la red neuronal
CapaEntrada[0]=YMin+ ((Entrada-XMin)*((YMax-YMin)/(XMax-XMin)));

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
 //   Serial.print("\n");    // prints a tab 
    for( i = 0 ; i < NeuronasSalida ; i++ ) {    
      Neta = PesosSalida[i][NeuronasOculta] ;
      for( j = 0 ; j < NeuronasOculta ; j++ ) {
        Neta +=  PesosSalida[i][j]*CapaOculta[j];
      }
    CapaSalida[i] = Neta; 
    }
// La salida da la red esta normalizada, para que quede en el rango original //hay que desnormalizar
// Desnormalización de la salida de la red neuronal
Salida=DMin+ ((CapaSalida[0]-YMin)*((DMax-DMin)/(YMax-YMin)));
Serial.println( Salida);       
delay(50);  
}
