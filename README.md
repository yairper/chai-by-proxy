# chai-by-proxy

## Usage
### mocha.opts (node < 6)
```
--harmony_proxies               # node 0.12+
--require harmony-reflect       #
--require es6-symbol/implement  ## node 0.10
--harmony                       ##
```

## Example
```
response.should.have.status.eq(200)
               .and.body.without.error
               .and.body.data.has.count.above(0)
                             .and.items[0].has.name.which.is.a('string')
                                          .and.description
```
