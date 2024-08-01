class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order(username: :asc)
    render(template: "user_templates/index")
  end

  def show
    @username = params.fetch("username")
    @the_user = User.where(username: @username).first

    if @the_user == nil
      redirect_to("/404")
    else
      render(template: "user_templates/show")
    end
  end

  def create
    my_input_username = params.fetch("input_username")
    new_user = User.new
    new_user.username = my_input_username
    new_user.save
    redirect_to("/users/" + my_input_username, allow_other_host: true)
  end

  def update
    user_id = params.fetch("user_id")
    my_input_username = params.fetch("input_username")
    the_user = User.where(id: user_id).first
    the_user.username = my_input_username
    the_user.save
    redirect_to("/users/" + my_input_username)
  end
end
