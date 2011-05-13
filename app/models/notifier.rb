class Notifier < ActionMailer::Base
  default_url_options[:host] = "mobhooks.com"

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "MobHooks"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end
  
  def new_suggestion(suggestion)
    subject       "New Suggestion From Mobhooks User"
    from          "MobHooks"
    recipients    "ryan.macinnes@gmail.com, branier@hotmail.com"
    sent_on       Time.now
    if suggestion.user_id?
      body          :user => User.find(suggestion.user_id), :message => suggestion.message
    else
      body          :message => suggestion.message
    end
  end
  
  def redeem_points(user, points, email)
    subject "Someone wants to Redeem Points"
    from "MobHooks"
    recipients "ryan.macinnes@gmail.com, branier@hotmail.com"
    sent_on Time.now
    body :user => user, :points => points, :email => email
  end

end
