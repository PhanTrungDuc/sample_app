class RelationshipsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @title = params[:relationship]
    @user = User.find_by params[:user_id]
    @users = @user.send(@title).paginate page: params[:page]
  end

  def create
    @user = User.find params[:followed_id]
    current_user.follow @user
    @relationship = current_user.active_relationships.find_by followed_id: @user.id
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find_by(params[:id]).followed
    current_user.unfollow @user
    @relationship = current_user.active_relationships.build
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
