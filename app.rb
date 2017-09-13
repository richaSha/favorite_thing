require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/favorite_thing')

get('/') do
  @lists = Items.all()
  erb(:home)
end

post('/') do
  name = params['place_name']
  about = params['about_place']
  rank = params['rank']
  data = Items.isExist(name,rank)
  if (data['name']) || (data['rank'])
    @error  = 'Please type again as '+data.key(true) + ' already exist'

  else
    item = Items.new(name,about,rank)
    item.save()
  end
  @lists = Items.all()
  erb(:home)
end

get('/list/:id') do
  @item = Items.find(params[:id].to_i)
  erb(:item)
end

post('/edit/:id') do
  new_name = params['new_name']
  id = params[:id].to_i
  Items.update_name(new_name, id)
  @item = Items.find(id)
  erb(:item)
end

get('/delete/:id') do
  Items.delete(params[:id].to_i)
  @lists = Items.all()
  erb(:home)
end
