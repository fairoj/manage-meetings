class Meeting < ActiveRecord::Base
  unloadable
  belongs_to :venue
  has_many :meeting_member

  acts_as_attachable 


end
