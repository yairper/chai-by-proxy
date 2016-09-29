describe 'PropertyProxy', ->

  PropertyProxy = require '../src/property_proxy'

  describe 'get', ->

    context 'chai property', ->
      it 'delegates to chai', ->
        fakeChai = { to: 'be awesome' }

        proxy = new PropertyProxy(fakeChai)

        assert.equal proxy.to, 'be awesome'

    context 'not a chai property', ->
      it "calls chai's property assertion", ->
        fakeChai = { property: -> }
        sinon.spy fakeChai, 'property'

        proxy = new PropertyProxy(fakeChai)
        proxy.foo

        assert.ok fakeChai.property.calledWith('foo')

      it 'chains proxy', ->
        fakeChai = { property: -> }

        proxy = new PropertyProxy(fakeChai)

        assert.equal proxy.foo.bar, proxy

  describe 'set', ->
    it "calls chai's property assertion with value", ->
      fakeChai = { property: -> }
      sinon.spy fakeChai, 'property'

      proxy = new PropertyProxy(fakeChai)
      proxy.foo= 'bar'

      assert.ok fakeChai.property.calledWith('foo', 'bar')

    context 'not=', ->
      it "calls chai's not.eq with value", ->
        fakeChai = { not: eq: -> }
        sinon.spy fakeChai.not, 'eq'

        proxy = new PropertyProxy(fakeChai)
        proxy.not= 'bar'

        assert.ok fakeChai.not.eq.calledWith('bar')

