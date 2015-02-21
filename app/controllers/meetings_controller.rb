class MeetingsController < ApplicationController
  unloadable

  helper :attachments
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def show
  end

  def new
  	@meeting = Meeting.new
  	@members = MeetingMember.new 
  end

  def edit
  end

  def update
  end

  def create
  	@meeting = Meeting.new(params[:meeting])
  	params[:meeting_member][:user_id].each {|x| @meeting.meeting_members.new(user_id: x) unless x.blank?}
  	@meeting.save_attachments(params[:attachments])
  	@meeting.save

  	redirect_to meetings_path
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

end
