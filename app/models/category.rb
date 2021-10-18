class Category < ActiveHash::Base
  self.data =[
    {id: 0 , name: '---'},
    {id: 1 , name: '和食'},
    {id: 2 , name: '洋食・西洋料理'},
    {id: 3 , name: '中華'},
    {id: 4 , name: 'イタリアン'},
    {id: 5 , name: 'フレンチ'},
    {id: 6 , name: 'エスニック'},
    {id: 7 , name: 'すし・魚料理'},
    {id: 8 , name: '肉料理・メイン'},
    {id: 9 , name: '丼もの・揚げ物'},
    {id: 10 , name: '煮物'},
    {id: 11 , name: '焼きもの・粉もの'},
    {id: 12 , name: '麺類'},
    {id: 13 , name: 'お弁当'},
    {id: 14 , name: 'おつまみ'},
    {id: 15 , name: 'お菓子・スイーツ'}
  ]

  include ActiveHash::Associations
  has_many :articles
end