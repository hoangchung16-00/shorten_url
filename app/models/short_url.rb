class ShortUrl < ApplicationRecord
  validates :url, presence: true
  after_create_commit :create_slug

  private

  def create_slug
    slug = SecureRandom.hex(3) + self.id.to_s
    self.update(slug: slug)
  end
end
