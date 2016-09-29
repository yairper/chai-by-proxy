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

  specify 'have does not override chai properties', ->
    assert.throws(
      -> { some: 1 }.should.not.have.property 'some',
      /to not have property 'some'$/)

  specify 'have.property=', ->
    assert.throws(
      -> { some: 1 }.should.have.some= 2,
      /to have a property 'some' of 2, but got 1$/)

  specify 'have.property.not=', ->
    assert.throws(
      -> { some: 1 }.should.have.some.not= 1,
      'expected 1 to not equal 1')

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

  specify 'example', ->
    response =
      status: 200
      body:
        data:
          count: 1
          items: [
            { name: '', description: null }
          ]

    response.should.have.status.eq(200)
                    .and.body.without.error
                    .and.body.data.has.count.above(0)
                                  .and.items[0].has.name.which.is.a('string')
                                               .and.description
    return
