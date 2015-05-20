module MetaDataExtender
  def self.included(base)
    base.attribute :meta_description, :string
    base.attribute :meta_keywords, :string
    base.attribute :meta_author, :string
    base.attribute :meta_keywords, :string
    base.attribute :meta_publisher, :string
    base.attribute :meta_copyright, :string

    base.attribute :meta_page_topic, :string
    base.attribute :meta_page_type, :string
    base.attribute :meta_audience, :string
    base.attribute :meta_robots, :enum, values: ["index", "noindex", "nofollow", "all"]
  end
end