# frozen_string_literal: true

module Authorization

  def authorize_student
    unless current_user.is_student?
      flash[:alert] = "Unauthorized Access"
      redirect_to app_root_path
    end
  end

  def authorize_instructor
    unless current_user.is_instructor?
      flash[:alert] = "Unauthorized Access"
      redirect_to app_root_path
    end
  end

  def authorize_admin
    unless current_user.is_admin?
      flash[:alert] = "Unauthorized Access"
      redirect_to app_root_path
    end
  end

end
