class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy


	has_attached_file :avatar,
                   :styles => { :medium => "150x150>", :thumb => "44x44>" },
                   :default_url => "http://41.media.tumblr.com/45a83a77dcdaf351a9be2d4a7441551f/tumblr_n8039s4bbq1s8mgkyo8_500.jpg"

 	validates :first_name, :last_name, :city, :email, :presence => true, 
 			length: {maximum: 255}

 	validates_uniqueness_of :email 

 	has_secure_password

 	validates_attachment :avatar, :presence => true,
                      :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
                      :size => { :in => 0..100000000.kilobytes }




end
