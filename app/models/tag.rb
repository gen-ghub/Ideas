class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '規格外品' },
    { id: 3, name: '訳あり品' },
    { id: 4, name: 'その他' }

  ]

   include ActiveHash::Associations
   has_many :ideas

  end
