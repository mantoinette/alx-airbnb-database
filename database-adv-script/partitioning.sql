-- partitioning.sql

-- Step 1: Create the partitioned Booking table
CREATE TABLE bookings_partitioned (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for specific date ranges
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Add more partitions as needed for future years

-- Step 3: Insert data into the partitioned table
-- (Assuming you have existing data in the original bookings table)
INSERT INTO bookings_partitioned (user_id, property_id, start_date, end_date, amount)
SELECT user_id, property_id, start_date, end_date, amount
FROM bookings;

-- Step 4: Drop the old bookings table if necessary
-- DROP TABLE bookings; -- Uncomment if you want to drop the old table