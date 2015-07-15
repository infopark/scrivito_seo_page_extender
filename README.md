# ScrivitoSeoPageExtender

## Installation

Add Gem to your gemfile

    gem 'scrivito_seo_page_extender'

Add this line to your application Stylesheet manifest:

    *= require scrivito_seo_page_extender

Add this line to your application Javascript manifest:

    //= require scrivito_seo_page_extender

## Usage

### In your Model

Include mixins you want to use to your Models.

```ruby
class Page < Obj
  include MetaDataExtender
  include OpenGraphExtender
  include TwitterCardsExtender
  include SitemapExtender
end
```

### In your details view

```ruby
<%= render 'seo_page_extender/meta_data_details', obj: @obj %>
<%= render 'seo_page_extender/open_graph_details', obj: @obj %>
<%= render 'seo_page_extender/twitter_cards_details', obj: @obj %>
<%= render 'seo_page_extender/sitemap_details', obj: @obj %>
```

## In your application layout

In your application layout at to the head-tag the attribute views.

```html
<head>
  ...
  <%= render 'seo_page_extender/meta_data' %>
  <%= render 'seo_page_extender/twitter_cards' %>
  <%= render 'seo_page_extender/open_graph' %>
  ...
</head>
```

## Other Modules

### Sitemap attributes

The seo sitemap attributes can be used in your sitemap.xml if you have one.

```ruby
PagesInSitemap.each |page|
  ...
  <%= page.sitemap_frequency %>
  <%= page.sitemap_priority %>
  ...
end
```

### Word density

For a word density table, render the partial for it. The type of your attribute have to be :widgetlist, :string or :html

```ruby
<%= render 'seo_page_extender/word_density', obj: @obj, attribute: :attribute %>
```

### Edit permalink

To set a permalink to your page and make it editable, use:

```ruby
<%= render 'seo_page_extender/edit_permalink', obj: @obj %>
```

### Google analytics

Adding google analytics:

A partial to add google analytics can be used:
`anonymize-ip` is set to `false` in this script.

```ruby
<%= render 'seo_page_extender/google_analytics', key: 'your-googleAnalytics-key' %>
```

### Canonical link

Only render the partial. In Meta data detail view, you can set your own url if needed. Per default, the scrivito_path method is used.

```ruby
<%= render 'seo_page_extender/canonical_link' %>
```
