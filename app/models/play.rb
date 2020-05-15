class Play < ApplicationRecord
	include Randomable
	mount_uploader :play_image, PlayImageUploader
end
