class Font
  include Mongoid::Document
  field :data, type: Hash
  field :name, type: String
  has_and_belongs_to_many :users
end