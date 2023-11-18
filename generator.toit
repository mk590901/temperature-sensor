import .i_thresholds
import .generator_bundle

class Generator :
  mode_/int := ?
  thresholds_/IThresholds := ?
  min_/float := ?
  max_/float := ?

  constructor .mode_ .thresholds_ :
    min_  = getMin mode_ thresholds_
    max_  = getMax mode_ thresholds_
  
  min -> float :
    return min_

  max -> float :
    return max_
  
getMin mode/int thresholds/IThresholds -> float :
  DELTA/float   ::= 2.0
  result/float  := 0.0
  if mode == NORMAL         :
    result = thresholds.lowWarning
  if mode == WARNING_LOW    :
    result = thresholds.lowCritical
  if mode == WARNING_HIGH   :
    result = thresholds.highWarning
  if mode == CRITICAL_LOW   :      
    result = thresholds.outOfRangeLow
  if mode == CRITICAL_HIGH   :      
    result = thresholds.highCritical
  if mode == OUT_RANGE_LOW  :              
    result = thresholds.outOfRangeLow - DELTA
  if mode == OUT_RANGE_HIGH :
    result = thresholds.outOfRangeHigh
  return result

getMax mode/int thresholds/IThresholds -> float :
  DELTA/float   ::= 2.0
  result/float  := 0.0
  if mode == NORMAL         :
    result = thresholds.highWarning
  if mode == WARNING_LOW    :
    result = thresholds.lowWarning
  if mode == WARNING_HIGH   :
    result = thresholds.highCritical
  if mode == CRITICAL_LOW   :
    result = thresholds.lowCritical
  if mode == CRITICAL_HIGH  :
    result = thresholds.outOfRangeHigh
  if mode == OUT_RANGE_LOW  :
    result = thresholds.outOfRangeLow
  if mode == OUT_RANGE_HIGH :
    result = thresholds.outOfRangeHigh + DELTA
  return result
  
  
