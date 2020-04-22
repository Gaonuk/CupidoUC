class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comentarios
  has_many :primary_cita, class_name: "Citum", foreign_key: "user_1_id"
  has_many :secondary_cita, class_name: "Citum", foreign_key: "user_2_id"

end
