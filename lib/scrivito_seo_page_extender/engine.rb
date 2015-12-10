module ScrivitoSeoPageExtender
  class Engine < ::Rails::Engine
    isolate_namespace ScrivitoSeoPageExtender

    initializer "seo_page_extender:seo_page_extender_helper" do
      ActionView::Base.send :include, SeoPageExtenderHelper
    end
  end
end
