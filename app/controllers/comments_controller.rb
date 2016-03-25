class CommentsController < ApplicationController
	def comment
		
	end

	#create a new comment
	#When receiving information from form in comments/_form.html.erb, 
  	#check whether the title is blank, 
  	#if it is, there is an error prompt, 
  	#if it is not blank ,create a new message,
  	#and jump to the refresh the current page
	def do_comment
		# 发布评论时要知道这个评论属于哪篇文章，所以要在 Article 模型上调用 find 方法查找文章对象。
		@message = Message.find(params[:message_id])
		commenter = session[:username]
	    comment_message = params[:comment_message]
	    if comment_message == ''
	    	redirect_to "/show/messages/#{@message.id}"
	    else
	    	@comment = @message.comments.new
	    	@comment.commenter = commenter
	    	@comment.comment_message = comment_message
	    	@comment.save
	    	redirect_to "/show/messages/#{@message.id}"
	    end
	end

	#destroy a comment
	def destroy
		@comment = Comment.find(params[:id]);
		if @comment.commenter == session[:username]
			@comment.destroy;
			redirect_to "/show/messages/#{@comment.message_id}"
		else
			@warning = "You do not have permission to delete this comment"
			@message = Message.find(@comment.message_id)
			@comments = @message.comments.paginate(page:params[:page],per_page:10)
			render "messages/show"
		end
		
	end

end


# def destroy
# 		@comment = Comment.find(params[:id]);
# 		@comment.destroy;
# 		redirect_to "/show/messages/#{@comment.message_id}"
# 	end