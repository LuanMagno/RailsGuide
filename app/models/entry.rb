class Entry < ApplicationRecord # Validações ficam aqui
  belongs_to :user

  validates :name, :username, :password, presence: true
  validate :url_must_be_valid

  encrypts :username, deterministic: true
  encrypts :password

  private

  def url_must_be_valid
    unless url.include?("https" || "http")
      errors.add(:url, "must be valid")
    end
  end
end
