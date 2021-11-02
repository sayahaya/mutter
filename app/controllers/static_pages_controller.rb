class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[home]

  def home
    if logged_in?
      @mutter = current_user.mutters.build
      @feed_items = current_user.feed
    end
  end
end
