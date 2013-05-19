#\ -w -p 9999 -o mywebpage.dev

require 'rack/mount'

app_advertiser  = Rack::Directory.new("#{Dir.pwd}/advertiser.dev")
app_attacker  = Rack::Directory.new("#{Dir.pwd}/attacker.dev")
app_mywebpage = Rack::Directory.new("#{Dir.pwd}/mywebpage.dev")

class AddCors
  def initialize(app)  
    @app = app  
  end  
    
  def call(env)  
    @status, @headers, @response = @app.call(env)  
    @headers["Access-Control-Allow-Origin"] = "http://advertiser.dev"
    [@status, @headers, self]  
  end  
    
  def each(&block)  
    @response.each(&block)  
  end  
end  

Routes = Rack::Mount::RouteSet.new do |set|
  set.add_route app_advertiser,  { :request_method => 'GET', :path_info => %r{/}, :host => 'advertiser.dev'  }, {}, :advertiser
  set.add_route app_attacker,  { :request_method => 'GET', :path_info => %r{/}, :host => 'attacker.dev'  }, {}, :attacker
  set.add_route AddCors.new(app_mywebpage), { :request_method => 'GET', :path_info => %r{/}, :host => 'mywebpage.dev' }, {}, :mywebpage
end

run Routes



