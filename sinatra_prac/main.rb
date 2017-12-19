require 'googlebooks'
require 'sinatra'
 
get '/' do
  erb :index
end

post '/' do
  books = GoogleBooks.search(params[:query])
  book = books.first
  title = book.title || 'title'
  author = book.authors || 'author'
  image = book.image_link || 'image'
  link = book.info_link || 'link'
  @books = true
  erb :index, :locals => {:title => title, 'author'=> author, 'image'=> image, 'link'=> link}
end
