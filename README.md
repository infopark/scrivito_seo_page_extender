# ScrivitoSeoPageExtender

## Installation

Add Gem to your gemfile

    gem 'scrivito_seo_page_extender'

## Usage

Include mixins you want to use to your Models.

```ruby
class Page < Obj
  include MetaDataExtender
  include OpenGraphExtender
  include SitemapExtender
end
```

In details view add the partials to your view.

```ruby
<%= render 'seo_page_extender/meta_data_details', obj: @obj %>
<%= render 'seo_page_extender/open_graph_details', obj: @obj %>
<%= render 'seo_page_extender/sitemap_details', obj: @obj %>
```

In your application layout at to the head-tag the attribute views.

```html
<head>
  ...
  <%= render 'seo_page_extender/meta_data' %>
  <%= render 'seo_page_extender/open_graph' %>
  ...
</head>
```

The seo sitemap attributes can be used in your sitemap.xml if you have one.

```ruby
PagesInSitemap.each |page|
  ...
  <%= page.sitemap_frequency %>
  <%= page.sitemap_priority %>
  ...
end
```

For a word density table, render the partial for it. The type of your attribute have to be :widgetlist, :string or :html

```ruby
<%= render 'seo_page_extender/word_density', obj: @obj, attribute: :attribute %>
```

To set a permalink to your page and make it editable, use:

```ruby
<%= render 'seo_page_extender/edit_permalink', obj: @obj %>
```

Adding google analytics:

A partial to add google analytics can be used:
`anonymize-ip` is set to `false` in this script.

```ruby
<%= render 'seo_page_extender/google_analytics', key: 'your-googleAnalytics-key' %>
```
