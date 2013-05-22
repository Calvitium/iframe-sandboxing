#\ -w -p 9999 -o mywebpage.dev

require 'rack/mount'

app_advertiser  = Rack::Directory.new("#{Dir.pwd}/advertiser.dev")
app_attacker  = Rack::Directory.new("#{Dir.pwd}/attacker.dev")
app_mywebpage = Rack::Directory.new("#{Dir.pwd}/mywebpage.dev")

class AddForms
  def initialize(app)  
    @app = app  
  end  
    
  def call(env)
    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
    
  end  
    
  def each(&block) 
    @response.each(&block)
  end  
end  

Routes = Rack::Mount::RouteSet.new do |set|
  set.add_route app_advertiser,  { :request_method => 'GET', :path_info => %r{/}, :host => 'advertiser.dev'  }, {}, :advertiser
  set.add_route app_mywebpage,  { :request_method => 'GET', :path_info => %r{/}, :host => 'mywebpage.dev'  }, {}, :mywebpage
  set.add_route AddForms.new(app_attacker), { :request_method => 'GET', :path_info => %r{/}, :host => 'attacker.dev' }, {}, :attacker
end

run Routes



