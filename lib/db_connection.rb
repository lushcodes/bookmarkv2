require 'pg'

module DBConnection
  def self.exec(sql_query)
    begin
      connection = PG.connect dbname: "bookmark_manager_#{ENV['RACK_ENV']}"
      connection.exec(sql_query)
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end
  end
end