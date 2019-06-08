class Project < ApplicationRecord
  has_one_attached :image
  has_rich_text :description

  validates :title, presence: true
  validates :goal, presence: true
  validates :description, presence: true

  validates :title, length: { maximum: 80 }

  validates :goal, numericality: { less_than_or_equal_to: 500, greater_than: 0 }

  validates :image,
    attached: true,
    content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    size: { less_than: 500.kilobytes, message: I18n.t('errors.messages.file_is_too_large', size: 500, unit: 'kb') }
end
