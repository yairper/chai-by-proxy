'use strict'

require('chai').use require('../')

describe 'have', ->

    specify 'have.property', ->
        assert.throws(
            -> {}.should.have.someProperty,
            /to have a property 'someProperty'$/)

    specify 'have.deep.property', ->
        assert.throws(
            -> { some: 1 }.should.have.some.prop,
            "expected 1 to have a property 'prop'")

    it 'does not override chai properties', ->
        assert.throws(
            -> { some: 1 }.should.not.have.property 'some',
            /to not have property 'some'$/)

    specify 'have.property=', ->
        assert.throws(
            -> { someProperty: 'lol' }.should.have.someProperty= 'rofl',
            /to have a property 'someProperty' of 'rofl', but got 'lol'$/)

    specify 'have.property.not=', ->
        assert.throws(
            -> { some: 1 }.should.have.some.not= 1,
            /expected 1 to not equal 1$/)

    specify 'without', ->
        assert.throws(
            -> { some: 1 }.should.be.without.some,
            /to not have property 'some'$/)

    specify 'and', ->
        assert.throws(
            (->    { foo:
                        baz: 0
                        bar:
                            baz: 0
                    }.should.have.foo.bar.and.baz),
            /to have a property 'baz'$/)

    specify 'not', ->
        assert.throws(
            -> { some: 1 }.should.not.some,
            /to not have property 'some'$/)
