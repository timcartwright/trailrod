# == Schema Information
#
# Table name: testimonials
#
#  id         :integer          not null, primary key
#  author     :string
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Testimonial < ActiveRecord::Base
  translates :author, :comment
end
