# Democracy Works Practical: Upcoming Elections

A web application written in Ruby using [Sinatra][sinatra],
[minitest][minitest], and [erb templates][erb].

# Jason Rogers

## My process:

I took this in two parts. First, I extended the search route within the application controller to include an API call to Turbovote. This took me about 30-45 minutes to format the URL properly and structure the appropriate call using Net/HTTP.

The following morning, I came back at this and cleaned up the resulting data from Turbovote, as best I could, with a little consulation with the API documentation and testing a significant number of addresses from the list provided.

I also began to write a test for the search results page, but I've never worked with MiniTest before. I abandoned that attempt as I'm already approacing two hours of work, and Stack Overflow happens to be doing maintenance right now.

Thank you for your consideration!

## Installation

### Requirements

- [Ruby][ruby] version 2.3+
- [bundler][bundler]
- [rake][rake]

### Dependencies

```sh
## Install the dependencies
bundle install

## Check that the tests run
rake test
```

## Usage

### Running

To run the application, use the following command:

```sh
bundle exec rackup
```

### Tests

To run the test suite, use the following command:

```sh
rake test
```

[bundler]: https://bundler.io/
[erb]: https://www.stuartellis.name/articles/erb/
[minitest]: https://github.com/seattlerb/minitest
[rake]: https://github.com/ruby/rake
[rbenv]: https://github.com/rbenv/rbenv
[ruby]: https://github.com/ruby/ruby
[sinatra]: https://github.com/sinatra/sinatra
