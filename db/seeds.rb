# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Category.all.blank?
  puts "Prepopulate Categories ..."
  Category.create(
    {:code => 'b', :name => 'Bussiness'},
    {:code => 'p', :name => 'People'}
  )
end

if City.all.blank?
  puts "Prepopulate Countries ..."
  ActiveRecord::Base.connection.execute "LOAD DATA LOCAL INFILE '#{Rails.root}/db/migrate/GeoWorldMap/Countries.txt' INTO TABLE countries
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"

  ActiveRecord::Base.connection.execute "LOAD DATA LOCAL INFILE '#{Rails.root}/db/migrate/GeoWorldMap/Regions.txt' INTO TABLE regions
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"

  puts "Prepopulate Cities ..."
  ActiveRecord::Base.connection.execute "LOAD DATA LOCAL INFILE '#{Rails.root}/db/migrate/GeoWorldMap/Cities.txt' INTO TABLE cities
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;"
end