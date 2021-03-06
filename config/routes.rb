CodegramWeb::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users

  # Public sections

  ## Blog subdomain
  constraints subdomain: 'blog' do
    match '/en/2010/04/30/presenting-date-validator.html' => redirect('/2011/2/date-validation-with-rails-3', status: 301)
    match '/es/2010/04/29/presenting-date-validator.html' => redirect('/2011/2/date-validation-with-rails-3', status: 301)
    namespace :blog, path: '/' do
      resources :users, only: :show
      constraints format: :html do
        match '/' => 'posts#index', as: :blog, via: :get
        match '(/:year)(/:month)' => 'posts#index', as: :posts, via: :get
        resources :posts, { path: '/:year/:month', only: :show }
      end
    end
    match '/feed.xml' => 'blog/posts#index', as: :feed, via: :get, format: :atom
    match '/feed.atom' => redirect('http://feeds.feedburner.com/codegram', status: 301)
    match '*path' => 'errors#not_found'
  end

  constraints subdomain: 'www' do
    match '(*path)' => redirect("http://codegram.com/%{path}", status: 301)
  end


  ## Base subdomain
  constraints BaseSubdomain do

    scope '/api' do
      scope '/posts' do
        get "/" => "api/posts#index"
        post "/" => "api/posts#create"
      end
    end

    resource :contact_form,
      :path => 'contact',
      :only => [:new, :create],
      :path_names => {:new => '/'}

    resources :projects, :only =>[:index], :path => '/work/(:work_category_id)', defaults: {work_category_id: 'client'}
    match '/feed.atom' => redirect("http://blog.codegram.com/feed.atom", status: 301)
    match '/services', :controller => 'pages', :action => :show, :id => 'services'
    match '/team', :controller => 'pages', :action => :show, :id => 'team'
    match '/about', :controller => 'pages', :action => :show, :id => 'about'
    match '/what-we-do' => redirect('/services', status: 301)

    match '/es' => redirect("/", status: 301)
    match '/es/*path' => redirect("/%{path}", status: 301)

    match '/work/*category/*extra' => redirect("/work/%{category}", status: 301)

    match '*path' => 'errors#not_found'
  end

  constraints subdomain: 'workshops' do
    match '/', :controller => 'pages', :action => :show, :id => 'workshops'
  end

  root :to => "pages#show", :id => 'home'

  match '/sitemap.xml' => 'sitemaps#show'

  match '*path' => redirect("http://codegram.com/%{path}", status: 301)
  match '/' => redirect('http://codegram.com/', status: 301)
end
