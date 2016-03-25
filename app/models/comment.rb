class Comment < ActiveRecord::Base
	belongs_to :message

	validates :comment_message, length: {
    	minimum: 1,
    	maximum: 500,
    	too_short: "sorry,your comment must have at least %{count} words",
    	too_long: "sorry,your comment must have at most %{count} words"
    }
end
