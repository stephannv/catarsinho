# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  {
    title: 'New Kosmos Album',
    description: '<div class=\\"trix-content\\">  <div>About<br><br></div><div>Would you like to be involved in the making and success of our album, and receive a "reward" as well?<br><br></div><div>We are <a href=\\"http://www.kosmosensemble.com/\\"><strong>Kosmos</strong></a>, a unique and international trio of soloists: violinist <strong>Harriet Mackenzie</strong>, violist <strong>Meg Hamilton</strong> and accordionist <strong>Miloš Milivojević</strong>. <br><br></div><div>Richard Morrison from <em>The Times</em> has written that  Kosmos performs with <strong><em>“telepathic rapport, dazzling virtuosity, serious scholarship, intellectual curiosity and impeccable musicianship."</em></strong></div></div>',
    goal: 199.00,
    image: Rails.root.join('db', 'seeds_images', 'kosmos.jpg')
  },
  {
    title: 'R-Type Final 2',
    description: 'R-Type is a side-scrolling shooter arcade gameIrem Corporationbrought into the world in 1987.  The energy chargeable "Wave Cannon" with strong offensive capability, the indestructible, remote-controlled "Force" protecting the fighter which can be attached to the front of rear of the fighter to fire laser beams, and the bold design of enemies with the merger of organism and mecha, as well as its groundbreaking idea of introducing a stage where player fight against a gigantic battleship that is even bigger than the screen size, R-Type swept the world.',
    goal: 230.0,
    image: Rails.root.join('db', 'seeds_images', 'rtypefinal2.png')
  },
  {
    title: 'Company of Heroes',
    description: 'An RTS board game adapted from one of the greatest strategy games of all time',
    goal: 452.33,
    image: Rails.root.join('db', 'seeds_images', 'companyofheroes.jpg')
  },
  {
    title: 'CLONSTERS Volume 1 + 2!',
    description: '<div class=\\"trix-content\\">  <h1>CLONSTERS<strong> combines the weirdness and humor of 90s cartoons like "Aaahh! Real Monsters" with the whimsy and heart of modern day animation like "Adventure Time."<br></strong><br></h1><div><strong>CLONSTERS</strong> is back with another volume, and this time we\'re going planetary. <br><br><strong>CLONSTERS: SPACE NUGGETS </strong>is about a world of strange, lovable monsters who discover the existence of aliens. With the heart of a Pixar film and the off-kilter humor of your favorite 90s cartoon, <strong>CLONSTERS: SPACE NUGGETS </strong>is an adventure that is truly for all ages.</div><div></div><div></div><div></div></div>',
    goal: 349.00,
    image: Rails.root.join('db', 'seeds_images', 'clonsters.jpg')
  }
].each do |project_data|
  project = Project.new(project_data.except(:image))
  project.image.attach(io: File.open(project_data[:image]), filename: 'image.png')
  project.save!
end
