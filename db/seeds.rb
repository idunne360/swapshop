u4 = User.create!(email: 'cperry@colgate.edu', password: 'colgate13')


Listing.create!(title: "Chair", price: 50.00, description: "This is a very good chair", date: DateTime.new(2023,10,10,22,35,0), poster: "Alex Ander", user: u4)
Listing.create!(title: "Table", price: 75.00, description: "This is a decent table", date: DateTime.new(2023,10,10,23,35,0), poster: "Jane Den", user: u4)
Listing.create!(title: "iPad", price: 350.00, description: "used", date: DateTime.new(2023,10,15,22,35,0), poster: "Pen Cil", user: u4)
test = Listing.create!(title: "PS4", price: 150.00, description: "heavily used", date: DateTime.new(2023,10,15,22,35,0), poster: "John Doe", user: u4)


Listing.create!(
    title: "The biggest box",
    price: 499.99,
    description: "For storing huge quantities of whatever",
    date: DateTime.new(2023,12,2,22,35,0),
    poster: "Jim",
    user: u4
)
Listing.create!(
    title: "A big box",
    price: 199.99,
    description: "For storing above-average quantities of whatever",
    date: DateTime.new(2023,12,2,22,35,0),
    poster: "Jim",
    user: u4
)
Listing.create!(
    title: "A box",
    price: 99.99,
    description: "For storing average quantities of whatever",
    date: DateTime.new(2023,12,2,22,35,0),
    poster: "Jim",
    user: u4
)
Listing.create!(
    title: "A small box",
    price: 49.99,
    description: "For storing small quantities of whatever",
    date: DateTime.new(2023,12,2,22,35,0),
    poster: "Jim",
    user: u4
)
Listing.create!(
    title: "The smallest box",
    price: 9.99,
    description: "For storing near-imperceptible quantities of whatever",
    date: DateTime.new(2023,12,2,22,35,0),
    poster: "Jim",
    user: u4
)

u0 = User.create!(email: 'admin@colgate.edu', password: 'colgate13', admin: true)
u1 = User.create!(email: 'bcasey@colgate.edu', password: 'colgate13')
u2 = User.create!(email: 'lcushing@colgate.edu', password: 'colgate13')
u3 = User.create!(email: 'pmcloughlin@colgate.edu', password: 'colgate13')


c1 = Comment.create(commentText: "Need one ASAP!", offer: 200)
c1.user = u1
c2 = Comment.create(commentText: "Forget that other guy, I'll pay $50 more", offer: 250)
c2.user = u3


test.comments << c1
test.comments << c2