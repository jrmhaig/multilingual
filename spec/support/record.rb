ActiveRecord::Base.include Multilingual::Glue

class Record < ActiveRecord::Base
  has_multilingual :title
end

RSpec.configure do |config|
  config.before :suite do
    ActiveRecord::Base.connection.drop_table :records, if_exists: true
    ActiveRecord::Base.connection.create_table :records
  end

  config.after :suite do
    ActiveRecord::Base.connection.drop_table :records
  end
end
