require "../spec_helper"

class HomePageSpec < GarnetSpec::System::Test
	@@root = "http://localhost:3000/"

	describe "Home Page" do
		it "can see the welcome text" do
			visit @@root
			e = page.find_element( :tag_name, "h2" )
			e.text.should eq "Welcome to Amber Framework!"
	
			sleep 5
		end

		it "xcan visit items page" do
			visit @@root
	
			items_link = page.find_element(:link_text, "Items" )
			items_link.click

			sleep 5
		end
	end # describe
end # class
