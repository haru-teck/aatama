class ApplicationController < ActionController::Base
  include UsersHelper
  # def route_not_found
  #   raise ActionController::RoutingError.new("No route matches [#{request.method}] #{request.path}")
  # end
end
