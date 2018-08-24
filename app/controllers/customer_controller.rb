class CustomerController < ApplicationController
  def index
  	@customers = Customer.all
  end
  
  def get_customers
    if params[:query].present?
      @customers=Customer.where('LOWER(name) LIKE :name', name: "%#{params[:query].downcase}%")
      render :partial => "list"
    else
      render :text => "blank_search"
    end
  end

  def new
  	@customer = Customer.new	
  end

  def create
  	@customer = Customer.create(customer_params)
  	redirect_to root_url
    flash[:notice] = "Successfully created!"
  end

  def update
    @customer = Customer.find_by_id(params[:id]) 
    @customer.update_attributes(customer_params)
    redirect_to root_url
    flash[:notice] = "Successfully updated!"
  end

  def edit
    @customer = Customer.find_by_id(params[:id])
  end

  private
	  def customer_params
	    params.require(:customer).permit(:name, :address,:pincode,:mobile,:email,:remarks)
	  end
end
