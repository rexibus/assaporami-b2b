activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :sprockets

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :relative_assets
  set :relative_links, true
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.deploy_method = :git
end

# module Rack

#   class TryStatic

#     def initialize(app, options)
#       @app = app
#       @try = ['', *options.delete(:try)]
#       @static = ::Rack::Static.new(lambda { [404, {}, []] }, options)
#     end

#     def call(env)
#       orig_path = env['PATH_INFO']
#       found = nil
#       @try.each do |path|
#         resp = @static.call(env.merge!({'PATH_INFO' => orig_path + path}))
#         break if 404 != resp[0] && found = resp
#       end
#       found or @app.call(env.merge!('PATH_INFO' => orig_path))
#     end
#   end
# end

# use Rack::TryStatic, :root => "build", :urls => %w[/], :try => ['.html', 'index.html', '/index.html']

# Run your own Rack app here or use this one to serve 404 messages:

