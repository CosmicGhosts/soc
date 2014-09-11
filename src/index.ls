{_extend} = require 'util'

soc = (initialsocject = {}) ->
  extend: (extension) ->
    soc _extend(initialsocject, extension)
  done: -> initialsocject

module.exports = soc
