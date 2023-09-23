class Post
  include Cequel::Record

  key :id, :timeuuid, auto: true
  column :title, :text
  column :body, :text

  timestamps
end
