class CreateMeetings < ActiveRecord::Migration
  def change
  	create_table :venues do |t|
      t.string :name
    end

    create_table :meetings do |t|
    	t.belongs_to :venue, index: true
      t.text :subject
      t.text :description_meeting
      t.text :decription_result
      t.datetime :start_date
      t.datetime :finish_date
    end
  end
end
