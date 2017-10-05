class Article < ApplicationRecord
	belongs_to :author,  dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true
end

