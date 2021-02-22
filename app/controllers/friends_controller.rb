class FriendsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit, :update, :destroy, :create]


  def index
  end

  def new
  end

  def create
    @friend = Friend.new
    @friend.user_id = params[:current_id]
    @friend.friend_id = params[:friend_id]

    if @friend.save
      
      redirect_to root_path, notice: 'Friend follow'
    end

  end

  def destroy
  end
end
