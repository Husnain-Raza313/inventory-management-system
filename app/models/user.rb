# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  VALID_EMAIL_REGEX = /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i.freeze
  validates :username, :image, :description, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :description, length: { minimum: 10, maximum: 30 }
  validates :email, format: { with: VALID_EMAIL_REGEX, multiline: true }
  validate :image_type, if: -> { image.attached? && !image.content_type.in?(%('image/jpeg image/png image/heic')) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :products, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  after_create :assign_default_role, if: -> { roles.blank? }

  private

  def image_type
    errors.add(:image, I18n.t('user.image'))
  end

  def assign_default_role
    add_role(:cashier)
  end
end
