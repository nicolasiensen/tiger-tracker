# coding: utf-8
class User < ActiveRecord::Base
  validates :uid, :uniqueness => true
  validates :email, :uniqueness => true

  def self.find_or_create_by_hash hash
    User.create(
      :uid => hash[:uid], 
      :email => hash[:info][:email],
      :first_name => hash[:info][:first_name], 
      :last_name => hash[:info][:last_name], 
      :image_url => hash[:info][:image]
    )
    User.find_by_uid(hash[:uid])
  end
end
