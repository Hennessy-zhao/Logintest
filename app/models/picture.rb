class Picture < ActiveRecord::Base
	def self.image_preview(file)
	    file_name = UUID.random_create.to_s + File.extname(file.original_filename)
	    file_path = "#{Rails.root}/public/upload_images/"
	    FileUtils.mkdir_p(file_path) unless File.exist?(file_path)
	    real_path = file_path + file_name
	    File.open(real_path, 'wb') do |f|
	      f.write(file.read)
    	end
    	return file_name
  	end

 	def self.get_image(name)
  		"/upload_images/#{name}"
 	end
end
