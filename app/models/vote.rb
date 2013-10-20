class Vote < ActiveRecord::Base
  belongs_to :user
  has_one :survey
  has_many :orders, :dependent => :destroy
  attr_accessor :survey, :orders
  attr_accessible :survey_id, :user_id, :survey
  accepts_nested_attributes_for :orders, :allow_destroy => true

  def add_survey_and_user(survey, user)
    self.user = user
  	self.survey = survey
    self.orders = []
  	self.survey.questions.each do |question| 
  		order = Order.new
  		order.question = question
  		self.orders << order
  	end
  end
end
