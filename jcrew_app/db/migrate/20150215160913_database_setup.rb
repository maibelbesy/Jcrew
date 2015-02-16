class DatabaseSetup < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :email
  		t.string :password
  		t.string :photo, default: ""
  		t.string :signature, default: ""
  		t.text :about, default: ""
  		t.boolean :is_admin, default: false

  		t.timestamps
  	end

  	create_table :posts do |t|
  		t.string :title
  		t.text :content
  		t.integer :user_id

  		t.timestamps
  	end

  	create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post, index: true

      t.timestamps null: false
    end

  	create_table :comments_join do |t|
  		t.integer :comment_id
  		t.integer :reply_id

  		t.timestamps
  	end

  	create_table :media do |t|
  		t.string :url
  		t.integer :post_id
  		t.boolean :is_image

  		t.timestamps
  	end

  	create_table :categories do |t|
  		t.string :name

  		t.timestamps
  	end

  	create_join_table :posts, :categories do |t|
	  t.timestamps
	end
  end
end
