var proxyCache = new WeakMap()

module.exports = function (behaviour) {
  return function () {
    behaviour.call(this)

    if (!proxyCache.has(this))
      proxyCache.set(this, new Proxy(this, {

        get: function (target, name, proxy) {
          if (name in target)
            return target[name]
          else {
            target.property(name)
            return proxy
          }
        }
      }))

    return proxyCache.get(this)
  }
}
