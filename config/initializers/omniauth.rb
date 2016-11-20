Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '552265901643512', 'a3621aa2bf09a01a52423ea4d85470a5',
           :scope => 'email,user_birthday', :display => 'popup'
end