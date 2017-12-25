# ActiveAdminMapIndex


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_admin_map_index'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_admin_map_index

### Installation (JS/CSS)

Add the following to your `app/assets/javascripts/application.js`:

```
//= require active_admin_map_index
```

Add the following to your `app/assets/stylesheets/application.scss`:

```
@import "active_admin_map_index"
```

### Installation (Initializer)

Add the following to your `config/initializers/active_admin_map_index.rb`

```
ActiveAdminMapIndex.configure do |config|
  config.google_key = 'you_api_key'
end
```

Follow these [instructions](https://developers.google.com/maps/documentation/javascript/get-api-key) if you do not have an api key.

## Usage

__Your model must have `latitude` and `longitude` columns__

```ruby
ActiveAdmin.register MyModel do
  index as: :map do
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fzf/active_admin_map_index. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
