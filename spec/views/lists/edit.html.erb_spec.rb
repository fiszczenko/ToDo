require 'spec_helper'

describe "lists/edit" do
  before(:each) do
    @list = assign(:list, stub_model(List,
      :task => "MyString",
      :done => false
    ))
  end

  it "renders the edit list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", list_path(@list), "post" do
      assert_select "input#list_task[name=?]", "list[task]"
      assert_select "input#list_done[name=?]", "list[done]"
    end
  end
end
