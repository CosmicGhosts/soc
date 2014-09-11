# Module
soc = require '../lib'

# Dependencies
sinon = require 'sinon'
sinonChai = require 'sinon-chai'
chai = require 'chai'
{expect} = chai
chai.use(sinonChai)
{_extend} = require 'util'

o = it
x = it.skip

describe 'soc', ->

  describe '#done', ->
    context 'when not given an initial socject', ->
      beforeEach ->
        @soc = soc()

      o 'returns an empty socject', ->
        expect(@soc.done()).to.eql {}

    context 'when given an initial socject', ->
      beforeEach ->
        @initialsocject = foo: 'foo'
        @soc = soc(@initialsocject)

      o 'returns the initial socject', ->
        expect(@soc.done()).to.eql @initialsocject

  describe '#extend', ->
    beforeEach ->
      @soc = soc()

    context 'when extend is not given an socject', ->
      o 'recursively calls soc with the initial socject', ->
        expect(@soc.extend().done()).to.eql {}

    context 'when extend is given an socject', ->
      o 'extends the initial socject wrapped by soc', ->
        expect(@soc.extend(foo: 'foo').done()).to.eql foo: 'foo'

  describe 'mutability', ->
    context 'when soc is given an socject', ->
      o 'Should return the same reference of initial socject', ->
        foo = foo: 'foo'
        expect(soc(foo).done()).to.equal foo

      o 'Should extend the initial socject reference', ->
        foo = foo: 'foo'
        bar = bar: 'bar'
        expect(soc(foo).extend(bar).done!).to.equal _extend(foo, bar)
