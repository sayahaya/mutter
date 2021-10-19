class LikesController < ApplicationController
  before_action :mutter_id

  def create
    current_user.like(@mutter)
  end

  def destroy
    current_user.unlike(@mutter)
  end

  private

  def mutter_id
    @mutter = Mutter.find(params[:id])
  end
end
