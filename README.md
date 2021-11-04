# DayFinder [![Gem Version](https://badge.fury.io/rb/DayFinder.svg)](https://badge.fury.io/rb/DayFinder)
DayFinder is a ruby gem. It is used to find the weekday of a given date.


# Syntax
```ruby
DayFinder.find(day,month,year)
```

# Example
```ruby
require 'DayFinder'
day=DayFinder.find 15,8,1947
puts day
#output
# Friday
```
# Find all dates 
```ruby
require 'DayFinder'
days=DayFinder.findAll 11,2021,"sunday"
print days
#output
# [7, 14, 21, 28]

```
## Installation
```ruby
gem 'DayFinder'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install DayFinder


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/freakflames29/DayFinder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/freakflames29/DayFinder/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DayFinder project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/freakflames29/DayFinder/blob/main/CODE_OF_CONDUCT.md).
