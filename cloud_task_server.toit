import pubsub
import .utils
import .task show *
import .i_runnable show *
import .cloud_sensor show *
import .outer_pubsub show *

//  cloud_task_server <-> cloud_task_client
//  toit run -d=nuc cloud_task_server.toit
//  toit run -d=nuc cloud_task_client.toit

//  export PATH=$HOME/toit_demo/:$PATH
//  toit -d=nuc deploy cloud_task_server.yaml
//  toit device -d=nuc uninstall "CloudServer"

INCOMING_TOPIC ::= "cloud:demo/ping"
OUTGOING_TOPIC ::= "cloud:demo/pong"

outer/Outer := Outer
sensor/Sensor := Sensor outer

class Runnable implements IRunnable :

  command/string := ""
  outMessage/string := ""

  task_/Task? := null

  inside task/Task? :
    task_ = task

  thread :
    while true :
      pubsub.subscribe INCOMING_TOPIC --auto_acknowledge : | msg/pubsub.Message |
        command = msg.payload.to_string
        print "($time)<<$command"
        if (command == "start") :
          sensor.start
        else :
          if (command == "exit") :
            task_.final
  
main :
  task_  := Task Runnable
  task_.start

