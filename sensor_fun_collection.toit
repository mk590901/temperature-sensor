import .i_transition
import .scheduler
import .utils
import .sensor_state_machine
import .timers_engine_implementation show *
import .i_outer show *

class OnStart implements ITransition :
  stateMachine_/SensorStateMachine := ?
  constructor .stateMachine_ :
  execute -> none :
    //print ("($time) @OnStart  - inside")
    //stateMachine_.outer.out "start"
    if (stateMachine_ != null) :
      stateMachine_.timersEngine.run "tO"


class OnDelay implements ITransition :
  stateMachine_/SensorStateMachine := ?
  constructor .stateMachine_ :
  execute -> none :
    //print ("($time) @OnDelay  - inside");
    value/float := stateMachine_.scheduler.next
    //print ("($time) @OnDelay  - [$value] inside");
    //@stateMachine_.outer.out "$value"
    stateMachine_.outer.out "$(%0.2f value)"

class OnBreak implements ITransition :
  stateMachine_/SensorStateMachine := ?
  constructor .stateMachine_ :
  execute -> none :
    //print ("($time) @OnBreak   - inside")
    stateMachine_.outer.out "cancel"
    if (stateMachine_ != null) :
        stateMachine_.timersEngine.close "tO"
  