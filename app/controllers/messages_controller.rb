class MessagesController < ApplicationController


	def index
			
		#message.comments=Message.comment.paginate(page:params[:page],per_page:20)
	end

	#show all messages
	def article
		@msg = Message.paginate(page:params[:page],per_page:20)	
	end

	#create a new message
	#When receiving information from form in messages/index.html.erb, 
  	#determine whether the title exists, 
  	#if exists, there is an error prompt, 
  	#if not exists,create a new message,
  	#and jump to the refresh the current page 
	def do_message
		title = params[:title]
	    message = params[:message]
	    if title == '' && message == '' then
	    	redirect_to(:controller => 'messages',:action => 'index') 
	    elsif title == '' || message == '' 
	    	@warning = "* title and message cannot be empty"
	    	@msg = Message.paginate(page:params[:page],per_page:20)	
	      	render "index"
	    elsif Message.find_by_title(title)
	    	@warning = "* sorry,this title already exists"
	    	@msg = Message.paginate(page:params[:page],per_page:20)	
	      	render "index"
	    else
	      	@message = Message.new
	      	@message.title = title
	      	@message.message = message
	      	@message.host = session[:username]
	      	@message.save
	      	redirect_to(:controller => 'messages', :action => 'article')

	    end
	end

	#show a message and it's comments

	def show
		@message = Message.find(params[:id])
		@comments = @message.comments.all
	end

	#delete a message
	def destroy
		@message = Message.find(params[:id])
		if @message.host == session[:username] then
			@message.destroy;
			redirect_to(:controller => 'messages', :action => 'article')
		else
			@warning = "* Sorry, you can only delete your article!"
			@msg = Message.paginate(page:params[:page],per_page:20)
			render "article"
		end
		
	end

	#sing out
	def leave
		session[:username] = nil
		redirect_to '/'
	end

	private
	def message_params							#明确地告知 Rails 哪些参数可在控制器中使用
		params.require(:message).permit(:title, :message)	
					#permit方法允许在动作中使用title和text属性。
	end
end
