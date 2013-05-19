require 'rack/mount'

app_advertiser  = Rack::Directory.new("#{Dir.pwd}/advertiser.dev")
app_attacker  = Rack::Directory.new("#{Dir.pwd}/attacker.dev")
app_mywebpage = Rack::Directory.new("#{Dir.pwd}/mywebpage.dev")

Routes = Rack::Mount::RouteSet.new do |set|
  set.add_route app_advertiser,  { :request_method => 'GET', :path_info => %r{/}, :host => 'advertiser.dev'  }, {}, :advertiser
  set.add_route app_attacker,  { :request_method => 'GET', :path_info => %r{/}, :host => 'attacker.dev'  }, {}, :attacker
  set.add_route app_mywebpage,  { :request_method => 'GET', :path_info => %r{/}, :host => 'mywebpage.dev'  }, {}, :maywebpage
end

run Routes



