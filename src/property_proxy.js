var CACHE = require('es6-symbol')()

module.exports = function (target) {
  return target[CACHE] = target[CACHE] ||
    new Proxy(target,
    {
      get: function (target, name, proxy) {
        if (name in target)
          return target[name]

        target.property(name)
        return proxy
      }
    })
}
