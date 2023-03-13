class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end
      #flash[:customer_updated_error] = "会員情報が正常に保存されませんでした。"
   private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :postcode, :address, :phone_number)
  end


end
