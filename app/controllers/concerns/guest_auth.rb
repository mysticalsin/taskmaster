module GuestAuth
  extend ActiveSupport::Concern

  included do
    helper_method :current_guest
  end

  private

  def require_guest
    current_guest
  end

  def current_guest
    @current_guest ||= Guest.find_by(id: session[:guest_id]) || create_guest
  end

  def create_guest
    guest = Guest.create!
    list = guest.lists.create!(name: "Today")
    List::STARTER_TASKS.each_with_index do |title, position|
      list.tasks.create!(title: title, position: position + 1)
    end
    session[:guest_id] = guest.id
    guest
  end
end
