class VoteController < ApplicationController

  # GET /vote/1	
  def index
  	@survey = Survey.find(params[:id])
  	@vote = Vote.find_by_survey_id_and_user_id @survey.id, current_user.id
  	puts "found" unless @vote.nil?
  	if @vote.nil?
  		@vote = Vote.new
  		@vote.add_survey_and_user(@survey, current_user)
  		puts "creating a new vote"
  	end
  	respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote }
    end
  end
end
