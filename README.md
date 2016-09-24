# chai-by-proxy

## Example
```
response.should.have.status.eq(200)
               .and.body.without.error
               .and.body.data.has.count.which.is.above(0)
                             .and.items[0].has.name.instanceof(String)
                                          .and.description
```
