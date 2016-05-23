class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :username, presence: { message: '아이디를 입력하셔야 합니다.'}
  validates :username, uniqueness: { message: '이미 존재하는 아이디 입니다.', case_sensitive: false }
  validates :password, length: { minimum: 6, too_short: '비밀번호는 최소 6자리 입니다.'}
end
