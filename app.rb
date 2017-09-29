require("pry")
require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

get '/add_store' do
  @stores = Store.all()
  erb(:add_store)
end

post '/add_store' do
  store_name = params['store_name']
  store = Store.create({:store_name => store_name})
  redirect('/add_store')
end
