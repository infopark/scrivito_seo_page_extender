module TwitterCardsExtender
  def self.included(base)
    # General Attributes
    base.attribute :tc_card, :enum, values: ["summary", "summary_large_image", "app", "player"]
    base.attribute :tc_creator, :string
    base.attribute :tc_site, :string
    base.attribute :tc_title, :string
    base.attribute :tc_description, :string

    # Image and Gallery
    base.attribute :tc_image, :reference
    base.attribute :tc_image_alt, :reference

    # For type app
    base.attribute :tc_app_name_iphone, :string
    base.attribute :tc_app_name_ipad, :string
    base.attribute :tc_app_name_googleplay, :string
    base.attribute :tc_app_id_iphone, :string
    base.attribute :tc_app_id_ipad, :string
    base.attribute :tc_app_id_googleplay, :string
    base.attribute :tc_app_url_iphone, :string
    base.attribute :tc_app_url_ipad, :string
    base.attribute :tc_app_url_googleplay, :string
    base.attribute :tc_app_country, :string

    # For type Player
    base.attribute :tc_player, :string
    base.attribute :tc_player_width, :string
    base.attribute :tc_player_height, :string
    base.attribute :tc_player_stream, :string
    base.attribute :tc_player_stream_content_type, :string
  end
end