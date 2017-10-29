class Post < ApplicationRecord
  belongs_to :Project
  belongs_to :user
end
