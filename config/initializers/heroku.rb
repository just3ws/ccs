require 'fileutils'

FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets"))

# Rails::Application.middleware.use(Rack::Static, :root => "tmp/", :urls => ["/stylesheets"])

Sass::Plugin.on_updating_stylesheet do |template, css|
  puts "Compiling #{template} to #{css}."
end

Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
                                             :urls => ['/stylesheets'],
                                             :root => "#{Rails.root}/tmp")

