class Meeting < ActiveRecord::Base
  unloadable
  attr_accessible :subject, :venue_id, :description_meeting, :start_date, :finish_date, :decription_result

  belongs_to :venue
  has_many :meeting_members

  acts_as_attachable 

  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :venue_id, presence: true
  validate :not_conflux_time_venue, :not_conflux_time_user

  def not_conflux_time_venue
  	conflux_meetings = Meeting.where('start_date < :finish_date and finish_date > :start_date and venue_id == :venue_id',
  														 {start_date: start_date, finish_date: finish_date, venue_id: venue_id})
  	errors.add(:venue_id, "В это время в этом же месте проводится другое совещание") if conflux_meetings.count > 0

  end

  def not_conflux_time_user
  	conflux_times = Meeting.where('start_date < :finish_date and finish_date > :start_date',
  														 {start_date: start_date, finish_date: finish_date})
  	conflux_users = []
  	meeting_members_ids = meeting_members.map {|x| x.user_id}
  	conflux_times.each do |conflux_time|
  		conflux_users += conflux_time.meeting_members.map {|x| x.user_id} & meeting_members_ids
  	end
  	errors.add(:venue_id, "В это же время, один из участников занят") if conflux_users.size > 0
  end

end
