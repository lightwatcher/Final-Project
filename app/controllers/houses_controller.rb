class HousesController < ApplicationController
  
  def griffendor
    @griffendors = User.where(house_id: 1)
  end
  
  def ravenclaw
    @ravenclaws = User.where(house_id: 2)
  end
  
  def hufflepuff
    @hufflepuffs = User.where(house_id: 3)
  end
  
  def slytheryn
    @slytherins = User.where(house_id: 4)
  end
  
end