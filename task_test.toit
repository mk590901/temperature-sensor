import .task show *
import .i_runnable show *

class Runnable implements IRunnable :

  task_/Task? := null

  inside task/Task? :
    task_ = task

  thread :
    idx := 0
    while true :
      sleep --ms=100
      print ("PING $(idx++)")
      if (idx == 4) :
        task_.final

main :

  task_  := Task Runnable

  task_.start
  sleep (Duration --ms=2000)
  task_.final

  task_.start
  sleep (Duration --ms=1000)
  task_.final
