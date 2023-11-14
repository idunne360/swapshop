Listing.create!(title: "Chair", price: 50.00, description: "This is a very good chair", date: DateTime.new(2023,10,10,22,35,0), poster: "Alex Ander")
Listing.create!(title: "Table", price: 75.00, description: "This is a decent table", date: DateTime.new(2023,10,10,23,35,0), poster: "Jane Den")
Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0), poster: "Pen Cil")
test = Listing.create!(title: "PS4", price: 150.00, description: "heavily used", date: DateTime.new(2023,10,15,22,35,0), poster: "John Doe")

u1 = User.create!(email: 'bcasey@colgate.edu', password: 'colgate13')
u2 = User.create!(email: 'lcushing@colgate.edu', password: 'colgate13')
u3 = User.create!(email: 'pmcloughlin@colgate.edu', password: 'colgate13')

c = Comment.create(commentText: "Comment", offer: 200)
c.user = u1

test.comments << c