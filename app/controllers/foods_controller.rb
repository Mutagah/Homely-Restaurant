class FoodsController < ApplicationController
    def index
        food = Food.all
        render json: food, :status :success
    end
end
