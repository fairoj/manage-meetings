Redmine::Plugin.register :manage_meetings do
  name 'Manage Meetings plugin'
  author 'Artem Gladyshev'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/fairoj/manage-meetings'

  project_module :manage_meetings do 
		permission :meeting, meetings: :new
	end

  menu :top_menu, :manage_meetings, { :controller => 'meetings', :action => 'index' }, :caption => 'Совещания', after: :help
end
