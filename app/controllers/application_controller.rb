class ApplicationController < ActionController::Base # Vem do proprio rails e tem várias funcionalidades
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
