module.exports = function (chai) {
  var flag = chai.util.flag
  var PropertyProxy = require('./property_proxy')

  property('without', negate)
  property('have',    setRootObj)
  property('has',     setRootObj)
  property('and',     useRootObj)

  function property (name, getter) {
    chai.Assertion.overwriteProperty(name,
      function () { return getter })
  }

  function negate () {
    return new PropertyProxy(this.not)
  }

  function setRootObj () {
    flag(this, 'rootObj', this._obj)

    return new PropertyProxy(this)
  }

  function useRootObj () {
    var rootObj = flag(this, 'rootObj')
    if (rootObj) {
      flag(this, 'object', rootObj)
      flag(this, 'negate', false)
    }

    return new PropertyProxy(this)
  }
}
