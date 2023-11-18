import .trans show *
import .state show *
import .scheduler
import .utils
import .sensor_fun_collection show *
import .basic_state_machine show *
import .timers_engine_implementation show *
import .i_outer show *

//  Notifiers
class tDelayNotifier implements INotifier :
  stateMachine_/SensorStateMachine := ?
  constructor .stateMachine_ :
  start :
    //print "($time) [Timer] @start"

  final :
    //print "($time) [Timer] @final"
    stateMachine_.dispatch SensorStateMachine.E_DELAY


class SensorStateMachine extends BasicStateMachine :

// States
  static S_IDLE         /int := 0
  static S_MEASUREMENT  /int := 1

// Events 
  static E_START    /int := 0
  static E_DELAY    /int := 1
  static E_BREAK    /int := 2

  static states_descr_  := {    S_IDLE          : "IDLE",
                                S_MEASUREMENT   : "MEASUREMENT"
  }

  static events_descr_  := {    E_START : "start measurement",
                                E_DELAY : "close door",
                                E_BREAK : "break measurement"
  }

  timersEngine_ := TimersEngine 10
  scheduler_/Scheduler := Scheduler
  outer/IOuter? := null

  constructor state/int :
    super state
  
  setOuter pOuter/IOuter :
    outer = pOuter

  timersEngine :
    return timersEngine_

  scheduler :  
    return scheduler_  

  create :    
    
    states_[S_IDLE]         = State [Trans E_START    S_MEASUREMENT (OnStart    this)]
    states_[S_MEASUREMENT]  = State [Trans E_DELAY    S_IDLE        (OnDelay    this),
                                     Trans E_BREAK    S_IDLE        (OnBreak    this)]                         
 
    timersEngine_.create "tO" 2000 (tDelayNotifier this)
 
  publish publishState/int :
    //print ("($time) [State]->$(getStateName publishState)")

  getStateName state/int -> string :
    return states_descr_[state]

  getEventName event/int -> string :
    return events_descr_[event]
