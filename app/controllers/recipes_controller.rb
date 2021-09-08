class RecipesController < ApplicationController
    before_action :authorize

    def index
        render json: Recipe.all, include: [:user], status: :created
    end

    def create
        recipe = Recipe.create!(user_id: session[:user_id], title: params[:title], instructions: params[:instructions], minutes_to_complete: params[:minutes_to_complete])
        render json: recipe, include: [:user], status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    private

    def authorize
        return render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id 
    end
end
