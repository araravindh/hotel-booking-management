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