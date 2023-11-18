import .i_thresholds show *

class BodyTemperatureThresholds implements IThresholds :
  lowCritical_/   float := 33.0
  lowWarning_/    float := 34.8
  highWarning_/   float := 37.8
  highCritical_/  float := 40.0
  outOfRangeLow_/ float := 25.0
  outOfRangeHigh_/float := 47.0

  highCritical  -> float :
    return highCritical_

  highWarning   -> float :
    return highWarning_

  lowCritical   -> float :
    return lowCritical_

  lowWarning    -> float :
    return lowWarning_

  outOfRangeHigh-> float :
    return outOfRangeHigh_

  outOfRangeLow -> float :
    return outOfRangeLow_

