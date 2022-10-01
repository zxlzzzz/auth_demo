class HomesController < ApplicationController

  def create


    @times = params.keys.first
    if @times.blank?
      return render json: { message: '参数为空' }
    end
    array = [];

    @times.to_i.times do |i|
      array.push("index-#{i}")
    end

    render json: {
      data: array.reverse,
      code: 200
    }

  end

  private

  def home_params
    params.permit()
  end

end
