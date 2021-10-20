class LikesController < ApplicationController

  def create
    @mutter = Mutter.find(params[:mutter_id])
    current_user.like(@mutter)
    redirect_back fallback_location: root_path, success: "mutterをlikeしました"
  end

  def destroy
    @mutter = Mutter.find(params[:id])
    current_user.unlike(@mutter)
    redirect_back fallback_location: root_path, success: "likeを解除しました"
  end
end
