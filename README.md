# chai-by-proxy

## Usage
```bash
$ npm install --save-dev chai-by-proxy?                # node 0.10+

$ npm install --save-dev harmony-reflect               # node 0.10-5.x
$ echo "--harmony_proxies"         >> test/mocha.opts
$ echo "--require harmony-reflect" >> test/mocha.opts

$ echo "--harmony_collections"     >> test/mocha.opts  # node 0.10
```

### `have/has` (starts a chain)
```javascript
var obj = { foo: { bar: 'baz' } }

obj.should.have.foo.bar.eq('baz')
// same as
obj.should.have.property('foo').property('bar').eq('baz')
```
### `and` (goes back to the last have/has)
```javascript
var obj = { foo: { bar: '' }, 
            baz: { qux: 11 } }
            
expect(obj).to.have.foo.bar.instanceof('string')
               .and.baz.qux
```
### `without` (negates)
```javascript
var obj = { foo: { bar: {} } }

obj.should.have.foo.bar.without.baz
```
### `chai`'s properties are prior to your object's
```javascript
var obj = { which: 'that' }

// you can't do
obj.should.have.which.eq('that')

// instead, fallback to old style
obj.should.have.property('which', 'that')
```

## Example (in coffeescript)
```coffeescript
response =
    status: 200
    body:
      data:
        count: 1
        items: [
          { name: '', description: null }
        ]
        
response.should.have.status.eq(200)
                .and.body.without.error
                .and.body.data.has.count.above(0)
                              .and.items[0].has.name.which.is.a('string')
                                           .and.description
```
