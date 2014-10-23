activate :livereload
activate :gzip

set :js_dir,     'assets/javascripts'
set :css_dir,    'assets/stylesheets'
set :images_dir, 'assets/images'

# Add bower's directory to sprockets asset path
after_configuration do
  sprockets.append_path File.join root, 'bower_components'
  sprockets.append_path File.join root, 'bower_components', 'bootstrap-sass-official', 'assets', 'fonts'
  sprockets.append_path File.join root, 'bower_components', 'slick.js'
end

after_build do
  %w(pacifico.eot  pacifico.svg  pacifico.ttf  pacifico.woff).each do |font_name|
    FileUtils.cp(File.join(root, 'bower_components', 'slick.js', 'css', font_name), File.join(root, 'build', 'fonts'))
  end
end

# Build-specific configuration
configure :build do
  activate :minify_html
  activate :minify_css
  activate :minify_javascript

  activate :relative_assets
  set :relative_links, true
end
