# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX= /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :image
  validates_presence_of :description
  validates_length_of :description, :minimum => 10, :maximum => 30
  validates :email , presence: true,uniqueness: { case_sensetive:false }, format:{ with:VALID_EMAIL_REGEX,multiline:true }
  validate :image_type

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  has_one_attached :image, dependent: :destroy

private

    def image_type
    errors.add(:image, "is missing!") and return if image.attached? == false
    if !image.content_type.in?(%('image/jpeg image/png image/heic'))
      errors.add(:image, "needs to be a jpeg or png!")
      end
    end
end
