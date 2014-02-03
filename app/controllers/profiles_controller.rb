class ProfilesController < ApplicationController

  def show
    @user = User.find_by_username(params[:username])
    @users = User.all

    @user.twets.each do |twet|
      @users.each do |u|
        link = "<a href=\"#{u.username}\">@#{u.username}</a>"
        twet.content.gsub!("@#{u.username}", link)
      end
    end
  end
end
