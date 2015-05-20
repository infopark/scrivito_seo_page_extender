module OpenGraphExtender
  def self.included(base)
    base.attribute :og_author, :string
    base.attribute :og_creator, :string
    base.attribute :og_description, :string
    base.attribute :og_director, :string
    base.attribute :og_duration, :string
    base.attribute :og_image, :reference
    base.attribute :og_obj_type, :enum, values: ["website", "article", "profile", "video", "book", "other"]
    base.attribute :og_release_date, :date
    base.attribute :og_section, :string
    base.attribute :og_title, :string
    base.attribute :og_url, :string
  end
end