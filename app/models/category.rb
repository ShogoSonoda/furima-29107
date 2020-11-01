class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'カード' },
    { id: 3, name: '本' },
    { id: 4, name: 'ゲーム' },
    { id: 5, name: '服' },
    { id: 6, name: '家電' }
  ]
end
