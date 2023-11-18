import pubsub
import .i_outer
import .utils

INCOMING_TOPIC ::= "cloud:demo/ping"
OUTGOING_TOPIC ::= "cloud:demo/pong"

// INCOMING_TOPIC ::= "device:demo/ping"
// OUTGOING_TOPIC ::= "device:demo/pong"

class Outer implements IOuter :

  out message/string -> none :
    print ("($time)>>$message")
    pubsub.publish OUTGOING_TOPIC message