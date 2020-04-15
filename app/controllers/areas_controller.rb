class AreasController < ApplicationController
  def index
    @p = Facility.ransack(params[:p],search_key: :p)
    @areas = @p.result(distinct: true)
    @check = params[:p]
    @facility = Facility.all
    
    @areaies = Prefecture.all
    @q = Facility.ransack(params[:q],search_key: :q)
    @areaes = @q.result(distinct: true)
    @checks = params[:q]
    
  end




end