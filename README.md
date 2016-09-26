# chai-by-proxy

## Usage
### node 6


### node 0.12+
`npm install --save-dev harmony-reflect`

mocha.opts

`--harmony_proxies --require harmony-reflect`

### node 0.10
```
mocha --harmony
```

## Example
```
response.should.have.status.eq(200)
               .and.body.without.error
               .and.body.data.has.count.above(0)
                             .and.items[0].has.name.which.is.a('string')
                                          .and.description
```
