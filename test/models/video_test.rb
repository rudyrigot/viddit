require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  test "get the video attributes" do
    video = Video.create(video_url: 'http://vimeo.com/7100569')
    assert_equal 'Brad!', video.title
  end
end
