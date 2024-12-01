-- Inserting data into User Table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
    (uuid_generate_v4(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '123-456-7890', 'guest'),
    (uuid_generate_v4(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '098-765-4321', 'host'),
    (uuid_generate_v4(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_3', NULL, 'admin');


    -- Inserting data into Property Table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
    (uuid_generate_v4(), 'host-uuid-1', 'Cozy Cottage', 'A cozy cottage in the woods.', 'Forest Area', 100.00),
    (uuid_generate_v4(), 'host-uuid-2', 'Beachfront Villa', 'A beautiful villa by the beach.', 'Beachside', 250.00),
    (uuid_generate_v4(), 'host-uuid-3', 'Downtown Apartment', 'An apartment in the heart of the city.', 'City Center', 150.00);


    -- Inserting data into Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
VALUES 
    (uuid_generate_v4(), 'property-uuid-1', 'user-uuid-1', '2023-10-01', '2023-10-05', 'confirmed'),
    (uuid_generate_v4(), 'property-uuid-2', 'user-uuid-2', '2023-11-10', '2023-11-15', 'pending'),
    (uuid_generate_v4(), 'property-uuid-3', 'user-uuid-3', '2023-12-20', '2023-12-25', 'canceled');