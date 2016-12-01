var cache = new WeakMap()

module.exports = function (target) {
  var proxy = cache.get(target) ||
    new Proxy(target,
    {
      get: function (target, name, proxy) {
        if (name in target)
          return target[name]

        target.property(name)
        return proxy
      }
    })

  cache.set(target, proxy)
  return proxy
}
