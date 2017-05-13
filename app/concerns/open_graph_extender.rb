module OpenGraphExtender
  def self.included(base)
    base.attribute :og_description,          :string
    base.attribute :og_determiner,           :string
    base.attribute :og_locale,               :string
    base.attribute :og_locale_alternate,     :stringlist
    base.attribute :og_title,                :string
    base.attribute :og_type,                 :enum, values: ['website', 'article', 'blog', 'book', 'profile', 'music.song', 'music.album', 'music.playlist', 'music.radiostation', 'video.movie', 'video.episode', 'video.tv_show', 'video.other']

    base.attribute :og_audio,                :reference
    base.attribute :og_image,                :reference
    base.attribute :og_video,                :reference

    base.attribute :article_author,          :stringlist
    base.attribute :article_expiration_time, :date
    base.attribute :article_published_time,  :date
    base.attribute :article_section,         :string
    base.attribute :article_tag,             :stringlist

    base.attribute :book_author,             :stringlist
    base.attribute :book_isbn,               :string
    base.attribute :book_release_date,       :date
    base.attribute :book_tag,                :stringlist

    base.attribute :profile_first_name,      :string
    base.attribute :profile_gender,          :enum, values: %w[male female]
    base.attribute :profile_last_name,       :string
    base.attribute :profile_username,        :string

    # Video Attributes
    base.attribute :video_actor,             :stringlist
    base.attribute :video_actor_role,        :string
    base.attribute :video_director,          :stringlist
    base.attribute :video_duration,          :string
    base.attribute :video_release_date,      :date
    base.attribute :video_series,            :string
    base.attribute :video_tag,               :stringlist
    base.attribute :video_writer,            :stringlist

    # Music Attributes
    base.attribute :music_album,             :stringlist
    base.attribute :music_creator,           :string
    base.attribute :music_duration,          :string
    base.attribute :music_musician,          :stringlist
    base.attribute :music_song,              :stringlist

    def image_width
      self.og_image.meta_data[:width]
    end

    def image_height
      self.og_image.meta_data[:height]
    end

    def image_type
      self.og_image.meta_data[:content_type]
    end
  end
end
