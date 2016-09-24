module.exports = (chai) => {

  const flag = chai.util.flag
  const propertyProxy = require('./propertyProxy')

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
    let rootObj = flag(this, 'rootObj')

    if (rootObj)
      flag(this, 'object', rootObj)
  }

  function property (name, getter) {
    chai.Assertion.overwriteProperty(name, ()=> getter)
  }
}
