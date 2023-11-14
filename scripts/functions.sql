CREATE OR REPLACE FUNCTION select_books_by_category(category_name TEXT) 
RETURNS TABLE(id INTEGER, title TEXT, author_name TEXT) AS $$
BEGIN
  RETURN QUERY SELECT
    b.id,
    b.title,
    a.name AS author_name
    
    FROM books_categories bc 
    JOIN categories c ON bc.category_id = c.id AND LOWER(c.name) = LOWER(category_name)
    JOIN books b ON bc.book_id = b.id     
    LEFT JOIN authors a ON b.author_id = a.id;
END;
$$ LANGUAGE plpgsql;