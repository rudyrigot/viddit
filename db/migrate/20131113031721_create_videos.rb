class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.string :provider_name
    	t.string :provider_url
    	t.string :author_name
    	t.string :title
    	t.string :author_url
    	t.string :video_url
    	t.string :html
    	t.string :thumbnail_url
    	t.integer :height
    	t.integer :width
    	t.integer :thumbnail_height
    	t.integer :thumbnail_width
      t.timestamps
    end
  end
end
