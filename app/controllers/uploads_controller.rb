class UploadsController < ApplicationController
	def index
		@upload = Upload.all
	end
	
	def create
		@upload = Upload.new(upload_params)

		if @upload.save!
			redirect_to @upload, notice: 'successful'
		else
			render 'new'
		end
	end    

	def show
		 @upload = Upload.find(params[:id])	
	end

 	def new 
	 	@upload = Upload.new
	end

	def edit
	end


	protected

	def upload_params
		params.require(:upload).permit(:name, :file)
	end

end
