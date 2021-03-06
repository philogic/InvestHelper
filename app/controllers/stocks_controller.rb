class StocksController < ApplicationController
  def search
    if params[:stock]
      @stock = Stock.find_by_ticker(params[:stock])
      @stock ||= Stock.retrieve_from_api(params[:stock])
    end

    if @stock
      render partial: 'form'
    else
      render status: :not_found, nothing: true
    end
  end
end
