require 'githack'

class Repository < ApplicationRecord
  has_many :leaks

  def scan_leaks
    git = Githack::RailsRepository.new url

    git.search_rails_config_database.each do |leak|
      Leak.create repository: self, content: leak.to_s
      # [{"adapter"=>"mysql2", "database"=>"raspberry_cook", "encoding"=>"utf8", "username"=>"raspberry_cook", "password"=>"secret", "host"=>"localhost", "pool"=>5, "timeout"=>5000}])
    end

    git.search_rails_config_secrets.each do |leak|
      Leak.create repository: self, content: leak.to_s
      # [{"development"=>{"marmiton_password"=>"20462046"}, "production"=>{"marmiton_password"=>"20462046"}, "test"=>{"marmiton_password"=>"20462046"}}])
    end
  end
end
