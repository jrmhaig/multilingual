class Record < ActiveRecord::Base
end

RSpec.configure do |config|
  config.before :suite do
    ActiveRecord::Base.connection.create_table :records
  end

  config.after :suite do
    ActiveRecord::Base.connection.drop_table :records
  end
end
