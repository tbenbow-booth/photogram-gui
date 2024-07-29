class UsersController < ApplicationController
  def index
    matching_users = User.all
    
    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index"})
  end

  def show
    # Parameters: {"path_username"=>"anisa"}

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.first

  render({ :template => "user_templates/show"})
  end

  def create
    input_username = params.fetch("query_username")
  
    a_new_user = User.new(username: input_username)
 
    a_new_user.save
  
    redirect_to("/users/" + a_new_user.username.to_s, allow_other_host: true)
    #render({ :template => "photo_templates/create"})
  end

  def update
    the_id = params.fetch("modify_id")
    matching_username = User.where({ :id => the_id})
    a_new_user = matching_username.at(0)
    
    input_username = params.fetch("updated_username")
    
    a_new_user.username = input_username

    a_new_user.save

  redirect_to("/users/" + a_new_user.username.to_s)
  end
end
