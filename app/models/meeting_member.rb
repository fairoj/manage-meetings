class MeetingMember < ActiveRecord::Base
  unloadable

  attr_accessible :user_id, :meeting_id

  belongs_to :user
  belongs_to :meeting
end
