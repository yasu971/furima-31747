  class Choice < ActiveHash::Base
    self.data = [
      { id: 1, name: '--' },
      { id: 2, name: '選択1' },
      { id: 3, name: '選択2' },
      { id: 4, name: '選択3' },
      { id: 5, name: '選択4' },
      { id: 6, name: '選択5' },
      { id: 7, name: '選択6' },
      { id: 8, name: '選択7' },
    ]

    include ActiveHash::Associations
    has_many :items

    end