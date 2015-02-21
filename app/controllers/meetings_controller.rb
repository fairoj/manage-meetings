class MeetingsController < ApplicationController
  unloadable

  helper :attachments
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  before_filter :access, only: [:new, :create, :destroy]
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
    @members = MeetingMember.new
  	@meeting.save_attachments(params[:attachments])
  	if @meeting.save
      redirect_to meetings_path
    else
      respond_to do |format|
        format.html {render action: :new}
      end
    end
  end

  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def access
      render_403 unless User.current.allowed_to?(:view_events, nil, {:global => true})
    end

end
