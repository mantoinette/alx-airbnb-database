-- joins_queries.sql

-- INNER JOIN to retrieve all bookings and respective users
SELECT 
    b.booking_id,
    b.user_id,
    u.name AS user_name,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id
ORDER BY 
    b.booking_id;  -- Order by booking_id

-- LEFT JOIN to retrieve all properties and their reviews
SELECT 
    p.property_id,
    p.title AS property_title,
    r.review_id,
    r.rating,
    r.comment
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.property_id = r.property_id
ORDER BY 
    p.property_id;  -- Order by property_id

-- FULL OUTER JOIN to retrieve all users and all bookings
SELECT 
    u.user_id,
    u.name AS user_name,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date
FROM 
    users u
FULL OUTER JOIN 
    bookings b ON u.user_id = b.user_id
ORDER BY 
    u.user_id;  -- Order by user_id