require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :to => "To",
        :from => "From",
        :body => "Body",
        :sms_id => "Sms",
        :sms_status => "Sms Status"
      ),
      Message.create!(
        :to => "To",
        :from => "From",
        :body => "Body",
        :sms_id => "Sms",
        :sms_status => "Sms Status"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => "To".to_s, :count => 2
    assert_select "tr>td", :text => "From".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Sms".to_s, :count => 2
    assert_select "tr>td", :text => "Sms Status".to_s, :count => 2
  end
end
