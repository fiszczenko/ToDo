require 'spec_helper'

describe "lists/index" do
  before(:each) do
    assign(:lists, [
      stub_model(List,
        :task => "Task",
        :done => false
      ),
      stub_model(List,
        :task => "Task",
        :done => false
      )
    ])
  end

  it "renders a list of lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Task".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
