class VariablecostValuesController < ApplicationController
        require "date"
        
            def index
                @variablecosts = Variablecost.order(created_at: :asc)
                @variablecost_values = VariablecostValue.order("year_month asc")
            end
        
            def show
                @variablecost_value = VariablecostValue.find(params[:id])
            end
        
            def new
                year_month_day = params[:year_month]
                @year_month = year_month_day
         
                @variablecosts = Variablecost.order(created_at: :asc)
                @form = Form::VariablecostForm.new
            end
            
            def edit
                @variablecost_value = VariablecostValue.find(params[:id])
                @variablecost = Variablecost.find(@variablecost_value.variablecost_id)
            end
        
            def create
                @form = Form::VariablecostForm.new(variablecost_form_params)
                if @form.save
                    redirect_to :variablecost_values, notice: "登録しました"
                else
                    redirect_to :variablecost_values, notice: "登録に失敗しました"
                end
            end
        
            def variablecost_form_params
                params.require(:form_variablecost_form).permit(variablecost_values_attributes: Form::VariablecostValue::REGISTRABLE_ATTRIBUTES)
            end
        
            def update
                @variablecost_value = VariablecostValue.find(params[:id])
                @variablecost_value.assign_attributes(params[:variablecost_value])
                if @variablecost_value.save
                    redirect_to :variablecost_values, notice: "情報を更新しました"
                else
                    render "edit"
                end
            end
        
            def destroy
                @variablecost_value = VariablecostValue.find(params[:id])
                @variablecost_value.destroy
                redirect_to :variablecost_values, notice: "データを削除しました"
            end
        
end
