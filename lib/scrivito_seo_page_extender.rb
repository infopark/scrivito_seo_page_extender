require "scrivito_seo_page_extender/engine"
require "scrivito_seo_page_extender/configuration"

module ScrivitoSeoPageExtender
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
