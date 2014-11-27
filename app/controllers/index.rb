get '/' do
  # Look in app/views/index.erb
  erb :index
end

#shows list of categories page
get '/categories' do
  puts "List of categories: "
  @categories = Category.all.to_a
  puts @categories

  puts "[LOG] Params: #{params.inspect}"

  erb :index
end

#shows list of post page
get '/categories/:id/posts' do
  # puts 'Link to post'
  puts params[:id]
  @post = Post.where(category_id: params[:id])
  erb :list_of_posts
end

post '/categories/:c_id/posts/success' do
  puts "Create new post"
  @post = Post.create(title:params[:title],description:params[:description],category_id:params[:c_id])
  puts @post
  erb :new_post
end

get '/categories/:c_id/posts/:p_id' do
  puts "Find post"
  @post = Post.find(params[:p_id])

  erb :view_post
end

get '/categories/:c_id/posts/:p_id/update' do
  puts "Update"
  @post = Post.find(params[:p_id])
  erb :update
end

post '/categories/:c_id/posts/:p_id/update_success' do
  puts "Updated"
   @post = Post.find(params[:p_id])
   @post.title = params[:title]
   @post.description = params[:description]
   @post.save
   erb :new_post
end
