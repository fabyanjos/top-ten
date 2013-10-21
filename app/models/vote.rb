class Vote < ActiveRecord::Base
  belongs_to :user
  has_one :survey
  has_many :orders, :dependent => :destroy
  attr_accessible :survey_id, :user_id, :survey
  accepts_nested_attributes_for :orders, :allow_destroy => true

  
  def self.add_survey_and_user(vote, survey, user)
    vote.user = user
  	vote.survey = survey
    vote.orders = []
  	vote.survey.questions.each do |question| 
  		order = Order.new
  		order.question = question
  		vote.orders << order
  	end
  end
  def self.compute vote, order
    order = order.reverse
    vote.orders.each do | vote_order |
      vote_order.value = ((order.index vote_order.question.id) +1)
    end 
    vote.orders.sort_by! {|order| order[:value]} 
    vote.orders.reverse!
  end
end
