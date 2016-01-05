class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :author
      t.string :comment

      t.timestamps null: false
    end
  end
end
