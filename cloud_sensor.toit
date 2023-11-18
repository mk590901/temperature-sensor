import .sensor_state_machine show *
import .i_outer show *

class Sensor :

  outer_/IOuter := ?

  sensorStateMachine := SensorStateMachine SensorStateMachine.S_IDLE

  constructor .outer_/IOuter :
    sensorStateMachine.setOuter outer_

  start :
    busy ? finalMeasure : startMeasure

  startMeasure :
    sensorStateMachine.dispatch SensorStateMachine.E_START

  finalMeasure :
    sensorStateMachine.dispatch SensorStateMachine.E_BREAK

  busy -> bool :
    //print ("@busy->[$sensorStateMachine.getState]")
    if (sensorStateMachine.getState == SensorStateMachine.S_MEASUREMENT) :
      return true
    else :
      return false  
