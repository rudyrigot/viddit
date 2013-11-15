class Video < ActiveRecord::Base
  before_create :populate_fields

  default_scope { order(created_at: :desc) }

private

  def populate_fields
    self.title = oembed[:title]
    self.thumbnail_url = oembed[:thumbnail_url]
    self.thumbnail_width = oembed[:thumbnail_width]
    self.thumbnail_height = oembed[:thumbnail_height]
    self.html = oembed[:html]
    self.height = oembed[:height]
    self.width = oembed[:width]
    self.author_name = oembed[:author_name]
    self.provider_name = oembed[:provider_name]
    self.provider_url = oembed[:provider_url]
  end

  def oembed
    @oembed ||= OEmbed.get(video_url)
  end
end
