class AreasController < ApplicationController
  def index
    @p = Facility.ransack(params[:p],search_key: :p)
    @categories = @p.result(distinct: true)
    @check = params[:p]
  end
end
