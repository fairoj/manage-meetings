class Venue < ActiveRecord::Base
  unloadable
  attr_accessible :name
end
