class SlickLayoutGenerator < Rails::Generator::Base
  
  default_options :use_style => true
  attr_accessor :use_style

  def manifest
    record do |m|
      # Layout
      m.file "layout.html.haml", "app/views/layouts/application.html.haml"
      if options[:use_style]
        # SASS stylesheets
        m.file "admin.sass", "public/stylesheets/sass/admin.sass"
        m.file "application.sass", "public/stylesheets/sass/application.sass"
        m.file "common.sass", "public/stylesheets/sass/common.sass"
        m.file "content.sass", "public/stylesheets/sass/content.sass"
        m.file "foot.sass", "public/stylesheets/sass/foot.sass"
        m.file "forms.sass", "public/stylesheets/sass/forms.sass"
        m.file "head.sass", "public/stylesheets/sass/head.sass"
        m.file "menu.sass", "public/stylesheets/sass/menu.sass"
        # Submit background
        m.file "submit_bkg.png", "public/images/submit_bkg.png"
      end
      # Helpers
      m.file "application_helper.rb", "app/helpers/application_helper.rb"
    end
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--no-style", "Don't create style file") { |v| options[:use_style] = false }
  end
  
end