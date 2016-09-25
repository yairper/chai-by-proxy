# chai-by-proxy

## Usage
### mocha.opts (0.10 < node < 6)
```
--harmony_proxies
--require harmony-reflect

--harmony # node 0.10 only
```

## Example
```
response.should.have.status.eq(200)
               .and.body.without.error
               .and.body.data.has.count.above(0)
                             .and.items[0].has.name.which.is.a('string')
                                          .and.description
```
