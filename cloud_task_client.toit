import pubsub
import .task show *
import .i_runnable show *
import .utils show *

OUTGOING_TOPIC ::= "cloud:demo/ping"
INCOMING_TOPIC ::= "cloud:demo/pong"

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

send message/string :
  print ("($time)>>$message")
  pubsub.publish OUTGOING_TOPIC message

main :
  task_ := Task Runnable
  task_.start

  send "start"
  sleep (Duration --ms=5000)

  send "start"
  sleep (Duration --ms=1000)

  send "start"
  sleep (Duration --ms=5000)

  send "start"
  sleep (Duration --ms=5000)

  send "start"
  sleep (Duration --ms=5000)

  send "start"
  sleep (Duration --ms=1000)

  send "start"
  sleep (Duration --ms=5000)

  send "start"
  sleep (Duration --ms=5000)

  send "start"
  sleep (Duration --ms=5000)

  send "exit"
  sleep (Duration --ms=5000)

  task_.final
