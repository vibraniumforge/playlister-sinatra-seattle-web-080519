require './config/environment'

begin
  fi_check_migration

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1

end


use Rack::MethodOverride

use ArtistsController
use SongsController
use GenresController
run ApplicationController