class ReviewsController < ApplicationController
    before_action :require_login, only: [:new, :create]

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
        @review = Review.new(review_params)
        if @review.save
            redirect_to @review
        else
            flash[:errors] = @review.errors.full_messages
            redirect_to new_review_url
        end
    end

    private

    def review_params
        params.require(:review).permit(:booking_id, :rating, :text_review)
    end
end
