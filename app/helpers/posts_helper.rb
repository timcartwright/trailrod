module PostsHelper
  def tile_colour
    colours = ['tile-green','tile-cyan','tile-deep-orange','tile-light-blue']
    colours[@post_background_colour % 4]
  end
end
