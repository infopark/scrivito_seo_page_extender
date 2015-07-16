module MetaDataExtender
  def self.included(base)
    base.attribute :meta_description, :string
    base.attribute :meta_keywords, :stringlist
    base.attribute :meta_author, :string
    base.attribute :meta_publisher, :string
    base.attribute :meta_copyright, :string

    base.attribute :meta_canonical, :string

    base.attribute :meta_page_topic, :string
    base.attribute :meta_page_type, :string
    base.attribute :meta_audience, :multienum , values: ["all", "adult", "advanced", "artist", "business", "child", "college", "craft", "elementary", "elhi", "government", "grownup", "health", "high", "institution", "intermediate", "introductory", "law", "lawyer", "listeners", "military", "news", "older", "parent", "patient", "popular", "scholarly", "teacher", "tts", "viewers"]
    base.attribute :meta_robots, :multienum, values: ["noindex", "nofollow", "noarchive", "nosnippet", "noimageindex", "notranslate"]
  end
end