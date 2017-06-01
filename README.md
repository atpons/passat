# Passat
Passat is the gem: DIMACS CNF format file parser and satisfability checker.

## Installation

```ruby
gem 'passat'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install passat

## Usage

This is `sample.cnf`, passat supports [DIMACS CNF format](http://www.satcompetition.org/2009/format-benchmarks2009.html).

On now version, `c` and `p` are ignored.

```sample.cnf
c
c SAMPLE FILE
c
p cnf 5 3
1 -5 4 0
-1 5 3 4 0
-3 -4 0
```


```ruby
require "passat"

test = Passat:Boolean.new([1,0,1,0,0])

test.load("sample.cnf")

p test.input #=> [true, false, true, false, false]

test.convert #=> [[true, true, false], [false, false, true, false], [false, true]]

p test.check #=> true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/atpons/passat.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
