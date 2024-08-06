# ServiceObject

**ServiceObject** is a lightweight Ruby gem that provides a structured
approach to creating service objects in Ruby on Rails applications. This
library offers a base class with convenient methods for safely and
consistently executing business logic.

## Features
* Base Service Class: Provides a common structure for all service objects.
* Safe Call Method: Adds error handling to service object calls, ensuring a
consistent response format.
* Convenient Class-Level Methods: Allows calling service objects without instantiating them manually.
* Customizable: Easily subclass and override methods to fit your specific business logic needs.

## Installation
Not yet :)

## Usage
Create a new service object by inheriting from ServiceObject::Base:

```ruby
class MyService < ServiceObject::Base
  def initialize(args = {})
    @args = args
  end

  protected

  def perform_call
    # Define the service logic here
    puts "Performing call with #{@args}"
    "Success result"
  end
end
```

Call your service object safely:

```ruby
result = MyService.call("some arguments")
if result.success?
  puts "Success: #{result.value}"
else
  puts "Error: #{result.error.message}"
end
```

Or use the bang method to raise errors:

```ruby
begin
  result = MyService.call!("some arguments")
  puts "Success: #{result}"
rescue StandardError => e
  puts "Error: #{e.message}"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amiralles/service_object.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
