class Home
  def next_trail
    next_trail ||= Trail.includes(:events).where('date >= ? AND location = ?', DateTime.now, 'Rodrigues').order(date: :asc).first
  end

  def next_trail_events
    next_trail.events
  end

  def sponsors
    Dir.glob("app/assets/images/sponsors/*.jpg")
  end
end