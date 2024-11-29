-- User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID REFERENCES User(user_id),
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- New Price Table to avoid redundancy
CREATE TABLE Price (
    property_id UUID REFERENCES Property(property_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    PRIMARY KEY (property_id, start_date, end_date)
);