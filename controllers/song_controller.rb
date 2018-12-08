class PostController<Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "..")

  set :view, Proc.new { File.join(root, "views") }

configure:development do
  register Sinatra::Reloader
end

$songs = [
  {
    id: 0,
    title: "Song 1",
    body: "SONG",
    embed_id: "qN4ooNx77u0"
  },
  {
    id: 1,
    title: "Song 2",
    body: "SONG",
    embed_id: "_kqQDCxRCzM"
  }
]
  get "/" do
     @page_title = "Songs"
     @songs = $songs
    erb :"songs/index"
  end

  get '/new' do
    @song  = {
      id: "",
      title: "",
      body: "",
      embed_id: ""
    }
    erb:"songs/new"
  end

  get "/:id_from_url" do
    id = params[:id_from_url].to_i
    @song = $songs[id]
    erb :"songs/show"
  end

  get '/:id/edit' do
    id = params[:id].to_i
    @song = $songs[id]
    erb :"songs/edit"
  end

  put '/:id' do
    id = params[:id].to_i
    song = $songs[id]
    song[:title] = params[:title]
    song[:body] = params[:body]
    song[:embed_id] = params[:video_link]
    redirect '/'
  end

  delete '/:id' do
    id = params[:id].to_i
    $songs.delete_at(id)
    redirect '/'
  end

  post '/' do
  new_song = {
    id: $songs.length,
    title: params[:title],
    body: params[:body],
    embed_id: params[:video_link]
  }
  $songs.push new_song
  redirect "/"
end

end
