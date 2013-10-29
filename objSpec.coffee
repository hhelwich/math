_ = require 'util/obj'

describe 'Object utils', ->

  describe 'createConstructor()', ->

    it 'creates a new empty object with given prototype', ->
      proto = a: 123
      obj = do (_.createConstructor proto)
      (expect obj).not.toBe proto
      (expect obj.a).toBe 123
      proto.a = 456
      (expect obj.a).toBe 456

    it 'creates a new object with given prototype and constructor', ->
      proto = a: 123
      construct = (@b) ->
      obj = (_.createConstructor proto, construct) 456
      (expect obj.a).toBe 123
      (expect obj.b).toBe 456

    it 'adds optional stuff to constructor', ->
      stuff =
        a: ->
        b: 3
      constr = _.createConstructor {}, (->), stuff
      for foo of stuff
        (expect constr[foo]).toBe stuff[foo]

    it 'ignores constructor function return value', ->
      foo = { bla: 42 }
      constr = _.createConstructor {}, -> foo
      obj = constr()
      (expect obj).not.toBe foo
