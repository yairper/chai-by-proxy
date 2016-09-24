const _proxy = Symbol()

module.exports = (behaviour) =>
  function () {
    behaviour.call(this)
    
    if (!this[_proxy])
      this[_proxy] = new Proxy(this, {

        get (target, name, proxy) {
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
