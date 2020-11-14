class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '提案' },
    { id: 3, name: '募集' }

  ]

   include ActiveHash::Associations
   has_many :seeds

  end
