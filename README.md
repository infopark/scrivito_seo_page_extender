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
    og_image: Obj.where(:title, :equals, 'Logo').first
    ...
  }
end
```

The key is an attribute from meta, open graph or twitter cards modules, the value is app specific. More detailed values like `obj.my_title || obj.title || 'Fallback title'` are possible.

## Customization

If you use the default details views provided in this gem, we recommend to activate [Scrivito Advanced Editors](https://github.com/Scrivito/scrivito_advanced_editors) to utilize the tabs used by this gem.

## Localization

The following code represents the default localization for English. Copy it to your `en.yml` and change it if necessary:

```yaml
en:
  scrivito_seo_page_extender:
    details:
      meta_data_extender:
        default_canonical_link: "Using <strong>%{link}</strong> as default."
        meta_audience: 'Audience'
        meta_author: 'Author'
        meta_canonical: 'Canonical Link'
        meta_copyright: 'Copyright'
        meta_description: 'Description'
        meta_keywords: 'Keywords'
        meta_page_topic: 'Topic'
        meta_page_type: 'Type'
        meta_publisher: 'Publisher'
        meta_robots: "Robots<small><a href='https://developers.google.com/webmasters/control-crawl-index/docs/robots_meta_tag' target='_blank'>?</a></small>"
      open_graph_extender:
        article_author: 'Open Graph Author'
        article_expiration_time: 'Open Graph Expiration'
        article_published_time: 'Open Graph Published'
        article_section: 'Open Graph Section'
        article_tag: 'Open Graph Tag'
        book_author: 'Open Graph Author'
        book_isbn: 'Open Graph ISBN'
        book_release_date: 'Open Graph Release Date '
        book_tag: 'Open Graph Tag'
        music_album: 'Open Graph Album'
        music_creator: 'Open Graph Creator'
        music_duration: 'Open Graph Duration'
        music_musician: 'Open Graph Musician'
        music_song: 'Open Graph Song'
        og_audio: 'Open Graph Audio'
        og_description: 'Open Graph Description'
        og_determiner: 'Open Graph Determiner'
        og_image: 'Open Graph Image'
        og_locale: 'Open Graph Locale <small>e.g. en_us</small>'
        og_locale_alternate: 'Open Graph Locale Alternate'
        og_title: 'Open Graph Title'
        og_type: 'Open Graph Type'
        og_type_article: 'Article'
        og_type_book: 'Book'
        og_type_music: 'Music'
        og_type_profile: 'Profile'
        og_type_video: 'Video'
        og_video: 'Open Graph Video'
        profile_first_name: 'Open Graph First Name'
        profile_gender: 'Open Graph Gender'
        profile_last_name: 'Open Graph Last Name'
        profile_username: 'Open Graph Username'
        video_actor: 'Open Graph Actor'
        video_actor_role: 'Open Graph Role'
        video_director: 'Open Graph Director'
        video_duration: 'Open Graph Duration'
        video_release_date: 'Open Graph Release Date'
        video_series: 'Open Graph Series'
        video_tag: 'Open Graph Tag'
        video_writer: 'Open Graph Writer'
      permalink: 'Permalink'
      sitemap_extender:
        sitemap_frequency: 'Frequency of visits for bots'
        sitemap_priority: 'Priority for Sitemap'
      twitter_cards_extender:
        attributes_app: 'App attributes'
        attributes_base: 'Base attributes'
        attributes_player: 'Player attributes'
        tc_app_country: 'Country'
        tc_app_id: 'Store ID'
        tc_app_name: 'App Name'
        tc_app_url: 'Store URL'
        tc_card: 'Card type'
        tc_creator: '<h3>Creator <small>Twitter name of the creator of this page e.g. @gertimon</small></h3>'
        tc_description: 'Description'
        tc_image: 'Image'
        tc_image_alt: 'Image Description'
        tc_more_about: 'More about Twitter cards'
        tc_player_dimension: 'Dimension'
        tc_player_height: 'Height'
        tc_player_stream: 'Stream'
        tc_player_stream_content_type: 'Content Type'
        tc_player_width: 'Width'
        tc_site: '<h3>Site <small>Twitter name of the company e.g. @infopark</small></h3>'
        tc_title: 'Title'
    word_density:
      count: 'Count'
      density: 'Density'
      good_words: '%{count} good words on this page (words not in stop word list)'
      single_words: 'Single Words'
      three_words: 'Three word phrases'
      two_words: 'Two word phrases'
      word: 'Word'
```
