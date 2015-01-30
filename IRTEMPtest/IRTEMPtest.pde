/* System header files */
#include <plib.h>
#include <Wire.h>
//#include <OLED.h>
//#include <stdio.h>
//#include <string.h>

/* Application header files */

//#include "chipKIT_PRO_MX7.h" /* Processor board constants */
//#include "IRSENSOR_lib.h"   /* MLX90614 constants and SMBus files */
//#include "comm.h"           /* Serial data speed is 19.2 KB */
//#include "LCDlib.h"         /* Uses PIC32 PMP Bus for 8 data bit interface */
//#include "sw_timer.h"       /* General SW timer */
//#include "ir_scan_1.h"

#define IR_ID_GREEN             100     // GREEN    - 0x64
#define IR_ID_RED               101     // RED      - 0x65
#define IR_ID_BLUE              102     // BLUE     - 0x66

/* Factory default IR sensor device ID */
#define IR_ID_DEFAULT           0x5A    /* 90d */

//OledClass OLED;
//PmodIRTemp sensor;
int req=0;
char* trans;
char buf;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(19200);
  Wire.begin();
  /*OLED.begin();
  OLED.setFillPattern(OLED.getStdPattern(0));
  OLED.setCharUpdate(0);*/
/*
 sensor.system_initialize();
  
if(sensor.Read_IR_ID(IR_ID_DEFAULT))
    {
        Serial.print("Default IR Sensor found\n");
        sensor.rd_sensor_config(IR_ID_DEFAULT);
    }
    else{
        Serial.print("Default IR sensor NOT found\n\r");
    }
    Serial.print(".................................\n\n\r");
*/
}

void loop() {
  
  //sensor.read_IR_Sensor(0);
        //sensor.read_IR_Sensor(IR_ID_DEFAULT);
        req++;
        if (req>0xF)req=0;
        //OLED.clearBuffer();
        //OLED.setCursor(0, 0);
        //itoa(req, trans,2);
        //OLED.putString(trans);
        Wire.beginTransmission(req);
        Wire.send(0x06);
        int i= Wire.endTransmission();
        Serial.println(i);
        /*switch(i){
          case 0: trans="Acked";break;
          case 1: trans="Too long"; break;
          case 2: trans="Nack addr";break;
          case 3: trans="Nack data";break;
        }
        OLED.setCursor(0,1);
        OLED.putString(trans);
        OLED.setCursor(0,2);*/
        Wire.requestFrom(IR_ID_DEFAULT, 2);
        delay(150);
        i=Wire.available();
        Serial.println(i);
        while(Wire.available()){
           Serial.println(Wire.receive(), HEX);
        }
        
        delay(300);  /* Delay one-half second */

  
}


