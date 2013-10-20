class Survey < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  has_many :questions, :dependent => :destroy
  attr_accessible :description, :style, :title, :questions_attributes, :end_date, :url, :end_qty_votes, :closed
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
end
