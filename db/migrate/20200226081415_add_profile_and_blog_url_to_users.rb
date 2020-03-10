class AddProfileAndBlogUrlToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :blog_url, :string, default: ""
    add_column :users, :profile, :string, default: ""
  end
end
