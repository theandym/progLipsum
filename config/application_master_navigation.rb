# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|
    primary.item :root, 'progLipsum', root_path do |nav|
      nav.item :home, nil, root_path, :highlights_on => //
      nav.item :datasets, 'Datasets', datasets_path, :highlights_on => /datasets/ do |dataset|
        dataset.item :new_dataset, 'New Dataset', new_dataset_path, :highlights_on => /datasets\/new/
        dataset.item :preview_datasets, 'Preview Dataset', nil, :highlights_on => /datasets\/preview/
        dataset.item :dataset, @dataset.try(:name), dataset_path(controller_name == 'datasets' && (action_name == 'show' || action_name == 'edit') ? @dataset : dataset), :highlights_on => /datasets\/(?!new\b)\b\w+([A-Za-z0-9]+)/
      end
      
      nav.item :signup, 'Sign Up', new_account_registration_path, :highlights_on => /signup/
      
      nav.item :login, 'Log In', account_session_path, :highlights_on => /login/
      
      nav.item :accounts, 'Account', account_registration_path, :highlights_on => /accounts\/(?!new\b)\b\w+([A-Za-z0-9]+)/ do |account|
        account.item :account, nil, account_registration_path(controller_name == 'accounts' && (action_name == 'show' || action_name == 'edit') ? @account : account), :highlights_on => /accounts\/(?!new\b)\b\w+([A-Za-z0-9]+)/
      end
    end
  end

end