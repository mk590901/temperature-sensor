import math
import .generator

NORMAL/         int  ::= 1
WARNING_LOW/    int  ::= 2
WARNING_HIGH/   int  ::= 3
CRITICAL_LOW/   int  ::= 4
CRITICAL_HIGH/  int  ::= 5
OUT_RANGE_LOW/  int  ::= 6 
OUT_RANGE_HIGH/ int  ::= 7 

class GeneratorBundle :
  mode_     /int        := ?
  size_     /int        := ?
  generator_/Generator  := ?

  constructor .mode_ .size_ .generator_ :

  mode -> int : 
    return mode_

  randomValue -> float :
    min/float := generator_.min
    max/float := generator_.max
    //print "[$min | $max]"
    randomNumber/int := (min*10).to_int + (random (((max - min)*10).to_int))
    return randomNumber.to_float/10 

  value -> float :
    return randomValue
  
  
  size -> int :
    return size_
  
  