# OverC Wrench

A collection of Rails code to decrease code repetition

## Installation

Add this line to your application's Gemfile:

    gem 'overc_wrench'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install overc_wrench

## Usage

### Video Helpers

These handy helpers should help you out:

Add google analytics to your application:

    <%= google_analytics('GA-123456') %>

Render form errors using Zurb Foundation alerts:

    <%= form_errors @post %>

Add page title placeholder, plays nice with meta_tags gem:

    <% page_title 'My page' %>

Create `<li>` tags that will have "active" class appended automatically:

    <ul>
    <%= link_to_nav 'Posts', posts_path %>
    </ul>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
