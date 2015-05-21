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

In you application layout at your head-tag include the attribute views.

```ruby
<%= render 'seo_page_extender/meta_data' %>
<%= render 'seo_page_extender/open_graph' %>
```

The seo attributes can be used in your sitemap.xml if you have one.

```ruby
PagesInSitemap.each |page|
  ...
  <%= page.sitemap_frequency %>
  <%= page.sitemap_priority %>
  ...
end
```

For word density table render the partial for it. The attribute, the type hav to be :widgetlist, :string or :html

```ruby
<%= render 'seo_page_extender/word_density', obj: @obj, attribute: :attribute %>
```