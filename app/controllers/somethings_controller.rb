class SomethingsController < ApplicationController
  def index
  end

  def show
  end

  def create
    res = ExternalApiClient.send_request( :post, '/hoge', { hoge: { fuga: 'FUGA' } } )
    render json: JSON.parse(res.body), status: res.code.to_i
  end

  def update
  end

  def destroy
  end
end
