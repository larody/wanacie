class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :email

  has_many :events
  has_many :comments
  has_and_belongs_to_many :events

  validates :name,
    :presence => true,
    :uniqueness => true,
    :length => { :in => 4..16 }
  validates :password,
    :presence => true,
    :confirmation => true,
    :length => { :in => 4..64 }
  validates :email,
    :presence => true,
    :uniqueness => true,
    :length => { :maximum => 32 },
    :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  def self.authenticate(username, password)
    where(:name => username, :password => Digest::SHA1.hexdigest(password + Wanacie::Application.config.password_salt)).first
  end

end
