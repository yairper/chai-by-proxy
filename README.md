# chai-by-proxy

## Getting started
```bash
$ npm install --save-dev chai-by-proxy?                # node 0.10+
$ npm install --save-dev harmony-reflect               # node 0.10-5.x

$ echo "--harmony_proxies"         >> test/mocha.opts
$ echo "--require harmony-reflect" >> test/mocha.opts
$ echo "--harmony_collections"     >> test/mocha.opts  # node 0.10
```

## Usage
```javascript
var chai = require('chai')
chai.use(require('chai-by-proxy'))
```
### `have/has` (starts a chain)
```javascript
obj = { foo: { bar: 'baz' } })

obj.should.have.foo.bar.eq('baz')
// same as
obj.should.have.property('foo').property('bar').eq('baz')
```
### `chai`'s properties are prior to your object's
```javascript
obj = { which: '' }
// you can't do
obj.should.have.which
// instead, fallback to old style
obj.should.have.property('which')
```
### `and` (goes back to the last have/has)
```javascript
obj = { foo: { bar: '' }, 
        baz: { qux: 11 } }
            
obj.should.have.foo.bar.with.a('string')
           .and.baz.qux.eq(11)
```
### `without` (negates)
```javascript
obj = { foo: {} }

obj.should.have.foo.without.bar
```
### `=` (equals)
```javascript
obj = { foo: { bar: 'baz' } }

obj.should.have.foo.bar= 'baz'
```
### `not=` (not.equals)
```javascript
obj = { foo: { bar: 'baz' } }

obj.should.have.foo.bar.not= 'qux'
```
### long live the chain
```coffeescript
response =
  status: 200
  body:
    data:
      count: 1
      items: [
        { name: 'party pooper' }
      ]

expect(response).to.have.status.which.eq(200)
                    .and.body.without.error
                    .and.body.data.has.count.above(0)
                                  .and.items[0].name= 'party pooper'
```
