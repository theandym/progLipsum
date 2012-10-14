# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    if account_signed_in?
      primary.item :datasets, 'Datasets', datasets_path
      primary.item :account, 'Account', edit_account_registration_path
      primary.item :logout, 'Log Out', destroy_account_session_path, :method => :delete
    else
      primary.item :signup, 'Sign Up', new_account_registration_path
      primary.item :login, 'Log In', new_account_session_path
    end
  end

end