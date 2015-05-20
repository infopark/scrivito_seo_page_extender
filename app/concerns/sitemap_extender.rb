module SitemapExtender
  def self.included(base)
    base.attribute :sitemap_frequency, :enum, values: ["always", "hourly", "daily", "weekly", "monthly", "yearly", "never"]
    base.attribute :sitemap_priority, :enum, values: ["0.1", "0.2", "0.3", "0.4", "0.5", "0.6", "0.7", "0.8", "0.9", "1.0"]
  end
end