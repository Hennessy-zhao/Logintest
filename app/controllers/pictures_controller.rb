class PicturesController < ApplicationController
	def index
		if session[:username] == nil then
			redirect_to(:controller => 'users', :action => 'login')		
		end
	end

	def album
		
	end

	def newalbum
		albumtitle = params[:albumtitle]
		description = params[:description]
		if Album.find_by_albumname(albumtitle) then
			@warning = "* Warning: Sorry,the album already exists!!"
			render "album"
		else
			Dir.mkdir(Rails.root.to_s + "/public/albums/"+albumtitle)
			@album = Album.new
	      	@album.albumname = albumtitle
	      	@album.albumhost = session[:username]
	      	@album.description = description
	      	@album.save
	      	session[:albumtitle] = albumtitle
	      	redirect_to(:controller => 'pictures', :action => 'new')
		end
		
	end

	def picture
		@album = Album.all
	end

	def new
		@pic=Picture.where("filename = ?",session[:albumtitle])	
	end

	def newpic
		img = params[:img]				#img参数不再是简单类型，而是上传的文件对象
		content_size = img.size 		#获得上传文件的大小
		file_data = img.read			#获得上传文件的内容
		filetype = img.content_type 	#获得上传文件的类型
		@filename = img.original_filename 		#获得上传文件的文件名
		picname=img.original_filename
		@pic = Picture.new
	    @pic.filename = session[:albumtitle]
	    @pic.img = picname
	    @pic.save

		#将文件上传到当前项目的/public/uploads/目录
		File.open(Rails.root.to_s+"/public/albums/"+session[:albumtitle]+"/"+@filename,"wb"){
			|f| f.write(file_data)
		}

		#定义提示信息
		flash[:notice] = "文件: " + @filename + "上传成功 <br/>" 
	    redirect_to(:controller => 'pictures', :action => 'new')
		
	end


	def show
		@album = Album.find(params[:id])
		@pictures = Picture.where(" filename = ?", @album.albumname)
	end

	def slidepic
		@album = Album.find(params[:id])
		@pictures = Picture.where(" filename = ?", @album.albumname)
	end

end

		