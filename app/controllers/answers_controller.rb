class AnswersController < ApplicationController
	before_action :set_answer, only: [:show, :edit, :update, :destroy]
	

	def index
  	 @answer = @question.answers.all
    end

	def new
		@question = Question.find(params[:question_id])
		@answer = @question.answers.new
	end

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.new(answer_params)
		if @answer.save
			redirect_to @question	
	    else
			redirect_to @question	
	    end
	end

	def edit

	end

	def update
	  respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @question, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end

	end
	
	def destroy
	  @answer.destroy
      respond_to do |format|
      format.html { redirect_to @question, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
   	  end
	end

	private
	 def set_answer
	  @answer = Answer.find(params[:id])
	  @question = Question.find(params[:question_id])
    end

	def answer_params
		params.require(:answer).permit(:answer, :is_complete)
	end
end