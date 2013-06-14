require 'spec_helper'

describe "lists/show" do
  before(:each) do
    @list = assign(:list, stub_model(List,
      :task => "Task",
      :done => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Task/)
    rendered.should match(/false/)
  end
end
