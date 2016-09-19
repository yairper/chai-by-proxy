module.exports = (chai) => {

    const chaiProxy = (property, behaviour) =>

        chai.Assertion.overwriteProperty(property, () =>
            function () {
                behaviour.call(this)

                return new Proxy(this, {
                    get (target, name, proxy) {
                        if (name in target)
                            return target[name]
                        else {
                            target.property(name)

                            return proxy
                        }
                    },

                    set (target, name, value) {
                        name === 'not'? target.not.eq(value)
                                      : target.property(name, value)
                    }
                })
            })


    const negate = function () {
        chai.util.flag(this, 'negate', true)
    }

    chaiProxy('without', negate)
    chaiProxy('not',     negate)

    const setRootObj = function () {
        chai.util.flag(this, 'rootObj', this._obj)
    }

    const useRootObj = function () {
        let rootObj = chai.util.flag(this, 'rootObj')

        if (rootObj)
            chai.util.flag(this, 'object', rootObj)
    }

    chaiProxy('have', setRootObj)
    chaiProxy('and',  useRootObj)
}
