class User
  include DataMapper::Resource
  
  ### Properties
  
  property :id, Integer, :serial => true
  property :email, String
  property :password, String
  property :created_at, DateTime
  property :updated_at, DateTime
  
  ### Associations
  
  has n, :comments
  
end
