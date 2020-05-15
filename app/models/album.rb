class Album < ApplicationRecord
	include Randomable
	mount_uploader :album_image, PlayImageUploader
end
