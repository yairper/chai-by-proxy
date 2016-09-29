# chai-by-proxy

## Usage
```bash
$ npm install ?
$ npm install --save-dev harmony-reflect              # node 0.10+
$ echo "--harmony_proxies"         >> test/mocha.opts
$ echo "--require harmony-reflect" >> test/mocha.opts
$ echo "--harmony_collections"     >> test/mocha.opts # node 0.10
```

## Example
```javascript
response.should.have.status.eq(200)
               .and.body.without.error
               .and.body.data.has.count.above(0)
                             .and.items[0].has.name.which.is.a('string')
                                          .and.description
```
