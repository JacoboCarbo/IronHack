class EntriesController < ApplicationController

	def index
		@contact = Contact.find(params[:contact_id])
		@entries = @contact.entries
		@total_time = @contact.calculate_total_time
	end

	def new
		@contact = Contact.find(params[:contact_id])
		@entry = @contact.entries.new
	end

	def create
		@contact = Contact.find(params[:contact_id])
		@entry = @contact.entries.create(entry_params)
		if @entry.save
			redirect_to contact_entries_path(@contact), notice: "Entry was succesfully created."
		else
			render :edit
		end
	end

 	def destroy
		contact = Contact.find(params[:contact_id])
		contact.entries.find(params[:id]).destroy
		redirect_to contact_entries_path
	end

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :comments)
	end

end