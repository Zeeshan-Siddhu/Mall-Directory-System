class ShopsController < ApplicationController
 
  def create
    @mall = Mall.find params[:mall_id]
    @shop = @mall.create_shop shop_params
  end

  def destroy
    @shop = Shop.find params[:id]
    @shop.destroy
  end

  def update
    @shop = Shop.find params[:id]
    @shop.update_information shop_params
  end

  private

  #strong parameters for security
  def shop_params
    params.require(:shop).permit(
      :name,
      :location
    )
  end

end