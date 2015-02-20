class MeetingsController < ApplicationController
  unloadable

  helper :attachments


  def index
  end

  def new
  	@meeting = Meeting.new
  	@members = MeetingMember.new 
  end

  def create
  	@meeting = Meeting.new(params[:meeting])
  	params[:meeting_member][:user_id].each {|x| @meeting.meeting_members.new(user_id: x) unless x.blank?}
  	@meeting.save_attachments(params[:attachments])
  	binding.pry
  	@meeting.save

  	redirect_to meetings_path
  end

end
