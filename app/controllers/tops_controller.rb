class TopsController < ApplicationController
  require "date"
  def index
    @tops = Top.all.order(created_at: :asc)
    @top = Top.new

    @incomes = Income.all
    @fixedcosts = Fixedcost.all
    @variablecosts = Variablecost.all
    
    @fixedcost_values_sum = Top.where(cost_type: "固定費").group("extract(month from registered_at)").sum(:price)
    @variablecost_values_sum = Top.where(cost_type: "変動費").group("extract(month from registered_at)").sum(:price)
  end

  def create
    @top = Top.new(top_params)

    if @top.save
      redirect_to tops_path, notice: "登録しました"
    else
      redirect_to tops_path, notice: "登録に失敗しました"
    end
  end

  def update
    @top = Top.find(params[:id])
    
    if @top.update(top_params)
      redirect_to tops_path, notice: "登録を更新しました"
    else
      redirect_to tops_path, notice: "登録の更新に失敗しました"
    end
  end

  def destroy
    @top = Top.find(params[:id])

    if @top.destroy
      redirect_to tops_path, notice: "登録を削除しました"
    else
      redirect_to tops_path, notice: "登録の削除に失敗しました"
    end
  end

  def show
  end

  def edit
  end

  def top_params
    params.require(:top).permit(:registered_at, :contents, :price, :category, :cost_type)
  end
end
