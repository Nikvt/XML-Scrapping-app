class SubdomainConstraint
  def self.matches?(request)
    subdomains = %w{ www }
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints SubdomainConstraint do
    root to: 'articles#home'

    get 'home', to: 'articles#home'

    post 'create', to: 'articles#create'
  end
end
