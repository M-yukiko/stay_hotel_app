class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  #検索用
  def self.search(search,area)
    search ?
    where('room_title LIKE ? or room_intro LIKE ? or room_adress LIKE ?',"%#{(search)}%", "%#{(search)}%", "%#{(search)}%")
    .where('room_adress LIKE ?',"%#{(area)}%"): all
  end

  def value_to_boolean(search,area)
    ActiveRecord::ConnectionAdapters::Column.value_to_boolean(search, area)
  end
end
