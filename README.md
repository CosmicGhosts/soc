soc
===

soc is a simple socject builder, that allows you to compose/extend socjects together.
Note this will change the values of the socject reference you pass in initially,  
otherwise soc will create an socject to extend for you.

# API
You use soc by requiring the soc module
```
var soc = require('soc');
```

### soc
either give soc an socject to wrap or just invoke soc. soc will use an empty socject by default.
The cool part here is that soci will return an method to keep extending the socject.  
```soc()``` or ```soc({foo: 'foo'})``` will return the ```extend``` and ```done``` methods wrapping the socject state.


### extend
if you want to keep building on top of that socject, use the extend method to copy properties over to the initial socject.
The cool part is soc will recursively return new soc socjects after you finish extending so you can keep composing with socjects.
```
socj = soc()
socj.extend({foo: 'foo'}) # => soc({foo: 'foo'})
```


### done
once you're done extending the socject you created with soc, use ```done``` to return the final socject
```
socj = soc()
socj.extend({foo: 'foo'}).extend({bar: 'bar'}).done() # => {foo: 'foo', bar: 'bar'}
```
