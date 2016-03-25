class Message < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, length: {
    	minimum: 1,
    	maximum: 10,
    	too_short: "sorry,your title must have at least %{count} words",
    	too_long: "sorry,your title must have at most %{count} words"
    }
    validates :message, length: {
    	minimum:1,
    	maximum: 1000,
    	too_short: "sorry,your message must have at least %{count} words",
    	too_long: "sorry,your message must have at most %{count} words"
    }
end
