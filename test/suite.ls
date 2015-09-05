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

  describe '#unwrap', ->
    context 'when not given an initial object', ->
      beforeEach ->
        @soc = soc()

      o 'returns an empty object', ->
        expect(@soc.unwrap()).to.eql {}

    context 'when given an initial object', ->
      beforeEach ->
        @initialObject = foo: 'foo'
        @soc = soc(@initialObject)

      o 'returns the initial object', ->
        expect(@soc.unwrap()).to.eql @initialObject

  describe '#merge', ->
    beforeEach ->
      @soc = soc()

    context 'when extend is not given an object', ->
      o 'recursively calls soc with the initial object', ->
        expect(@soc.merge().unwrap()).to.eql {}

    context 'when extend is given an object', ->
      o 'extends the initial object wrapped by soc', ->
        expect(@soc.merge(foo: 'foo').unwrap()).to.eql foo: 'foo'

  describe 'mutability', ->
    context 'when soc is given an object', ->
      o 'Should return the same reference of initial object', ->
        foo = foo: 'foo'
        expect(soc(foo).unwrap()).to.equal foo

      o 'Should extend the initial object reference', ->
        foo = foo: 'foo'
        bar = bar: 'bar'
        expect(soc(foo).merge(bar).unwrap!).to.equal _extend(foo, bar)
