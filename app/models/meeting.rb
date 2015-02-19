class Meeting < ActiveRecord::Base
  unloadable
  belongs_to :venue
end
