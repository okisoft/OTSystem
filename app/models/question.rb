class Question < ApplicationRecord
  belongs_to  :problem
  validates   :user_name,     length: { maximum: 16 }
  validates   :group_name,    length: { maximum: 16 }
  validates   :content,       presence: true,
                              length: { maximum: 512}
  validates   :reply,         length: { maximum: 512}
  validates   :visible,       presence: true,
                              inclusion: { in: [true, false] }
end
