class ReviewsController < ApplicationController
    def show
        @reviews = Review.all.order(created_at: :desc)
        @name = @reviews.first_name.order(created_at: :desc)
    end

    def new
        @review = Review.new
    end

    def create
        input_params = {
            product_id: params[:product_id],
            user_id: review_params[:user_id],
            rating: review_params[:rating],
            description: review_params[:description],
        }
        @review = Review.create!(input_params)    
        @review.user = current_user
        redirect_to @review.product

    end

    def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to :back
      end


    def review_params
        params.require(:review).permit(:description, :rating, :product_id, :user_id)
    end

end
