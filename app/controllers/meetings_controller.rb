class MeetingsController < ApplicationController
  unloadable

  helper :attachments


  def index
  end

  def new
  	@meeting = Meeting.new
  	@members = MeetingMember.new
  	#binding.pry 
  end

  def create
  	@meeting = Meeting.new(params[:meeting])
  	@meeting.save_attachments(params[:attachments])
  	@meeting.save
  	redirect_to meetings_path
  end

end
