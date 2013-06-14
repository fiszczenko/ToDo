require 'spec_helper'

describe "lists/new" do
  before(:each) do
    assign(:list, stub_model(List,
      :task => "MyString",
      :done => false
    ).as_new_record)
  end

  it "renders new list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lists_path, "post" do
      assert_select "input#list_task[name=?]", "list[task]"
      assert_select "input#list_done[name=?]", "list[done]"
    end
  end
end
