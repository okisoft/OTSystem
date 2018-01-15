class Question < ApplicationRecord
  belongs_to  :problem
  belongs_to  :user,         optional: true

  validates   :content,       presence: true,
                              length: { maximum: 512}
  validates   :reply,         length: { maximum: 512}
  validates   :visible,       presence: true,
                              inclusion: { in: [true, false] }
end
