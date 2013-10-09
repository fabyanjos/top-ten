class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  attr_accessible :description, :style, :tilte
end
