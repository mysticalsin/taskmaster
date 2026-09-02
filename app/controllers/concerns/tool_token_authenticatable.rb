module ToolTokenAuthenticatable
  extend ActiveSupport::Concern

  included do
    include GuestAuth
  end

  private

  def authenticate_tool_token!
    head :not_found
  end
end
