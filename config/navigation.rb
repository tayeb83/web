# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.
    #
    primary.item :home, t('menu.home'), url_for(:controller => '/pages', :id => 'home', :action => 'show', host: 'codegram.com')
    primary.item :services, t('menu.services'), url_for(:controller => '/pages', :id => 'services', :action => 'show')
    primary.item :team, t('menu.team'), url_for(:controller => '/pages', :id => 'team', :action => 'show')
    primary.item :work, t('menu.work'), projects_path, highlights_on: /\/work/
    primary.item :about, t('menu.about'), url_for(:controller => '/pages', :id => 'about', :action => 'show')
    primary.item :contact, t('menu.contact'), new_contact_form_path
    primary.item :blog, t('menu.blog'), blog_posts_url(host: 'blog.codegram.com')
    primary.item :workshops, t('menu.workshops'), url_for(:controller => '/pages', :id => 'workshops', :action => 'show', host: 'workshops.codegram.com')
    primary.item :talks, t('menu.talks'), 'http://talks.codegram.com'

    primary.item :dashboard, 'Dashboard', admin_dashboard_path, if: lambda { current_user }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    # primary.dom_class = 'menu-class'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
