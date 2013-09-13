# Staircase

Staircase lets you write code inside a block and it automatically outputs the duration of the block. It also supports nesting blocks and outputting generic info.

## Installation

Add this line to your application's Gemfile:

    gem 'staircase'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install staircase

## Usage

Call `Staircase.run` with a block and it will automatically output runtime information:

```ruby
Staircase.run 'Some elaborate process' do
  sleep(5)
end
```
which will output

```
Some elaborate process (5002.34 ms)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
