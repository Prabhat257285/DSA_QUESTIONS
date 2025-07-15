-- Find books with no available copies (all currently borrowed)
SELECT 
    l.book_id, 
    l.title, 
    l.author, 
    l.genre, 
    l.publication_year, 
    l.total_copies AS current_borrowers
FROM 
    library_books l
JOIN (
    SELECT 
        br.book_id, 
        COUNT(*) AS active_borrowers
    FROM borrowing_records br
    WHERE br.return_date IS NULL
    GROUP BY br.book_id
) br_count 
  ON l.book_id = br_count.book_id
WHERE l.total_copies = br_count.active_borrowers
ORDER BY current_borrowers DESC, l.title ASC;