class MuttersController < ApplicationController
  before_action :find_mutter, only: %i[destroy]
  def show
    @mutter = Mutter.find(params[:id])
    @like_users = @mutter.like_users
  end

  def create
    @mutter = current_user.mutters.build(mutter_params)
    @mutter.save
  end

  def destroy
    @mutter.destroy!
  end

  private

  def mutter_params
    params.require(:mutter).permit(:content)
  end

  def find_mutter
    @mutter = current_user.mutters.find(params[:id])
  end
end
