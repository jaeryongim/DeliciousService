class Comment < ActiveRecord::Base
  belongs_to  :post
  belongs_to  :user
  validates :content, presence: { message: '내용을 반드시 입력하셔야 합니다.'}
end
