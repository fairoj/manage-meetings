require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")

namespace :seed do 
	desc "Test date for  venue"
	task :add_venue => :environment do
		Venue.create([{ name: 'Зал для конференций' }, { name: 'Курилка' }, { name: 'Кабинет 404' }, { name: 'Кабак 403' } ]) if Venue.all.count == 0
	end
end

