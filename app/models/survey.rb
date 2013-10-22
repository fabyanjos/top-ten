class Survey < ActiveRecord::Base
  validates :title, presence: true
  validates :end_qty_votes, numericality: { only_integer: true }, :allow_nil => true
  validate :validate_end, :future_date, :question_size
  belongs_to :user
  has_many :questions, :dependent => :destroy
  attr_accessible :description, :style, :title, :questions_attributes, :end_date, :url, :end_qty_votes, :closed
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  def validate_end
  	if !end_date.blank? and !end_qty_votes.blank?
  		errors.add(:end_date, "select only one way to terminate your survey")
  		errors.add(:end_qty_votes, "select only one way to terminate your survey")
  	end
  	if end_date.blank? and end_qty_votes.blank?
  		errors.add(:end_date, "select one way to terminate your survey")
  		errors.add(:end_qty_votes, "select one way to terminate your survey")
  	end
  end

  def future_date
  	if !end_date.nil? and end_date <= Time.now
  		errors.add(:end_date, "need to be a future date")
  	end
  end

  def question_size
  	final = Array.new
  	questions.each do |q|
  		unless q._destroy
  			final << q
  		end
  	end
  	if final.size < 5 or final.size > 10
		errors.add(:questions, "need to be >= 5 and <= 10")
	end
  end
end
