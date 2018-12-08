require "sinatra"
#so no need to cancel the process
require "sinatra/contrib"
#so no need to reload sinatra
require "sinatra/reloader" if development?
require_relative "./controllers/song_controller.rb"

use Rack::Reloader
use Rack::MethodOverride
run PostController
