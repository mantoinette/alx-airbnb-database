SELECT property_id
FROM reviews
GROUP BY property_id
HAVING AVG(rating) > 4.0;


SELECT u.user_id
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;