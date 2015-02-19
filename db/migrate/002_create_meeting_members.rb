class CreateMeetingMembers < ActiveRecord::Migration
  def change
    create_table :meeting_members do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :meeting, index: true
    end
  end
end
