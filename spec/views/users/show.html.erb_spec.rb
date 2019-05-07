require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "Username",
      :password => "Password",
      :email => "Email",
      :message => "Message",
      :gender_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Message/)
    expect(rendered).to match(/2/)
  end
end
