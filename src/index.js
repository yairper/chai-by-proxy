module.exports = function (chai) {

  var flag = chai.util.flag
  var propertyProxy = require('./propertyProxy')

  property('without', propertyProxy(negate))
  property('have',    propertyProxy(setRootObj))
  property('and',     propertyProxy(useRootObj))

  function negate () {
    flag(this, 'negate', true)
  }

  function setRootObj () {
    flag(this, 'rootObj', this._obj)
  }

  function useRootObj () {
    var rootObj = flag(this, 'rootObj')

    if (rootObj)
      flag(this, 'object', rootObj)
  }

  function property (name, getter) {
    chai.Assertion.overwriteProperty(name,
      function () { return getter })
  }
}
