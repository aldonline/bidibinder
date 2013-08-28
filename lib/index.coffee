
module.exports = ( opts ) -> new Binding opts

EQ = (x,y) -> x is y

class Binding  
  constructor: ( { @get_a, @get_b, @set_a, @set_b, @equals } ) -> @equals ?= EQ     
  _run: ( func ) -> unless @_m is yes then @_m = yes ; func() ; @_m = no
  touch_a: -> @_run => @set_b v unless @equals @get_b(), v = @get_a()
  touch_b: -> @_run => @set_a v unless @equals @get_a(), v = @get_b()