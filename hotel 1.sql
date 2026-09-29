CREATE DATABASE hotel_booking;

USE hotel_booking;


CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);


CREATE TABLE Hotel (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    rating DECIMAL(2,1)
);


CREATE TABLE Room (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT,
    room_number VARCHAR(10),
    room_type VARCHAR(50),
    price DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id)
);


CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    booking_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (room_id) REFERENCES Room(room_id)
);


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);


INSERT INTO Customer
(customer_name, phone, email, address)
VALUES
('Arun Kumar', '9876543210', 'arun@gmail.com', 'Chennai'),
('Rahul', '9876543211', 'rahul@gmail.com', 'Coimbatore'),
('Priya', '9876543212', 'priya@gmail.com', 'Madurai'),
('Karthik', '9876543213', 'karthik@gmail.com', 'Salem'),
('Divya', '9876543214', 'divya@gmail.com', 'Trichy');


INSERT INTO Hotel
(hotel_name, location, rating)
VALUES
('Grand Palace', 'Chennai', 4.5),
('Royal Stay', 'Coimbatore', 4.0),
('Green Park', 'Madurai', 4.2);


INSERT INTO Room
(hotel_id, room_number, room_type, price, status)
VALUES
(1, '101', 'Single', 1500.00, 'Available'),
(1, '102', 'Double', 2500.00, 'Booked'),
(1, '103', 'Deluxe', 3500.00, 'Available'),
(2, '201', 'Single', 1800.00, 'Available'),
(2, '202', 'Double', 2800.00, 'Booked'),
(3, '301', 'Deluxe', 3200.00, 'Available');


INSERT INTO Booking
(customer_id, room_id, check_in, check_out, booking_status)
VALUES
(1, 2, '2026-09-20', '2026-09-22', 'Confirmed'),
(2, 5, '2026-09-21', '2026-09-23', 'Confirmed'),
(3, 1, '2026-09-25', '2026-09-27', 'Completed'),
(4, 3, '2026-09-26', '2026-09-28', 'Confirmed');


INSERT INTO Payment
(booking_id, amount, payment_date, payment_method, payment_status)
VALUES
(1, 5000.00, '2026-09-20', 'UPI', 'Paid'),
(2, 5600.00, '2026-09-21', 'Card', 'Paid'),
(3, 3000.00, '2026-09-25', 'Cash', 'Paid'),
(4, 7000.00, '2026-09-26', 'UPI', 'Paid');


SELECT * FROM Customer;

SELECT * FROM Hotel;

SELECT * FROM Room;

SELECT * FROM Booking;

SELECT * FROM Payment;


SELECT
    customer_name,
    phone,
    email
FROM Customer;


SELECT
    hotel_name,
    location,
    rating
FROM Hotel;


SELECT
    room_number,
    room_type,
    price
FROM Room;


SELECT *
FROM Customer
WHERE address = 'Chennai';


SELECT *
FROM Room
WHERE status = 'Available';


SELECT *
FROM Room
WHERE status = 'Booked';


SELECT *
FROM Room
WHERE price > 2000;


SELECT *
FROM Room
WHERE price < 3000;


SELECT *
FROM Booking
WHERE booking_status = 'Confirmed';


SELECT *
FROM Booking
WHERE booking_status = 'Completed';


SELECT *
FROM Room
ORDER BY price ASC;


SELECT *
FROM Room
ORDER BY price DESC;


SELECT *
FROM Hotel
ORDER BY rating DESC;


SELECT
    Customer.customer_name,
    Booking.booking_id,
    Booking.check_in,
    Booking.check_out,
    Booking.booking_status
FROM Customer
JOIN Booking
    ON Customer.customer_id = Booking.customer_id;


SELECT
    Booking.booking_id,
    Room.room_number,
    Room.room_type,
    Room.price,
    Booking.check_in,
    Booking.check_out
FROM Booking
JOIN Room
    ON Booking.room_id = Room.room_id;


