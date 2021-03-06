# frozen_string_literal: true

class Local < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :comuna
  has_many :comentarios
  has_many :cita
  has_many :platos
  has_one_attached :avatar
  has_many :valoracions
  has_one :postulante
end
