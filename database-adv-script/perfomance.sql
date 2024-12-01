-- performance.sql (updated)

-- Analyze the performance of the query
EXPLAIN ANALYZE 
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
    b.booking_date IS NOT NULL  -- Example filter to reduce result set
    AND pay.amount > 0;         -- Additional condition to filter payments