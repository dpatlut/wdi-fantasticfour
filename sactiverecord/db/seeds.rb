lannister = House.create({
  name: "Lannister",
  sigil_url: "http://img1.wikia.nocookie.net/__cb20140402110342/gameofthrones/images/thumb/0/0b/House-Lannister-heraldry.jpg/250px-House-Lannister-heraldry.webp",
  region: "The Westerlands"
})

stark = House.create({
  name: "Stark",
  sigil_url: "http://img2.wikia.nocookie.net/__cb20140402121259/gameofthrones/images/thumb/7/72/House-Stark-heraldry.jpg/250px-House-Stark-heraldry.jpg",
  region: "The North"
})

baratheon = House.create({
  name: "Baratheon",
  sigil_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/4/4a/House-Baratheon-of-Dragonstone-Main-Shield.PNG/revision/latest?cb=20170519003417",
  region: "The Crownlands"
  })

bolton = House.create({
  name: "Bolton",
  sigil_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/d/dd/House-Bolton-Main-Shield.PNG/revision/latest?cb=20161231131431",
  region: "The North"
  })

tyrell = House.create({
  name: "Tyrell",
  sigil_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/c/cf/House-Tyrell-Main-Shield.PNG/revision/latest?cb=20170108163035",
  region: "The Reach"
  })

targaryen = House.create({
  name: "Targaryen",
  sigil_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/4/43/House-Targaryen-Main-Shield.PNG/revision/latest?cb=20170510235320",
  region: "The Crownlands"
  })

martell = House.create({
  name: "Martell",
  sigil_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/7/7e/House-Martell-Main-Shield.PNG/revision/latest?cb=20170523024859",
  region: "Dome"
  })

Character.create({
  name: "Tyrion",
  house_id: lannister.id,
  image_url: "http://upload.wikimedia.org/wikipedia/en/5/50/Tyrion_Lannister-Peter_Dinklage.jpg"
})

Character.create({
  name: "Arya",
  house_id: stark.id,
  image_url: "http://static.comicvine.com/uploads/original/12/123851/2498566-arya_stark.jpg"
})

Character.create({
  name: "Jon",
  house_id: stark.id,
  image_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/a/a5/Profile-JonSnow-707.png/revision/latest?cb=20170828030553"
})

Character.create({
  name: "Sansa",
  house_id: stark.id,
  image_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/7/7e/Sansastark706.jpg/revision/latest?cb=20170828072803"
})

Character.create({
  name: "Jaime",
  house_id: lannister.id,
  image_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/e/eb/Jaime.jpg/revision/latest?cb=20170818052054"
})

Character.create({
  name: "Cersei",
  house_id: stark.id,
  image_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/c/c3/Profile-CerseiLannister.png/revision/latest?cb=20170828071355"
})

Character.create({
  name: "Bran",
  house_id: stark.id,
  image_url: "https://vignette.wikia.nocookie.net/gameofthrones/images/d/d8/%22It%27s_Wasted_On_A_Cripple%22.png/revision/latest?cb=20171006183914"
})