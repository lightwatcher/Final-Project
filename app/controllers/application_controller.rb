class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def home
  end
  
  def quiz
    if !session['user_id']
      redirect_to "/home",
      alert: "please sign in"
    end
    @currquiz = (1..Question.all.length).to_a.sample(10)
  end
  
  def processing
#     @answers = Array.new
#     @no_of_questions = Question.all
#     @no_of_questions.each do |question|
#       @answers.push(params[question.id.to_s])
#     end
#     @g_points = @answers.count("griffendor")
#     @r_points = @answers.count("ravenclaw")
#     @h_points = @answers.count("hufflepuff")
#     @s_points = @answers.count("slytheryn")

  
#     if @g_points > @r_points && @g_points > @h_points && @g_points > @s_points
#       redirect_to "/youre_in_griffendor"
#     elsif @r_points > @g_points && @r_points > @h_points && @r_points > @s_points
#       redirect_to "/youre_in_ravenclaw"
#     elsif @h_points > @r_points && @h_points > @g_points && @h_points > @s_points
#       redirect_to "/youre_in_hufflepuff"
#     elsif @s_points > @s_points && @s_points > @h_points && @s_points > @g_points
#       redirect_to "/youre_in_slytheryn"
#     end
#   end
#   def griffendor
#     @user = User.find_by_id(session['user_id'])
#     @user.house_id = 1
#   end
#   def hufflepuff
#     @user = User.find_by_id(session['user_id'])
#     @user.house_id = 2
#   end
#   def slytheryn
#     @user = User.find_by_id(session['user_id'])
#     @user.house_id = 3
#   end
#   def ravenclaw
#     @user = User.find_by_id(session['user_id'])
#     @user.house_id = 4
  end
end