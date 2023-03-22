class Public::CustomersController < ApplicationController

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
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     flash[:notice] = "変更が成功しました"
    redirect_to customer_path(@customer)
    else
      render 'edit'
    end
  end
      #flash[:customer_updated_error] = "会員情報が正常に保存されませんでした。"
   private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :postcode, :address, :phone_number)
  end

end
