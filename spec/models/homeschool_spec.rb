require 'spec_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# then, whenever you need to clean the DB
DatabaseCleaner.clean

describe Homeschool do
  it { should validate_presence_of(:name) }
  it { should have_one(:teacher) }
end