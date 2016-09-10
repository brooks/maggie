module ApplicationHelper

  def available?
    ENV['AVAILABLE'] == 'true' ? 'available' : 'unavailable'
  end

end
