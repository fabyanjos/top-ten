class VoteController < ApplicationController

  # GET /vote/1	
  def index
  	@survey = Survey.find(params[:survey_id])
  	@vote = Vote.find_by_survey_id_and_user_id @survey.id, current_user.id
    unless @vote.nil?

    end
  	respond_to do |format|
      format.html # show.html.erb
    end
  end
  def save
    @survey = Survey.find(params[:survey_id])
    order = []
    unless params[:order].blank?
      order = params[:order].split(",").collect{|i| i.to_i}
    else
      @survey.questions.each do | survey_order | 
        order << survey_order.id
      end
    end
    @vote = Vote.new
    Vote.add_survey_and_user(@vote ,@survey, current_user)
    Vote.compute @vote, order
    flash[:alert] = "Your vote was sucessfully registered"
    #  puts "creating a new vote"
    #@vote = Vote.find_by_survey_id_and_user_id @survey.id, current_user.id
    #puts "found" unless @vote.nil?
    #if @vote.nil?
    #  @vote = Vote.new
    #  @vote.add_survey_and_user(@survey, current_user)
    #  puts "creating a new vote"
    #end
    respond_to do |format|
      format.html # save.html.erb
      format.json { render json: @vote }
    end
  end
  # GET /vote/1 
  def show
    @survey = Survey.find(params[:survey_id])
    @vote = Vote.find_by_survey_id_and_user_id @survey.id, current_user.id
    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
