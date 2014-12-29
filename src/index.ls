{_extend} = require 'util'

soc = (initialObject = {}) ->
  extend: (extension) ->
    soc _extend(initialObject, extension)
  done: -> initialObject

module.exports = soc
