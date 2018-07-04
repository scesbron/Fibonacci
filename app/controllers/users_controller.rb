class UsersController < Clearance::UsersController

  def new
    @form = signup_form.from_model(user_from_session)
    logger.debug("########### #{@form.inspect}")
    render @form.view
  end

  def previous
    UserPrevious.call(user_from_session) do
      on(:ok) { redirect_to sign_up_path }
    end
  end

  def create
    @form = signup_form.from_params(params, id: session[:user_id])
    @form.command.call(@form) do
      on(:ok) do |user|
        if user.submitted?
          session.delete(:user_id)
          sign_in user
          redirect_back_or url_after_create
        else
          session[:user_id] = user.id
          redirect_to sign_up_path
        end
      end
      on(:invalid) do
        render @form.view
      end
    end
  end

  private

  def signup_form
    user = user_from_session
    if user&.completing?
      SignupStepTwoForm
    else
      SignupStepOneForm
    end
  end

  def user_from_session
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
