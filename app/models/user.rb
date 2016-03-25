class User < ActiveRecord::Base
	validates :username, length: {
    	minimum: 3,
    	maximum: 10,
    	too_short: "sorry,your username must have at least %{count} words",
    	too_long: "sorry,your username must have at most %{count} words"
    },uniqueness: { case_sensitive: false }
    validates :userpassword, length: {
    	minimum: 6,
    	maximum: 20,
    	too_short: "sorry,your password must have at least %{count} words",
    	too_long: "sorry,your password must have at most %{count} words"
    }
end
