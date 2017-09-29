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
  store = Store.new({:store_name => store_name})
  if store.save
    redirect("/add_store")
  else
    @an_errored_object = store
    erb(:errors)
  end
end

get '/add_brand' do
  @brands = Brand.all()
  erb(:add_brand)
end

post '/add_brand' do
  brand_name = params['brand_name']
  price = params['price']
  brand = Brand.new({:brand_name => brand_name, :price => price})
  if brand.save
    redirect("/add_brand")
  else
    @an_errored_object = brand
    erb(:errors)
  end
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

get '/edit_store/:id' do
  @store = Store.find(params[:id])
  erb(:edit_store)
end

patch '/edit_store/:id' do
  store_name = params['store_name']
  store = Store.find(params[:id])
  store.update({:store_name => store_name})
  redirect("/edit_store/#{store.id}")
end

delete '/edit_store/:id' do
  store = Store.find(params[:id])
  store.destroy()
  redirect("/")
end

get '/brand/:id' do
  @brand = Brand.find(params[:id])
  @stores = @brand.stores
  erb(:brand)
end
