class Comment
  include DataMapper::Resource
  
  property :id, Integer, :serial => true
  property :site, String, :lazy => false
  property :body, Text, :lazy => true
  property :author, String, :lazy => false
  
end
