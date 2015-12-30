require 'rails_helper'

RSpec.describe "messages/edit", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :to => "MyString",
      :from => "MyString",
      :body => "MyString",
      :sms_id => "MyString",
      :sms_status => "MyString"
    ))
  end

  it "renders the edit message form" do
    render

    assert_select "form[action=?][method=?]", message_path(@message), "post" do

      assert_select "input#message_to[name=?]", "message[to]"

      assert_select "input#message_from[name=?]", "message[from]"

      assert_select "input#message_body[name=?]", "message[body]"

      assert_select "input#message_sms_id[name=?]", "message[sms_id]"

      assert_select "input#message_sms_status[name=?]", "message[sms_status]"
    end
  end
end
