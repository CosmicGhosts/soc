soc
===

soc is a simple object composer, that allows you to compose/extend objects together.  
Note this will change the values of the object reference you pass in initially, otherwise soc will create an object to extend for you.

# API
You use soc by requiring the soc module
```
var soc = require('soc');
```

### soc
either give soc an object to wrap or just invoke soc.  
soc will use an empty object by default.  
The cool part here is that soci will return an method to keep extending the object.  
```soc()``` or ```soc({foo: 'foo'})``` will return the ```extend``` and ```done``` methods wrapping the object state.


### extend
if you want to keep building on top of that object, use the extend method to copy properties over to the initial object.
The cool part is soc will recursively return new soc objects after you finish extending so you can keep composing with objects.
```
socj = soc()
socj.extend({foo: 'foo'}) # => soc({foo: 'foo'})
```


### done
once you're done extending the object you created with soc, use ```done``` to return the final object
```
socj = soc()
socj.extend({foo: 'foo'}).extend({bar: 'bar'}).done() # => {foo: 'foo', bar: 'bar'}
```
