class Order < ActiveRecord::Base
  belongs_to :vote	
  belongs_to :question	
  attr_accessible :question_id, :value, :vote_id
end
