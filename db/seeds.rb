User.destroy_all

u1 = User.create :name => 'Jones', :email => 'jonesy@ga.co', :password => 'chicken'
u2 = User.create :name => 'Craig', :email => 'craigsy@ga.co', :password => 'chicken'
u3 = User.create :name => 'Matt', :email => 'matT@ga.co', :password => 'chicken', :admin => true
puts "#{User.count}"


Author.destroy_all

a1 = Author.create(:name => 'J.R.R. Tolkien', :nationality => 'English', :dob => '1892-01-03', :image => 'https://www.harringtonbooks.co.uk/images/upload/authors_9_1.jpg')

a2 = Author.create(:name => 'Brandon Sanderson', :nationality => 'American', :dob => '1975-12-19', :image => 'https://images.gr-assets.com/authors/1394044556p8/38550.jpg')

a3 = Author.create(:name => 'Mary Shelley', :nationality => 'English', :dob => '1797-08-30', :image => 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/RothwellMaryShelley.jpg/1200px-RothwellMaryShelley.jpg')
puts "#{Author.count}"

Book.destroy_all

b1 = Book.create(:title => 'The Lord of the Rings', :year => '1954-1955', :genre => 'Fantasy', :synopsis => 'The future of civilization rests in the fate of the One Ring, which has been lost for centuries. Powerful forces are unrelenting in their search for it. But fate has placed it in the hands of a young Hobbit named Frodo Baggins, who inherits the Ring and steps into legend. A daunting task lies ahead for Frodo when he becomes the Ringbearer - to destroy the One Ring in the fires of Mount Doom where it was forged.', :image => 'https://upload.wikimedia.org/wikipedia/en/e/e9/First_Single_Volume_Edition_of_The_Lord_of_the_Rings.gif')

b2 = Book.create(:title => 'The Way of Kings', :year => '2010', :genre => 'Fantasy', :synopsis => 'Shallan, a minor lighteyed woman whose family and lands are in danger, hatches a daring plot to switch a broken Soulcaster (a device that allows people to change objects to other things) with a working one belonging to Jasnah Kholin, sister of the Alethi king.', :image => 'https://hungryandfit.com/wp-content/uploads/2014/04/The-Way-of-Kings-by-Brandon-Sanderson.jpg')

b3 = Book.create(:title => 'Frankenstein', :year => '1818', :genre => 'Gothic/Science Fiction', :synopsis => 'As Viktor Frankenstein (Kenneth Branagh) is dying he shares a tale of gruesome terror with a sea captain. Viktor, using previous experiments by a brilliant scientist, was able to bring a creature (Robert De Niro) assembled from body parts back to life. Once he realized how destructive his experiments had become, he abandoned the creature and tried to live a normal life with his fiance (Helena Bonham Carter). The lonely creature seeks out Viktor and demands one of two things: a bride or revenge.', :image => 'https://m.media-amazon.com/images/I/41dj+xC+zWL.jpg')

puts "#{Book.count}"

List.destroy_all

l1 = List.create(:title => 'Big Books')
l2 = List.create(:title => 'Small Books')
l3 = List.create(:title => 'Books Matt has read')

puts "#{List.count}"


#Associations ###############


puts "Authors and books"
a1.books << b1
a2.books << b2
a3.books << b3

puts "Books and lists"
l1.books << b1 << b2
l2.books << b3
l3.books << b2 << b3

puts "Lists and users"
u1.lists << l1 << l2
u3.lists << l3
