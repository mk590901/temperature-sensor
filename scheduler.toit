import .generator_bundle
import .generator
import .body_temperature_thresholds
import .store show *

class Scheduler :
  
  list_ := [
    GeneratorBundle OUT_RANGE_LOW 4 (Generator OUT_RANGE_LOW  BodyTemperatureThresholds),
    GeneratorBundle CRITICAL_LOW  4 (Generator CRITICAL_LOW   BodyTemperatureThresholds),
    GeneratorBundle WARNING_LOW   5 (Generator WARNING_LOW    BodyTemperatureThresholds),
    GeneratorBundle NORMAL        6 (Generator NORMAL         BodyTemperatureThresholds),
    GeneratorBundle WARNING_HIGH  4 (Generator WARNING_HIGH   BodyTemperatureThresholds),
    GeneratorBundle CRITICAL_HIGH 5 (Generator CRITICAL_HIGH  BodyTemperatureThresholds),
    ]

  current_/ int :=  0
  index_/   int := -1

  store_ := Store "test"
  
  constructor :
    store_.reset current_ index_

  start idx/int -> none :
    current_  = idx
    index_    = -1
    //print "start $current_ $index_"
    store_.reset current_ index_

  nextStart idx/int -> none :
    current_  = idx
    index_    = 0
    //print "nextStart $current_ $index_"
    store_.reset current_ index_
    
  next -> float :

    current_ = store_.getCurrent
    index_ = store_.getIndex

    //print ("(1) next->[$current_,$index_]")
  
    pair/GeneratorBundle := list_[current_]
    
    index_++

    store_.putIndex index_

    if index_ == pair.size :
      current_++
      if current_ == list_.size :
        current_ = 0
      nextStart current_
    return list_[current_].value  

