require 'pg'

### Checks if correct environment passed when running this file
raise 'no environment specified' if ARGV.empty?

environment = ARGV[0].split('=')[1]
if ['test', 'development'].include?(environment)
  ENV['RACK_ENV'] = environment
else
  raise 'Wrong Environment Specified'
end
### CREATE TABLE WITH ID AND URL BY DEFAULT

begin
  connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
  connection.exec("CREATE TABLE IF NOT EXISTS bookmarks (id SERIAL PRIMARY KEY, url VARCHAR(60));")
rescue PG::Error => e
  puts e.message
ensure 
  connection.close if connection
end

### ADD TITLE COLUMN

begin
  connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
  connection.exec("ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);")
rescue PG::Error => e
  puts e.message
ensure 
  connection.close if connection
end


