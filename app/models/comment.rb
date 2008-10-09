class Comment
  include DataMapper::Resource
  
  ### Properties
  
  property :id, Integer, :serial => true
  property :page_id, Integer
  property :body, Text, :lazy => true
  property :user_id, Integer
  property :created_at, DateTime
  property :updated_at, DateTime
  
  ### Associations
  
  belongs_to :user
  belongs_to :page
  
  ### Scopes
  
  def self.recent
    all(:created_at.gt => (Time.now - 1*24*60*60))
  end
  
end
