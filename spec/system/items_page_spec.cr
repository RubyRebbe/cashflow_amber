require "../spec_helper"

class ItemPageSpec < GarnetSpec::System::Test
	@@root = "http://localhost:3000/"

	describe "Items Page" do
		it "can visit items page" do
			visit @@root
	
			items_link = page.find_element(:link_text, "Items" )
			items_link.click

			sleep 5
		end
	end # describe
end # class
