class AppLayoutGenerator < Rails::Generator::NamedBase
  def manifest
    @sass_dir   = File.join 'public', 'stylesheets', 'sass'
    @layout_dir = File.join 'app', 'views', 'layouts'
    @helper_dir = File.join 'app', 'helpers'

    record do |m|
      if File.directory? File.join "vender", "plugin", "haml"
        m.directory @sass_dir   unless_exists? @sass_dir
        m.directory @layout_dir unless_exists? @layout_dir
        m.directory @helper_dir unless_exists? @helper_dir

        m.template "layout.html.haml",      File.join(@sass_dir,   "#{file_name}.html.haml")
        m.template "stylesheet.sass",       File.join(@layout_dir, "#{file_name}.sass")
        m.template "application_helper.rb", File.join(@helper_dir, "#{file_name}_helper.rb")
      else
        puts "Please install the haml plugin before running this generator"
      end
    end
  end

  protected
  def unless_exists?(directory)
    unless File.directory? directory
  end
end
