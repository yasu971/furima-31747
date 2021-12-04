class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '制服' },
    { id: 3, name: '書籍' },
    { id: 4, name: '辞書' },
    { id: 5, name: '家電' },
    { id: 6, name: '家具' },
    { id: 7, name: '文具' },
    { id: 8, name: '服' },
    { id: 9, name: 'その他生活雑貨' }
  ]
  
  include ActiveHash::Associations
  has_many :items
  end