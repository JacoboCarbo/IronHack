class ContactsController < ApplicationController
	def index
		@contacts = Contact.order(name: :asc)
	end

	def favourites
		@contacts = Contact.where(favourite: true)
		render :index
	end

	def search
		@contacts = Contact.where("name LIKE ?","#{params[:contact][:name]}%")
		render :index
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		@contact = Contact.new
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])

		if @contact.update_attributes(contact_params)
			redirect_to contact_path(@contact), notice: "Contact was succesfully updated."
		else
			render :edit
		end
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			redirect_to contact_path(@contact), notice: "Contact was succesfully created."
		else
			render :new
		end
	end

	def favourite
		@contact = Contact.find(params[:id])
		if @contact.favourite == true
			@contact.update_attributes(favourite: false)
		else
			@contact.update_attributes(favourite: true)
		end
		render :show
	end


	def contact_params
    	params.require(:contact).permit(:name, :address, :primary_phone, :secondary_phone, :primary_email, :secondary_email)
  	end

 	def destroy
		Contact.find(params[:id]).destroy
		redirect_to contacts_path
	end

end
