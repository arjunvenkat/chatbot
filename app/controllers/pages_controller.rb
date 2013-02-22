class PagesController < ApplicationController

  def home
    @response = "How are you feeling today?"
  end

  def user_response
    if params[:user_response].present?
      cookies[:silent_treatment] = 0
      if params[:user_response].scan(/(great|good)/).present?
        @response = "Oh that's awesome"
      else
        @response = "Maybe you should see a professional about that..."
      end
    else
      num_silences = cookies[:silent_treatment].to_i
      num_silences += 1
      cookies[:silent_treatment] = num_silences
      if num_silences <= 2
        @response = "Oh come on, you can talk to me"
      elsif num_silences <= 4
        @response = "Don't give me the silent treatment. You're better than that"
      elsif 4 < num_silences
        @response = "You're being a real jerk right now"
      end
    end

    render 'home'
  end


end
