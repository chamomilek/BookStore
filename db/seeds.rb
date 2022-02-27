# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
categories = Category.create([
                               {
                                 genre: "Best-seller",
                                 image_url: "https://s1.livelib.ru/boocover/1003630340/o/345b/Mariett_Lindstin__Sekta_s_Tumannogo_ostrova.jpeg"
                               },
                               {
                                 genre: "Imaginative literature",
                                 image_url: "https://cdn1.ozone.ru/s3/multimedia-c/wc1200/6010505100.jpg"
                               },
                               {
                                 genre: "Fantasy",
                                 image_url: "https://cdn1.ozone.ru/s3/multimedia-x/wc1200/6013355709.jpg"
                               },
                               {
                                 genre: "Psychology",
                                 image_url: "https://cdn.ast.ru/v2/ASE000000000837521/COVER/cover1__w600.jpg"
                               },
                               {
                                 genre: "Cooking",
                                 image_url: "https://s4-goods.ozstatic.by/2000/616/83/101/101083616_0.jpg"
                               }
                             ])

books = Book.create(
  [
    {
      title: "Harry Potter",
      description: "Throughout the series, Harry is described as having his father's perpetually untidy black hair,
his mother's bright green eyes, and a lightning bolt-shaped scar on his forehead.
He is further described as 'small and skinny for his age' with 'a thin face' and 'knobbly knees',
 and he wears Windsor glasses.",
      images: "",
      price: 9.10,
      pages: 300,
      language: "Russian",
      dimensions: 100,
      publication_date: 2019,
      weight: 540,
      id: categories.third
      # category: categories.third
    }
  ])