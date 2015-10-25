class MallController < ApplicationController
  #Get mall/:id
  def show
    @mall = Mall.find(params[:id])
  end

  #Get mall/:id/manage
  def manage
    @mall = Mall.find(params[:id])

  end

  def upload_directory
    @mall = Mall.find(params[:id])
    if params[:file].path.include?('.txt')
      @mall.upload_directory params[:file].path
      redirect_to manage_mall_path(@mall) and return
    end  
  end

  def download_as_txt
    @mall = Mall.find(params[:id])
    directory = @mall.shops.to_txt
    send_data directory,
    :type => 'text',
    :disposition => "attachment; filename=directory-#{Date.today}.txt"
  end

  def download_as_csv
    @mall = Mall.find params[:id]
    directory = @mall.shops.to_csv
    send_data directory,
    filename: "shops-#{Date.today}.csv"
  end



end
