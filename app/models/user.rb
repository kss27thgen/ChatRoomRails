class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum group: [:モー娘。, :アンジュルム, :JJ, :こぶしファクトリー, :つばきファクトリー, :BEYOOOOONS, :研修生 ]
end
