class MuttersController < ApplicationController
  before_action :find_mutter, only: %i[destroy]
  def show
    @mutter = Mutter.find(params[:id])
    @like_users = @mutter.like_users
  end

  def create
    @mutter = current_user.mutters.build(mutter_params)
    if @mutter.save
      redirect_to root_path, success: "mutterを投稿しました"
    else
      @feed_items = current_user.feed
      flash.now[:danger] = "mutterの投稿に失敗しました"
      render 'static_pages/home'
    end
  end

  def destroy
    @mutter.destroy!
    redirect_to request.referrer || root_path, success: "mutterを削除しました"
  end

  private

  def mutter_params
    params.require(:mutter).permit(:content)
  end

  def find_mutter
    @mutter = current_user.mutters.find(params[:id])
  end
end
