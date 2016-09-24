# chai-by-proxy

## Usage
### mocha.opts (node < 6)
```
--require es6-symbol/implement  ## node 0.10
--harmony                       ##
--harmony_proxies               # node 0.12+
--require harmony-reflect       #
```

## Example
```
response.should.have.status.eq(200)
               .and.body.without.error
               .and.body.data.has.count.which.is.above(0)
                             .and.items[0].has.name.instanceof(String)
                                          .and.description
```
