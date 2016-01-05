class TestimonialController < ApplicationController
  def index
    @testimonials = Testimonial.all
  end
end