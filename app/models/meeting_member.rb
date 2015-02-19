class MeetingMember < ActiveRecord::Base
  unloadable
  belongs_to :user
end
