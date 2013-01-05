class Comment < ActiveRecord::Base
  attr_accessible :event_id, :msg, :user_id

  belongs_to :event
  belongs_to :user

  validates :msg,
    :presence => true,
    :length => { :maximum => 128 }
end
