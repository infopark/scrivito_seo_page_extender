# ScrivitoSeoPageExtender

## Installation

Add the gem to your Gemfile:

    gem 'scrivito_seo_page_extender'

## Usage

### In your model

Include the mixins you want to use in your model:

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

In your application layout render the partials in the `head` tag:

```html
<head>
  ...
  <%= render 'seo_page_extender/meta_data' %>
  <%= render 'seo_page_extender/twitter_cards' %>
  <%= render 'seo_page_extender/open_graph' %>
  ...
</head>
```

### Setting defaults

We do not set any defaults for meta attributes. If you want to, you can do this easily using `default_for`:

```ruby
def Page < Obj
  include MetaDataExtender

  default_for :meta_robots do |attribute, scrivito_user|
    ["noindex", "nofollow"]
  end
end
```

## Other modules

### Sitemap attributes

The SEO sitemap attributes can be used in your sitemap.xml if you have one.

```ruby
PagesInSitemap.each |page|
  ...
  <%= page.sitemap_frequency %>
  <%= page.sitemap_priority %>
  ...
end
```

### Word density

To have the word density table displayed, render the partial for it. The type of the attribute whose value should be analyzed can be  `widgetlist`, `string` or `html`:

```ruby
  <%= render'seo_page_extender/word_density', obj: @obj, attribute: :attribute %>
```


The gem includes a stop word list for English. If you require different stop words or stop words for different or additional languages, you can provide a method for retrieving the list in your `obj.rb`:

```ruby
  # in obj.rb
  def self.stop_word_list
    if language == :de
      ["wort1","wort2","wort3","wort4",...]
    else
      default_stop_word_list
    end
  end
```

The word density plugin lowercases your content. Therefore, the words in your stop word list need to be in lower case.

### Google analytics

The partial that adds Google Analytics to your view can be rendered like this:

```ruby
<%= render 'seo_page_extender/google_analytics', key: 'your-googleAnalytics-key' %>
```

`anonymize-ip` has been set to `true` in this script.

### Canonical link

By default, the canonical link is determined using `scrivito_path`.

```ruby
<%= render 'seo_page_extender/canonical_link' %>
```

If you need different canonical links, you can add the `meta_canonical` attribute to your object classes and set the attribute values of the CMS objects to the desired link.

```ruby
class MyObj < Obj
  attribute :meta_canonical, :string
end
```