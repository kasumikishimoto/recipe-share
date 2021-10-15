class TimeRequire < ActiveHash::Base
  self.data =[
    {id: 0 , name: '---'},
    {id: 1 , name: '10分以内'},
    {id: 2 , name: '10分〜20分'},
    {id: 3 , name: '20分〜30分'},
    {id: 4 , name: '30分〜45分'},
    {id: 5 , name: '45分〜60分'},
    {id: 6 , name: '60分以上'}
  ]

  include ActiveHash::Associations
  has_many :articles
end