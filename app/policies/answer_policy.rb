class AnswerPolicy < ApplicationPolicy
	def index?
	   true
	end

	def create?
		true
	end 

	def update?
		true
	end 
	def destroy?
		true
	end 
	def change_is_complete?
		true
	end
	
	
end