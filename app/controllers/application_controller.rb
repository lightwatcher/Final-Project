class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def home
  end
  def quiz
    if 
    @currquiz=Array.new
    10.times do
      @currquiz.push(1+rand(Question.all.length))
    end
  end
  def processing
    @answers = Array.new
    @no_of_questions = Question.all
    @no_of_questions.each do |question|
      @answers.push(params[question.id.to_s])
    end
    @g_points = @answers.count("griffendor")
    @r_points = @answers.count("ravenclaw")
    @h_points = @answers.count("hufflepuff")
    @s_points = @answers.count("slytheryn")
  end
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
#   end
end
end