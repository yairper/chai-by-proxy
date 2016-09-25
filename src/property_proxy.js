var proxyCache = new WeakMap()

module.exports = function (target) {
  if (!proxyCache.has(target))
    proxyCache.set(target, new Proxy(target, {

      get: function (target, name, proxy) {
        if (name in target)
          return target[name]
        else {
          target.property(name)
          return proxy
        }
      }
    }))

  return proxyCache.get(target)
}
