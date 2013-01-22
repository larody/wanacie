class Event < ActiveRecord::Base
  attr_accessible :held_datetime, :msg, :place, :purpose

  belongs_to :user
  has_and_belongs_to_many :users

  validates :purpose,
    :presence => true,
    :length => { :maximum => 32 }
  validates :place,
    :presence => true,
    :length => { :maximum => 32 }
  validates :held_datetime,
    :presence => true
  validates :msg,
  # :presence => true,
    :length => { :maximum => 128 }

  scope :upcoming, lambda { |num|
    where('held_datetime >= ?', Time.now - 360.minutes ).order('held_datetime ASC').limit(num)
  }

  scope :newly_arrived, lambda { |num|
    order('created_at DESC').limit(num)
  }

end
