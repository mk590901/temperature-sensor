import device

class Store :
  store_              := null
  key_/string         := ""
  keyIndex_/string    := ""
  keyCurrent_/string  := ""

  constructor .key_ :
    keyIndex_   = key_ + "_idx"
    keyCurrent_ = key_ + "_current"
    init

  init :
    store_   = device.FlashStore
    //print ("store.init was done")

  get key/string -> any :
    result  := store_.get key 
    //print ("store.get -> $result")
    return result

  put key/string object/any :
    store_.set key object
    //print ("$object saved")
    return

  getIndex -> any :
    result  := get keyIndex_
    //print ("store.getIndex -> $result")
    return result
  
  putIndex object/any :
    put keyIndex_ object
    //print ("store.putIndex $object saved")
    return
  
  getCurrent -> any :
    result  := get keyCurrent_
    //print ("store.getIndex -> $result")
    return result
    
  putCurrent object/any :
    put keyCurrent_ object
    //print ("store.putCurrent $object saved")
    return

  reset current/any index/any :
    putCurrent current
    putIndex index

    
  