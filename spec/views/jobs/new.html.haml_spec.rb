require 'spec_helper'

describe "jobs/new" do
  before(:each) do
    assign(:job, stub_model(Job,
      :action => "MyString",
      :url => "MyString",
      :params => "MyString"
    ).as_new_record)
  end

  it "renders new job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", jobs_path, "post" do
      assert_select "input#job_action[name=?]", "job[action]"
      assert_select "input#job_url[name=?]", "job[url]"
      assert_select "input#job_params[name=?]", "job[params]"
    end
  end
end
