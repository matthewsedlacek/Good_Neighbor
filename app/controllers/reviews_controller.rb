class ReviewsController < ApplicationController
    def index
        @reviews = Review.all
    end
    
    def show
        @review = Review.find(params[:id])
    end
    
    def new
       @review = Review.new
    end

    def create
        @review = Review.find(params[:id])
        @owner.update(review_params)
        redirect_to @review
        
    end

    
end
