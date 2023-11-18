import .i_runnable show *

class Task :
  t_ := null
  runnable_/IRunnable :=  ? 
 
  constructor .runnable_/IRunnable :
    runnable_.inside this

  start :
    print "******* START *******"
    t_ = task:: runnable_.thread

  final :
    if (t_ == null) :
      return
    print "******* FINAL *******"
    t_.cancel
    t_ = null
  
  
