class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[home]

  def home; end

  def help; end

  def about; end

  def contact; end
end
