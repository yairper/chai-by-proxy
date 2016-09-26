describe 'PropertyProxy', ->

  PropertyProxy = require '../src/property_proxy'

  describe 'get', ->

    context 'chai property', ->
      it 'delegates to chai', ->
        fakeChai = { to: 'be awesome' }

        proxy = new PropertyProxy(fakeChai)

        assert.equal proxy.to, 'be awesome'

    context 'not a chai property', ->
      it "calls chai's property method", ->
        fakeChai = { property: -> }
        sinon.spy fakeChai, 'property'

        proxy = new PropertyProxy(fakeChai)
        proxy.foo

        assert.ok fakeChai.property.calledWith('foo')

      it 'chains proxy', ->
        fakeChai = { property: -> }

        proxy = new PropertyProxy(fakeChai)

        assert.equal proxy.foo.bar, proxy
