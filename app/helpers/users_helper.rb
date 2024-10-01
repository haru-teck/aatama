module UsersHelper
  def user_gender_class(user)
    case user.gender
    when '男性'
      'user-name-male'
    when '女性'
      'user-name-female'
    else
      'user-name-other'
    end
  end
end
