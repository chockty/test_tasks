class Task < ApplicationRecord
  validate :content, presence: true
end
