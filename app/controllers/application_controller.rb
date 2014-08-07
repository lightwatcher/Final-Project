class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def login_required
    user = User.find_by(id: session['user_id'])
    if user.blank?
      redirect_to "/", alert: "You need to log in"
    end
  end
  
  def home
  end
  
  def quiz
    if !session['user_id']
      redirect_to "/home", alert: "You need to log in"
    end
    @currquiz = (1..Question.all.length).to_a.sample(10)
  end
  
  def processing
    @points = Hash.new(0)
    params.each do |score|
      @points[score[1]] += 1 
    end 
    if @points["griffendor"] >= @points["ravenclaw"] && @points["griffendor"] >= @points["hufflepuff"] && @points["griffendor"] >= @points["slytheryn"]
       user = User.find_by_id(session['user_id'])
      user.house_id = 1
      user.save
      redirect_to "/griffendor", alert: 'You are in Gryffendor'
    elsif @points["ravenclaw"] >= @points["griffendor"] && @points["ravenclaw"] >= @points["hufflepuff"] && @points["ravenclaw"] >= @points["slytheryn"]
      user = User.find_by_id(session['user_id'])
      user.house_id = 2
      user.save
      redirect_to "/ravenclaw", alert: 'You are in Ravenclaw'      
    elsif @points["hufflepuff"] >= @points["ravenclaw"] && @points["hufflepuff"] >= @points['griffendor'] && @points["hufflepuff"] >= @points["slytheryn"]
      user = User.find_by_id(session['user_id'])
      user.house_id = 3
      user.save
      redirect_to "/hufflepuff", alert: 'You are in Hufflepuff'
    elsif @points["slytheryn"] > @points["ravenclaw"] && @points["slytheryn"] >= @points["hufflepuff"] && @points["slytheryn"] >= @points["griffendor"]
      user = User.find_by_id(session['user_id'])
      user.house_id = 4
      user.save
      redirect_to "/slytheryn", alert: 'You are in Slytherin' 
    end
  end
  
end