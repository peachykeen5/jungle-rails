class Review < ActiveRecord::Base
    validates :product_id, :description, :rating, presence: true

    belongs_to :product
    belongs_to :user

end
