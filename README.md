# rails_json_field

A friendly way for users to edit JSON fields in Rails forms.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_json_field'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_json_field

**Note:** This gem currently requires jQuery to work.

## Usage

Include the following in your javascript manifest:

```javascript
//= require rails_json_field
```

Now you're able to use it in forms:

```slim
= form_for @foo do |f|
  = f.json_field :bar
```

## Future Features

Some future features include:

* Removing the jQuery dependency (if possible)
* Custom class names
* Better default styling
* Nested objects
* Array objects

## Thanks

A special thank you to the [john_hancock](https://github.com/Brantron/john_hancock) gem for showing me how to structure this kind of gem.