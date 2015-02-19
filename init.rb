Redmine::Plugin.register :manage_meetings do
  name 'Manage Meetings plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  menu :top_menu, :manage_meetings, { :controller => 'meetings', :action => 'index' }, :caption => 'Совещания', after: :help
end
