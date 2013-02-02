require 'spec_helper'

describe 'Routes for wanacie' do
  it { expect(:get => '/').to route_to(:controller => 'events', :action => 'index') }
  it { expect(:get => '/maomi').to route_to(:controller => 'users', :action => 'show', :name => 'maomi') }
  it { expect(:get => '/settings/account').to route_to(:controller => 'users', :action => 'edit') }
  it { expect(:get => '/signup').to route_to(:controller => 'users', :action => 'new') }
  it { expect(:get => '/signin').to route_to(:controller => 'login', :action => 'index') }
  it { expect(:get => '/signout').to route_to(:controller => 'login', :action => 'logout') }
end
