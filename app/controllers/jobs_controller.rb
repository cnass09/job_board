class JobsController < ApplicationController
def index
	@jobs = Job.all
end
def new
	@job = Job.new
end
def create
	job =  Job.new(job_params)
	if job.save
		flash[:notice] = "Job successfully created"
		redirect_to jobs_path
	else 
		flash[:error] = "Error: Job not created. Please check inputs for blank fields."
		redirect_to :back
	end
end

def edit
	@job = Job.find(params[:id])
end

def update
	@job = Job.find(params[:id])
	if @job.update_attributes(job_params)
		flash[:notice] = "Job successfully updated"
		redirect_to jobs_path
	else 
		redirect_to :back
		flash[:error] = "Error: Job not updated. Please check inputs for blank fields."
	end		
end

def destroy
	@job = Job.find(params[:id])
	if @job.destroy
		flash[:notice] = "Job successfully deleted"
		redirect_to jobs_path
	else 
		redirect_to :back
		flash[:error] = "Error: Job not deleted. Please try again."
	end	
end

private

def job_params
	params.require(:job).permit(:title, :description, :id)
end

end
