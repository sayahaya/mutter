class LikesController < ApplicationController

  def create
    @mutter = Mutter.find(params[:mutter_id])
    current_user.like(@mutter)
  end

  def destroy
    @mutter = Mutter.find(params[:id])
    current_user.unlike(@mutter)
  end
end
