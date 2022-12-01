# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  ALLOWED_IMAGE_TYPES = ['image/png', 'image/gif', 'image/jpg', 'image/jpeg'].freeze
  ALLOWED_IMAGE_SIZE = (1..(5.megabytes)).freeze
end
