class AnswersController < ApplicationController
	before_action :set_answer, only: [:show, :edit, :update, :destroy]
	

	def index
  	 @answer = @question.answers
  	 authorize @answers
    end

	def new
		@answer = @question.answers.new
		authorize @answer
	end

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.new(answer_params)
		if @answer.save
			redirect_to @question	
	    else
			redirect_to @question	
	    end
	    authorize @answer
	end

	def edit
	end

	def change_is_complete
		@question = Question.find(params[:question_id])
		@answer = @question.answers.find(params[:answer_id])
		@answer.update! is_complete: params[:is_complete]
		render plain: 'OK'
		authorize @answer
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
	  authorize @answer
    end

	def answer_params
		params.require(:answer).permit(:answer, :is_complete)
	end
end