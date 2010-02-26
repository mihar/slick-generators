class SlickLayoutGenerator < Rails::Generator::Base
  
  default_options :use_style => true, :use_admin => true
  attr_accessor :use_style
  attr_accessor :use_admin

  def initialize(runtime_args, runtime_options = {})
    super
    @use_admin = true
  end

  def manifest
    record do |m|
      # Layout
      m.directory "app/views/layouts"
      m.template "layout.haml", "app/views/layouts/application.html.haml"
      if options[:use_admin]
        # Admin status partials
        m.file "admin_gate.html.haml", "app/views/layouts/_admin_gate.html.haml"
        m.file "admin_info.html.haml", "app/views/layouts/_admin_info.html.haml"
      end
      if options[:use_style]
        m.directory "public/stylesheets/sass"
        # SASS stylesheets
        m.file "application.sass", "public/stylesheets/sass/application.sass"
        m.file "_admin.sass", "public/stylesheets/sass/_admin.sass"
        m.file "_tables.sass", "public/stylesheets/sass/_tables.sass"
        m.file "_common.sass", "public/stylesheets/sass/_common.sass"
        m.file "_content.sass", "public/stylesheets/sass/_content.sass"
        m.file "_foot.sass", "public/stylesheets/sass/_foot.sass"
        m.file "_forms.sass", "public/stylesheets/sass/_forms.sass"
        m.file "_head.sass", "public/stylesheets/sass/_head.sass"
        m.file "_menu.sass", "public/stylesheets/sass/_menu.sass"
        # Submit background
        m.file "submit_bkg.png", "public/images/submit_bkg.png"
      end
      # Helpers
      m.file "layout_helper.rb", "app/helpers/layout_helper.rb"
    end
  end

  def add_options!(opt)
    opt.separator ''
    opt.separator 'Options:'
    opt.on("--no-style", "Don't create style file") { |v| options[:use_style] = false }
    opt.on("--no-admin", "Don't create admin sections") { |v| options[:use_admin] = false }
  end
  
end