class ContactsController < ApplicationController
	def index
		@contacts = Contact.order(name: :desc)
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def destroy
		Contact.find(params[:id]).destroy
		redirect_to contacts_path
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to contact_path(@contact), notice: "Project was succesfully created."
		else
			render :new
		end
	end

	def contact_params
    	params.require(:contact).permit(:name, :address, :primary_phone, :secondary_phone, :primary_email, :secondary_email)
  	end

end
