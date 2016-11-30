# ScrivitoSeoPageExtender

Includes attributes for defining meta tags as well as Open Graph and Twitter cards.

## Installation

Add the gem to your Gemfile:

    gem 'scrivito_seo_page_extender'

## Usage

### Extend your models

Include the mixins you want to use in your individual page models:

```ruby
class Page < Obj
  include MetaDataExtender
  include OpenGraphExtender
  include TwitterCardsExtender
  include SitemapExtender
end
```

### Extend your details view

```ruby
<%= render 'seo_page_extender/meta_data_details', obj: @obj %>
<%= render 'seo_page_extender/open_graph_details', obj: @obj %>
<%= render 'seo_page_extender/twitter_cards_details', obj: @obj %>
<%= render 'seo_page_extender/sitemap_details', obj: @obj %>
```

### Partial Use of all atributes

Open Graph includes attributes which are not required everywhere. E.g. Video, Book or Music. In your details view, you can render the partials for the required attributes grouped by the types of Open Graph:

```ruby
<%= render 'seo_page_extender/open_graph/base', obj: @obj %>
<%= render 'seo_page_extender/open_graph/article', obj: @obj %>
<%= render 'seo_page_extender/open_graph/books', obj: @obj %>
<%= render 'seo_page_extender/open_graph/profile', obj: @obj %>
<%= render 'seo_page_extender/open_graph/music', obj: @obj %>
<%= render 'seo_page_extender/open_graph/video', obj: @obj %>
```

### Page specific

Some pages has a specific `site_name`. You can define a method in your obj.rb to set one:

```ruby
def self.open_graph_site_name
  return 'my_page_name' # e.g. imdb
end
```

## Extend your application layout

In your application layout, render the partials in the `head` tag:

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

The widget does not set any defaults for meta attributes. If you want to, you can do this easily using the `default_for` method:

```ruby
def Page < Obj
  include MetaDataExtender

  default_for :meta_robots do |attribute, scrivito_user|
    ["noindex", "nofollow"]
  end
end
```

## Futher functionality

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

To have the word density table displayed, render the partial for it. The type of the attribute whose value should be analyzed can be `widgetlist`, `string` or `html`:

```xml
  <%= render 'seo_page_extender/word_density', obj: @obj, attribute: :attribute %>
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

The partial that adds the standard implemetation of Google Analytics to your view can be rendered like this:

```xml
<%= render 'seo_page_extender/google_analytics', key: 'your-googleAnalytics-key' %>
```

`anonymize-ip` has been set to `true` in this script.

### Canonical link

By default, the canonical link is determined using `scrivito_path`.

```xml
<%= render 'seo_page_extender/canonical_link' %>
```

If you need different canonical links, you can add the `meta_canonical` attribute to your object classes and set the attribute values of the CMS objects to the desired link.

```ruby
class MyObj < Obj
  attribute :meta_canonical, :string
end
```

## Configuration

Add an initializer to activate automatic attribute mapping for titles and descriptions:

```ruby
ScrivitoSeoPageExtender.configure do |config|
  config.attribute_mapping = true
end
```

You can overwrite the default attribute mapping depending on your app in the obj.rb with:

```ruby
def self.seo_attribute_mapping(obj)
  {
    og_title: obj.my_app_title,
    og_description: obj.my_app_description
    ...
  }
end
```

The key is an attribute from meta, open graph or twitter cards modules, the value is app specific. More detailed values like `obj.my_title || obj.title || 'Fallback title'` are possible.

## Customization

If you use the default details views provided in this gem, we recommend to activate [Scrivito Advanced Editors](https://github.com/Scrivito/scrivito_advanced_editors) to utilize the tabs used by this gem.
