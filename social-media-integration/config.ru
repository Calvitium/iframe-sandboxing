#\ -w -p 9999 -o mywebpage.dev

require 'rack/mount'

# app_advertiser  = Rack::Directory.new("#{Dir.pwd}/advertiser.dev")
# app_attacker  = Rack::Directory.new("#{Dir.pwd}/attacker.dev")
app_mywebpage = Rack::Directory.new("#{Dir.pwd}/mywebpage.dev")

Routes = Rack::Mount::RouteSet.new do |set|
  set.add_route app_mywebpage,  { :request_method => 'GET', :path_info => %r{/}, :host => 'mywebpage.dev'  }, {}, :mywebpage
end

run Routes



