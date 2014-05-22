positron
========

This gem is designed to help separate ActiveRecord (as an implementation detail) from other objects in a Rails MVC application. It should (eventually) also work with other frameworks and ORMs. Its purpose is twofold:
* provide an airtight way of preventing the view from touching the database
* avoid exposing the entire ActiveRecord public interface in every model class (persistence is an implementation detail, not something callers have to know about)

How and why does it do that? Read on!

## Rails MVC basics, or the stuff you already know

In a well-designed Rails (or similar MVC) application, the view should never touch the database. Rather, all data should be marshalled through the controller, and the view is generally restricted to calling simple accessor-type methods on the model and displaying the results. So you'd never write `User.find(params[:id]).name` in the view; instead, a typical Rails application looks like this:

```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  # DB columns include name, address, etc.
end
```

```ruby
# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end
end
```

```haml
/ app/views/users/show.html.haml
%p= @user.name
%p= @user.address
```

So far so good. We use ActiveRecord to run a database query in the controller to get `@user`, then we pass `@user` to the view and call simple methods on it, as described above.

## The first problem: hidden database queries in views

Ruby adheres to the [Uniform Access Principle](http://en.wikipedia.org/wiki/Uniform_access_principle), which means that it's not obvious from the public interface whether `foo.bar` is an accessor or a computation. Generally, this is one of Ruby's best features. However, it can cause problems with MVC separation. Let's change class `User` in the example above:
```ruby
# app/models/user.rb
class User < ActiveRecord::Base
  has_many :addresses
  def address
    addresses.first.to_s
  end
end
```
With no change to the public interface, `User#address` has changed from being an accessor to being a database-backed computation, so that the `@user.address` call in the view above now fires a database query from the view. This is bad MVC, and there's nothing at all in the view code that would make us suspect that this would happen.

Positron solves this problem by mediating all database access through a private instance method, and removing this method when a Positron model object is passed from the controller to the view.

## The second problem: ActiveRecord interface leakage

ActiveRecord is a fantastic ORM, but it has a problem. It works with inheritance, and Ruby doesn't do private inheritance, so that when your model object inherits `ActiveRecord::Base`, the entire ActiveRecord interface is exposed to all your object's collaborators, even though persistence is really a private implementation detail. Avdi Grimm created the [fig-leaf](https://github.com/objects-on-rails/fig-leaf) gem to address this very issue, but it requires you to think about what you want to hide, and not to forget to hide anything.

Positron takes a different approach. As explained above, all database access is done through a private instance method. This means that while your model object has internal access to all the ActiveRecord goodness, it appears to the outside world as a plain old Ruby object, and its collaborators never need to touch or think about the ActiveRecord interface.

## Installation

Add this line to your application's Gemfile:

    gem 'positron'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install positron

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
