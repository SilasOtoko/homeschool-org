class CreateCalendarEntries < ActiveRecord::Migration
  def change
    create_table :calendar_entries do |t|
      t.string :title
      t.string :start_date
      t.string :end_date
      t.boolean :all_day
      
      t.timestamps
    end
  end
end
