require 'spec_helper'

describe "jobs/show" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :action => "Action",
      :url => "Url",
      :params => "Params"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Action/)
    rendered.should match(/Url/)
    rendered.should match(/Params/)
  end
end
