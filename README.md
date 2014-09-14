soc
===

soc is a simple object composer, that allows you to compose/extend objects together.  
Note this will change the values of the object reference you pass in initially, otherwise soc will create an object to extend for you.

# API
You use soc by requiring the soc module
```javascript
var soc = require('soc');
```


### soc
Give soc an object to wrap or just invoke soc, soc will use an empty object by default.  
soc will return an object that wraps over the object reference you passed in.
That returned object will allow you to extend the object.  
```javascript
soc() #=> soc({})
```
will return the ```extend``` and ```done``` methods wrapping the object state.


### extend
if you want to keep building on top of that object, use the extend method to copy properties over to the initial object.  
The cool part is soc will recursively return new soc objects after you finish extending so you can keep composing with objects.  
```javascript
soc = soc()
soc.extend({foo: 'foo'}) #=> soc({foo: 'foo'})
```


### done
once you're done extending the object you created with soc, use ```done``` to return the final object  
```javascript
soc = soc()
soc.extend({foo: 'foo'}).extend({bar: 'bar'}).done() #=> {foo: 'foo', bar: 'bar'}
```
