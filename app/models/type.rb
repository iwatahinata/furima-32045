class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'あああ' },
    { id: 3, name: 'いいい' },
  ]

  include ActiveHash::Associations
  has_many :users
end
