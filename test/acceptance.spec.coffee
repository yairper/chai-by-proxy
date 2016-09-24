require('chai').use require '../src'

describe 'acceptance', ->
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

  specify 'without', ->
    assert.throws(
      -> { some: 1 }.should.be.without.some,
      /to not have property 'some'$/)

  specify 'and', ->
    assert.throws(
      ->  { foo:
              baz: 0
              bar:
                baz: 0
          }.should.have.foo.bar.
                    and.baz,
      /to have a property 'baz'$/)
