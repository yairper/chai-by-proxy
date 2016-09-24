var _proxy = Symbol()

module.exports = function (behaviour) {
  return function () {
    behaviour.call(this)
    
    if (!this[_proxy])
      this[_proxy] = new Proxy(this, {

        get: function (target, name, proxy) {
          if (name in target)
            return target[name]
          else {
            target.property(name)
            return proxy
          }
        }
      })

    return this[_proxy] 
  }
}
