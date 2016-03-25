class UsersController < ApplicationController
  # the login page
	def login
  end


  #Check whether the landing successful 
  #When receiving information from form in users/login.html.erb, 
  #determine whether a user name and password match, 
  #if not match, there is an error prompt, 
  #if match, jump to the page:messages/index.html.erb
  def do_login
      username = params[:username]
      userpassword = params[:userpassword]
      if User.find_by_username(username) then
          @user = User.find_by_username(username)
          if username == '' || userpassword == '' then
            @warning = "* The following can't be empty !"
            render 'login' 
          elsif @user.userpassword == params[:userpassword]
            session[:username] = username
            redirect_to(:controller => 'messages', :action => 'index') 
          else
            @warning = "* Login failed, please check usernames and passwords !"
            render "login"
         end 
      else
          @warning = "* Username does not exist !"
          render "login"    
      end
      

  end 

  # the register page
  def register
  end

  #create a new user
  #When receiving information from form in users/register.html.erb, 
  #Check whether the username exists  
  #if exists, there is an error prompt,
  #if the user name does not exist and Passwords and repeat the same password,
  #successfully created a new user 
  #jump to the page:users/login.html.erb
  def do_register

    username = params[:username]
    userpassword = params[:userpassword]
    password = params[:repeatpassword]
    if userpassword == '' || username == '' || password == '' then
      @warning = "* The following can't be empty !"
      render "register"
    elsif userpassword != password
      @warning = "* Two input password is inconsistent!"
      render "register"
    elsif User.find_by_username(username)
      @warning = "* The username already exists!!"
      render "register"
    else
      @user = User.new
      @user.username = username
      @user.userpassword = userpassword
      @user.save!
      session[:username] = username
      redirect_to(:controller => 'messages', :action => 'index')
    end

  end

  # the personal center page
  def center
  end

  # the personal information page

  def personal
    @messagenum = Message.count(:conditons => "host = session[:username]")
    @commentnum = Comment.count(:conditons => "commenter = session[:username]")
  end

  # the personal message page
  def personalmessage
    @permsg = Message.where("host = ?", session[:username])
  end

  # when user want to delete messages in Personal Center 
  def messagedestroy
    @message = Message.find(params[:id]);
    @message.destroy;
    redirect_to(:controller => 'users', :action => 'personalmessage')
  end

  # the personal comment page
  def personalcomment
    @percomt = Comment.where("commenter = ?", session[:username])
  end

  # when user want to delete comments in Personal Center
  def commentdestroy
    @comment = Comment.find(params[:id]);
    @comment.destroy;
    redirect_to(:controller => 'users', :action => 'personalcomment')
  end

  

end
