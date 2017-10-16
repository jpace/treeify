# Arbolobra

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up
your Ruby library into a gem. Put your Ruby code in the file `lib/arbolobra`. To experiment with
that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arbolobra'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arbolobra

## Usage

Arbolobra is for reading and writing a hierarchical set of data, i.e., a tree.

For example, a simple viewer of files and directories, as a tree:

```ruby
def build pn
  Arbolobra::Node.new(pn.basename).tap do |n|
    if pn.directory?
      pn.children.sort.each do |child|
        n.children << build(child)
      end
    end
  end
end

pn = Pathname.new "."
node = build pn

node.print
```

And to change output, such as from a list of files, from flat to hierarchical:

```ruby
tree = Arbolobra::Tree.new lines: ARGV, separator: "/"
tree.root.print
```

```shell
% git diff-index --name-only --no-commit-id <commit> | xargs <above script>
```

```text

+---.gitignore
+---README.md
+---lib
|   \---arbolobra
|       +---chars.rb
|       +---node.rb
|       \---tree.rb
\---test
    \---arbolobra
        +---chars_test.rb
        +---node_test.rb
        \---tree_test.rb
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run
the tests. You can also run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new
version, update the version number in `version.rb`, and then run `bundle exec rake release`, which
will create a git tag for the version, push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jpace/arbolobra.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
