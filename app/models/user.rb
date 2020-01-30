class User < ApplicationRecord
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

validates :name, length: { in: 2..20 }
validates :introduction, length: { maximum: 50 }

has_many :books, dependent: :destroy
attachment :profile_image




end
