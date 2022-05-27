class HomesController < ApplicationController
  def top
    @genres = Genre.where(is_active: true)
    @items = Item.all
    @random = Product.order("RANDOM()").limit(4)
  end
end