SELECT
    Hotel.hotel_name,
    Hotel.location,
    Room.room_number,
    Room.room_type,
    Room.price,
    Room.status
FROM Hotel
JOIN Room
    ON Hotel.hotel_id = Room.hotel_id;


SELECT
    Customer.customer_name,
    Booking.booking_id,
    Room.room_number,
    Room.room_type,
    Booking.check_in,
    Booking.check_out,
    Booking.booking_status
FROM Customer
JOIN Booking
    ON Customer.customer_id = Booking.customer_id
JOIN Room
    ON Booking.room_id = Room.room_id;


SELECT
    Customer.customer_name,
    Hotel.hotel_name,
    Hotel.location,
    Room.room_number,
    Room.room_type,
    Room.price,
    Booking.check_in,
    Booking.check_out,
    Booking.booking_status
FROM Customer
JOIN Booking
    ON Customer.customer_id = Booking.customer_id
JOIN Room
    ON Booking.room_id = Room.room_id
JOIN Hotel
    ON Room.hotel_id = Hotel.hotel_id;


SELECT
    Booking.booking_id,
    Booking.booking_status,
    Payment.amount,
    Payment.payment_method,
    Payment.payment_date,
    Payment.payment_status
FROM Booking
JOIN Payment
    ON Booking.booking_id = Payment.booking_id;


SELECT
    Customer.customer_name,
    Booking.booking_id,
    Payment.amount,
    Payment.payment_method,
    Payment.payment_status
FROM Customer
JOIN Booking
    ON Customer.customer_id = Booking.customer_id
JOIN Payment
    ON Booking.booking_id = Payment.booking_id;


SELECT COUNT(*) AS total_customers
FROM Customer;


SELECT COUNT(*) AS total_hotels
FROM Hotel;


SELECT COUNT(*) AS total_rooms
FROM Room;


SELECT COUNT(*) AS total_bookings
FROM Booking;


SELECT SUM(amount) AS total_payment
FROM Payment;


SELECT AVG(price) AS average_room_price
FROM Room;


SELECT MAX(price) AS highest_room_price
FROM Room;


SELECT MIN(price) AS lowest_room_price
FROM Room;


SELECT
    hotel_id,
    COUNT(*) AS total_rooms
FROM Room
GROUP BY hotel_id;


SELECT
    Hotel.hotel_name,
    COUNT(Room.room_id) AS total_rooms
FROM Hotel
JOIN Room
    ON Hotel.hotel_id = Room.hotel_id
GROUP BY Hotel.hotel_name;


SELECT
    payment_method,
    SUM(amount) AS total_amount
FROM Payment
GROUP BY payment_method;


SELECT
    booking_status,
    COUNT(*) AS total_bookings
FROM Booking
GROUP BY booking_status;


SELECT
    Hotel.hotel_name,
    COUNT(Room.room_id) AS total_rooms
FROM Hotel
JOIN Room
    ON Hotel.hotel_id = Room.hotel_id
GROUP BY Hotel.hotel_name
HAVING COUNT(Room.room_id) > 1;


UPDATE Room
SET status = 'Booked'
WHERE room_id = 1;


UPDATE Payment
SET payment_status = 'Paid'
WHERE payment_id = 1;


UPDATE Booking
SET booking_status = 'Completed'
WHERE booking_id = 1;


SELECT * FROM Room;

SELECT * FROM Payment;

SELECT * FROM Booking;


SELECT
    Customer.customer_name,
    Hotel.hotel_name,
    Hotel.location,
    Room.room_number,
    Room.room_type,
    Room.price,
    Booking.check_in,
    Booking.check_out,
    Booking.booking_status,
    Payment.amount,
    Payment.payment_method,
    Payment.payment_status
FROM Customer
JOIN Booking
    ON Customer.customer_id = Booking.customer_id
JOIN Room
    ON Booking.room_id = Room.room_id
JOIN Hotel
    ON Room.hotel_id = Hotel.hotel_id
JOIN Payment
    ON Booking.booking_id = Payment.booking_id;