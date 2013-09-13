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

Or for something a little more complex:

```ruby
Staircase.run 'Find some objects' do
  SomeObject.find_all(criteria).tap do |thing|
    Staircase.run "Opening #{thing}" do
      thing.open do |contents|
        Staircase.info "Found #{contents}"
      end
    end
  end
end
```

which could output something like:

```
Find some objects (123.45 ms)
  Opening a square box... (14.0 ms)
    Found an interesting object
  Opening a puzzle box... (89.32 ms)
    Found a glinting stone
  Opening a satchel... (18.84 ms)
    Found nothing in particular
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
