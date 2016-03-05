class AddCourseToEvent < ActiveRecord::Migration
  def change
    add_column :events, :course, :text
  end
end
