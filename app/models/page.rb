class Page
  include DataMapper::Resource
  
  ### Properties
  
  property :id, Integer, :serial => true
  property :url, String
  property :created_at, DateTime
  property :updated_at, DateTime
  
  ### Associations
  
  has n, :comments
  
end
