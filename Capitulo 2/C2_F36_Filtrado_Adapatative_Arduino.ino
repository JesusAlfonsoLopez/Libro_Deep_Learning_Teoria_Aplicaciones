#include <math.h>
/***************************************************************************
 * Programa para el filtrado adaptativo de una señal senoidad 
 * contaminada  con ruido de alta frecuencia usando una red Adaline
 * Autor: 
 *        Jesús Alfonso López S
 *        jalopez@uao.edu.co
 *  Del libro: Deep Learning Teoría y aplicaciones.
 *  Edición: 2021
 *        
**************************************************************************/
//Número de neuronas de entrada
const int N = 4;
//Número de neuronas de salida
const int M = 1;
// Definición de pi
const float pi=3.1416;
//Definición de las muestras que se van a usar para el filtrado de la señal
// Son la entrada para la red neuronal
float X_K=0;
float X_K_1=0;
float X_K_2=0;
float X_K_3=0;
// Salida deseada
float D;
// Razón de aprendizaje
float alfa=0.23;
// Matriz con los pesos de la red. El último valor es al bias
float Pesos[M][N+1]= {
   {1.0, 1.0, 1.0, 1.0, 1.0}
   }; 

int i, j;
float Neta;
float SalidaRed[M];
float EntradaRed[N];
 
void setup(){
  //Configuración de la comunicación serial
  Serial.begin(9600);
}

void loop(){
  float Entrada;
  float Salida;
  float Tiempo;
  float SenoOri;
  float SenoRuido;
Entrada=millis();
Tiempo=Entrada/1000; 
// Señal senoidal sin contaminación
SenoOri=sin(10*pi*0.05*Tiempo);
// Señal senoidal con contaminación
SenoRuido=sin(10*pi*0.05*Tiempo)+0.30*sin(10*pi*0.050*5*Tiempo);
// Muestra actual de la señal a filtrar 
X_K=SenoRuido;
// Definición de la entrada de la red
EntradaRed[0]=X_K;
EntradaRed[1]=X_K_1;
EntradaRed[2]=X_K_2;
EntradaRed[3]=X_K_3;
D=SenoOri;
/******************************************************************
* Calculo de la salida de la red
******************************************************************/
    for( i = 0 ; i <M ; i++ ) {    
      Neta = Pesos[i][N] ;
      for( j = 0 ; j < N ; j++ ) {
        Neta += Pesos[i][j]*EntradaRed[j];
      }
      SalidaRed[i] = Neta; 
    }
Salida=SalidaRed[0];
// Actualización de pesos de la red neuronal
Pesos[0][0]=Pesos[0][0]+alfa*(D-Salida)*X_K;
Pesos[0][1]=Pesos[0][1]+alfa*(D-Salida)*X_K_1;
Pesos[0][2]=Pesos[0][2]+alfa*(D-Salida)*X_K_2;
Pesos[0][3]=Pesos[0][3]+alfa*(D-Salida)*X_K_3;
Pesos[0][4]=Pesos[0][4]+alfa*(D-Salida);
// Se actualizan las muestras de la señal para la próxima 
// iteracion
X_K_3=X_K_2;
X_K_2=X_K_1;
X_K_1=X_K;

   Serial.print(Salida);       
   Serial.print("\t");    
   Serial.print(SenoRuido);       
   Serial.print("\t");    
   Serial.println(SenoOri);       
   
delay(10);  
}
