# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    if account_signed_in?
      primary.item :datasets, 'Datasets', datasets_path, :link => {:class => 'button blue small'}
      primary.item :account, 'Account', edit_account_registration_path, :link => {:class => 'button blue small'}
      primary.item :logout, 'Log Out', destroy_account_session_path, :link => {:class => 'button small'}, :method => :delete
    else
      primary.item :signup, 'Sign Up', new_account_registration_path, :link => {:class => 'button blue small'}
      primary.item :login, 'Log In', new_account_session_path, :link => {:class => 'button small'}
    end
  end

end