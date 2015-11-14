data BookInfo = Book Int String [String]
                deriving (Show)

type CustomerID = Int  -- Type synonyms are purely for making code more readable
type ReviewBody = String
data BookReview = BookReview BookInfo CustomerID ReviewBody
                  deriving (Show)

b1 = Book 1 "The Fellowship of the Ring" ["Tolkien"]
b2 = Book 2 "The Two Towers" ["Tolkien"]

r1 = BookReview b1 1 "Tom Bombadil is quite sketchy."


