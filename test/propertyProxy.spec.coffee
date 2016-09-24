describe 'propertyProxy', ->
  sandbox = null
  beforeEach -> sandbox = sinon.sandbox.create()
  afterEach  -> sandbox.restore()

  fakeChai = {
    property: ->
    not:
      eq: ->
    to: 'be awesome'
  }

  propertyProxy = require '../src/propertyProxy'
  behaviour = sinon.spy()
  boundProxy = propertyProxy(behaviour).bind(fakeChai)

  it 'calls chainingPropertyBehaviour', ->
    boundProxy()

    sinon.assert.calledOn behaviour, fakeChai

  describe 'proxy', ->
    describe 'get', ->

      context 'chai property', ->
        it 'delegates to chai', ->
          assert.equal boundProxy().to, 'be awesome'

      context 'not a chai property', ->
        it 'delegates to property method', ->
          propertySpy = sandbox.spy(fakeChai, 'property')

          proxy = boundProxy()
          proxy.foo

          sinon.assert.calledWith propertySpy, 'foo'

        it 'returns proxy', ->
          proxy = boundProxy()

          assert.equal proxy.foo, proxy

