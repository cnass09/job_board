class Job < ActiveRecord::Base
	validates :title, presence: { message: "Job title required"}
	validates :description, presence: { message: "Job description required"}
end
