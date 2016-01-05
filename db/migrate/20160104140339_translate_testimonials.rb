class TranslateTestimonials < ActiveRecord::Migration
  def up
    Testimonial.create_translation_table! :author => :string, :comment => :string
  end

  def down
    Testimonial.drop_translation_table!
  end
end
