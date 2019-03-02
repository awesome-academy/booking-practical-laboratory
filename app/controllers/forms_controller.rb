class FormsController < ApplicationController
  def index
    @forms = Form.page(params[:page]).per Settings.page_limit
  end

  def new
    @form = Form.new
  end

  def create
    @form = current_user.forms.build
    @form.intent = params[:form][:intent]
    @form.room_id = params[:form][:room_id]
    @form.time_id = params[:form][:time_id]
    @form.phone = params[:form][:phone]

    if @form.save
      flash[:success] = t ".controller.success"
      redirect_to @form
    else
      flash[:danger] = t ".controller.danger"
      render :new
    end
  end

  def show
    @forms = Form.find_by id: params[:id]
  end

  private

  def form_params
    params.require(:form).permit :room_id, :time_id, :intent, :phone
  end

  def find_forms
    @form = Form.find_by id: params[:user_id]
  end
end
