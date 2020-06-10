# analogger-client-cr

This is the Crystal version of the Analogger client library. It is intended to be at feature parity with the Ruby version, including logging to the local filesystem in the event of a remote server outage.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     analogger-client-cr:
       github: your-github-user/analogger-client.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "analogger/client"
```

## Development

## Contributing

1. Fork it (<https://github.com/wyhaines/analogger-client-cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Kirk Haines](https://github.com/wyhaines) - creator and maintainer
