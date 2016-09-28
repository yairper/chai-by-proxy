var proxyCache = new WeakMap()

module.exports = function (target) {
  proxy = proxyCache.get(target)

  if (!proxy)
    proxyCache.set(target, proxy= new Proxy(target, {

      get: function (target, name, proxy) {
        if (name in target)
          return target[name]
        else {
          target.property(name)
          return proxy
        }
      }
    }))

  return proxy
}
