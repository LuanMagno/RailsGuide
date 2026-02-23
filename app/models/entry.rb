class Entry < ApplicationRecord # Validações ficam aqui
  belongs_to :user

  validates :name, :username, :password, presence: true
  validate :url_must_be_valid

  encrypts :username, deterministic: true
  encrypts :password

  scope :search_name, ->(name) {    # Basicamente é um atalho para uma consulta do active records
    where("entries.name ILIKE ?", "%#{name}%") if name.present?
  }

  def self.search(name)
    search_name(name).order(:name)
  end

  private

  def url_must_be_valid
    unless url.include?("https" || "http")
      errors.add(:url, "must be valid")
    end
  end
end
