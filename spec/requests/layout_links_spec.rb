require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have a Home page at '/'" do
  	get '/'
  	response.body.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
  	get '/contact'
  	response.body.should have_selector('title', :content => "Contact")
  end

  it "should have an About page at '/about'" do
  	get '/about'
  	response.body.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'" do
  	get '/help'
  	response.body.should have_selector('title', :content => "Help")
  end

  it "should have a signup page at '/signup'" do
  	get '/signup'
  	response.body.should have_selector('title', :content => "Sign up")
  end

  it "should have the right links on the layout" do
  	visit root_path
  	click_link "About"
  	response.body.should have_selector('title', :content => "About")
  	click_link "Help"
  	response.body.should have_selector('title', :content => "Help")
  	click_link "Contact"
  	response.body.should have_selector('title', :content => "Contact")
  	click_link "Home"
  	response.body.should have_selector('title', :content => "Home")
  	click_link "Sign up now!"
  	response.body.should have_selector('title', :content => "Sign up")
  end

  describe "when not signed in" do
  	it "should have a signin link" do
  		visit root_path
  		page.should have_selector("a", :href => signin_path, :content => "Sign in")
  	end
  end

  describe" when signed in" do
  	before(:each) do
  		@user = FactoryGirl.create(:user)
  		visit signin_path
  		fill_in :email, :with => @user.email
  		fill_in :password, :with => @user.password
  		click_button "Sign in"
  	end

  	it "should have a signout link" do
  		visit root_path
  		page.should have_selector("a", :href => signout_path, :content => "Sign out")
  	end

  	it "should have a profile link" do
  		visit root_path
  		page.should have_selector("a", :href => user_path(@user), :content => "Profile")
  	end
  end


end
