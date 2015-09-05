assign = require 'object-assign'

soc = (initial = {}) ->
  merge: (obj) -> soc assign(initial, obj)
  unwrap: -> initial

module.exports = soc
