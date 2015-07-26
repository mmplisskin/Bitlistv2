class User < ActiveRecord::Base
  has_many :items, dependent: :destroy
  # has_many :reports
  class << self
	  def from_omniauth(auth_hash)
	    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    user.name = auth_hash['info']['name']
	    user.location = auth_hash['info']['location']
	    user.image_url = auth_hash['info']['image']
	    # user.url = auth_hash['info']['urls'][user.provider.capitalize]
	    user.email= auth_hash['info']['email']
	    user.save!
	    user
	  end
	end

  def access_token
     User.create_access_token(self)
   end
   # Verifier based on our application secret
   def self.verifier
     ActiveSupport::MessageVerifier.new(ENV['SECRET_TOKEN'])
   end
   # Get a user from a token
   def self.read_access_token(signature)
     id = verifier.verify(signature)
     User.find_by_id id
   rescue ActiveSupport::MessageVerifier::InvalidSignature
     nil
   end
   # Class method for token generation
   def self.create_access_token(user)
     verifier.generate(user.id)
   end






end
