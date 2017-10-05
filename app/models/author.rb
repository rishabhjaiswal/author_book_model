class Author < ApplicationRecord
	has_many :articles,
		:foreign_key => :author_id
end
