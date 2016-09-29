# chai-by-proxy

## Usage
### node 6
```
npm install ?
```


### node 0.12+
```
$ npm install --save-dev harmony-reflect`
$ echo "--harmony_proxies --require harmony-reflect" >> test/mocha.opts
```

### node 0.10
```
$ echo "--harmony_collections" >> test/mocha.opts
```

## Example
```
response.should.have.status.eq(200)
               .and.body.without.error
               .and.body.data.has.count.above(0)
                             .and.items[0].has.name.which.is.a('string')
                                          .and.description
```
