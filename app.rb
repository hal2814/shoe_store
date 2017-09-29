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

get '/add_brand' do
  @brands = Brand.all()
  erb(:add_brand)
end

post '/add_brand' do
  brand_name = params['brand_name']
  brand = Brand.create({:brand_name => brand_name})
  redirect('/add_brand')
end

get '/store/:id' do
  @store = Store.find(params[:id])
  @store_brands = @store.brands
  @brands = Brand.all()
  erb(:store)
end

post '/store/:id' do
  store = Store.find(params[:id])
  brand_id = params['brand_name']
  sjoins = Sjoin.all()
  if (sjoins.exists?(:brand_id => brand_id, :store_id => store.id)) == false
    Sjoin.create({:store_id => store.id, :brand_id => brand_id})
  end
  redirect("/store/#{store.id}")
end

get '/brand/:id' do
  @brand = Brand.find(params[:id])
  erb(:brand)
end
