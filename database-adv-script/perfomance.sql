Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql


-- performance.sql

-- Initial query to retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.title AS property_title,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.booking_id = pay.booking_id;


Analyze the query’s performance using EXPLAIN and identify any inefficiencies.

EXPLAIN ANALYZE 
SELECT 
    b.booking_id,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.title AS property_title,
    p.location AS property_location,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.booking_id = pay.booking_id;


Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.


-- performance.sql (refactored)

-- Refactored query to retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.title AS property_title,
    pay.payment_id,
    pay.amount AS payment_amount
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.booking_id = pay.booking_id
WHERE 
    b.booking_date IS NOT NULL;  -- Example filter to reduce result set