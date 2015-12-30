require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :to => "To",
      :from => "From",
      :body => "Body",
      :sms_id => "Sms",
      :sms_status => "Sms Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/To/)
    expect(rendered).to match(/From/)
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/Sms/)
    expect(rendered).to match(/Sms Status/)
  end
end
