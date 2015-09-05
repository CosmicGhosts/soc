assign = require 'object-assign'

soc = (initial = {}) ->
  extend: (obj) -> soc assign(initial, obj)
  done: -> initial

module.exports = soc
