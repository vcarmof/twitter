ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :image
  
  
user = User.all
@friends = Friend.all


  index do 
    column :name
    column :email
    column :likes do |u|
      u.likes.count
      
    end
    column :tweets do |u|
      u.tweets.count
    end

    column "retweets"

    actions
  end
  
  
end
    
 

  
  
    
    
  
