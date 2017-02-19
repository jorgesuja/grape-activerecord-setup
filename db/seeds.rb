# encoding: UTF-8
require_relative '../app/models/author'
require_relative '../app/models/book'

authors_data = [
  { name: 'Fernando Aramburu', books: ['Patria'] },
  { name: 'Federico Moccia', books: ['Tres veces tú'] },
  { name: 'Dolores Redondo', books: ['Todo esto te daré'] },
  { name: 'Carlos Ruiz Zafón', books: ['El Laberinto de los Espíritus'] },
  { name: 'Luz Gabás', books: ['Como fuego en el hielo'] },
  { name: 'Mónica Carrillo', books: ['El tiempo. Todo. Locura'] },
  { name: 'Laura Norton', books: ['Ante todo, mucho karma'] },
  { name: 'Luis Landero Duran', books: ['La vida negociable'] },
  { name: 'Marcos Chicot', books: ['El asesinato de Sócrates'] },
  { name: 'Paula Hawkins', books: ['La chica del tren'] },
]

authors_data.each do |author_data|
  author = Author.create( name: author_data[:name] )
  author_data[:books].each do |book|
    author.books.create( name: book )
  end
end
