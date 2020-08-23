class LikesController < ApplicationController
	belong_to :user
	belong_to :item
end
