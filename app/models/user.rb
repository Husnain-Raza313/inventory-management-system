# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i.freeze
  validates :username, :image, :description, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 30 }
  validates :email, format: { with: VALID_EMAIL_REGEX, multiline: true }
  validate :image_type

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  private

  def image_type
    return if image.attached? == false
    return if image.content_type.in?(%('image/jpeg image/png image/heic'))

    errors.add(:image, I18n.t('devise.registrations.image'))
  end
end
