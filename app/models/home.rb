class Home
  def next_trail
    @next_trail ||= Trail.includes(:events).first
  end

  def next_trail_events
    next_trail.events
  end
end