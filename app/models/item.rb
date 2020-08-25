class Item < ApplicationRecord
	mount_uploader :file, AudioFileUploader
	
	belongs_to :user
end
