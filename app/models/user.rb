class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews
    
    validates :email, uniqueness: { case_sensitive: false }
    validates :first_name, :last_name, :email, presence: true
    validates :password, length: { minimum: 6 }

    def self.authenticate_with_credentials(params)
        email = params[:email].downcase.gsub(" ", "").strip.squish
        if @user = User.find_by_email(email)
        @user.authenticate(params[:password])
        else
        nil
    end
end
end
