require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "vote contains survey" do
  	survey = surveys(:top5bands)
  	vote = Vote.new 
  	Vote.add_survey_and_user vote, survey, User.new
  	assert (not vote.survey.nil?)
  	assert (not vote.orders.nil?)
  	vote.orders.each do |order|
  		assert (not order.question.nil?)
  	end
  end
  test "points given" do
  	survey = surveys(:top5bands)
  	vote = Vote.new 
  	Vote.add_survey_and_user vote, survey, User.new
  	order = [questions(:top5bands_one).id,
  		questions(:top5bands_three).id,
  		questions(:top5bands_five).id,
  		questions(:top5bands_two).id,
  		questions(:top5bands_four).id
  	]
  	Vote.compute vote, order
  	vote_order = vote.orders
  	
  	assert (vote_order.first.question.id.eql? questions(:top5bands_one).id)
  	assert (vote_order.last.question.id.eql? questions(:top5bands_four).id)
  	assert (vote_order[1].question.id.eql? order[1])
  end
end
