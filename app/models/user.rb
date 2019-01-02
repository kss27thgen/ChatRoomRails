class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :groups, through: :group_users
  has_many :group_users

  enum group: [:モー娘。, :アンジュルム, :JJ, :こぶしファクトリー, :つばきファクトリー, :BEYOOOOONS, :研修生 ]
end
