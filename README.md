# hotel-booking-management
# Hotel Booking Management System

A **Hotel Booking Management System** developed using **MySQL** to manage customers, hotels, rooms, bookings, and payments.

This project demonstrates database design, relationships, CRUD operations, filtering, sorting, joins, aggregate functions, grouping, and reporting using SQL.

## Project Overview

The system is designed to manage hotel booking information in a structured relational database.

It maintains information about:

- Customers
- Hotels
- Rooms
- Bookings
- Payments

The database uses **Primary Keys** and **Foreign Keys** to establish relationships between different tables.

## Technologies Used

- MySQL
- MySQL Workbench
- SQL
- Git
- GitHub

## Database Structure

The project contains five main tables:

```text
Customer
   |
   | customer_id
   ↓
Booking
   |
   | room_id
   ↓
Room
   |
   | hotel_id
   ↓
Hotel

Booking
   |
   | booking_id
   ↓
Payment
```

## Tables

### Customer

Stores customer information.

| Column | Description |
|---|---|
| customer_id | Unique customer ID |
| customer_name | Customer name |
| phone | Customer phone number |
| email | Customer email |
| address | Customer location |

### Hotel

Stores hotel information.

| Column | Description |
|---|---|
| hotel_id | Unique hotel ID |
| hotel_name | Hotel name |
| location | Hotel location |
| rating | Hotel rating |

### Room

Stores room information.

| Column | Description |
|---|---|
| room_id | Unique room ID |
| hotel_id | Related hotel ID |
| room_number | Room number |
| room_type | Single, Double, Deluxe |
| price | Room price |
| status | Available or Booked |

### Booking

Stores customer booking information.

| Column | Description |
|---|---|
| booking_id | Unique booking ID |
| customer_id | Related customer ID |
| room_id | Related room ID |
| check_in | Check-in date |
| check_out | Check-out date |
| booking_status | Booking status |

### Payment

Stores payment information.

| Column | Description |
|---|---|
| payment_id | Unique payment ID |
| booking_id | Related booking ID |
| amount | Payment amount |
| payment_date | Payment date |
| payment_method | UPI, Card, Cash |
| payment_status | Payment status |

## Features

### Customer Management

- Add customer details
- View customer details
- Search customers by location
- Retrieve specific customer information

### Hotel Management

- Add hotel details
- Store hotel ratings
- View hotel information
- Sort hotels by rating

### Room Management

- Add rooms
- Store room types and prices
- Check available rooms
- Check booked rooms
- Filter rooms based on price
- Sort rooms by price

### Booking Management

- Create bookings
- Store check-in and check-out dates
- Track booking status
- View customer booking details

### Payment Management

- Record payments
- Store payment methods
- Track payment status
- Calculate total payment amount

## SQL Concepts Used

This project covers the following SQL concepts:

- `CREATE DATABASE`
- `CREATE TABLE`
- `PRIMARY KEY`
- `FOREIGN KEY`
- `AUTO_INCREMENT`
- `INSERT`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `UPDATE`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MAX()`
- `MIN()`
- `GROUP BY`
- `HAVING`
- `JOIN`

## Sample Queries

### View Available Rooms

```sql
SELECT *
FROM Room
WHERE status = 'Available';
```

### Find Rooms Above ₹2000

```sql
SELECT *
FROM Room
WHERE price > 2000;
```

### Customer Booking Details

```sql
SELECT
    Customer.customer_name,
    Booking.booking_id,
    Booking.check_in,
    Booking.check_out,
    Booking.booking_status
FROM Customer
JOIN Booking
    ON Customer.customer_id = Booking.customer_id;
```

### Complete Booking Report

```sql
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
```

## Project Structure

```text
Hotel-Booking-Management-System/
│
├── hotel_booking.sql
│
├── queries/
│   ├── select_queries.sql
│   ├── join_queries.sql
│   └── aggregate_queries.sql
│
└── README.md
```

## How to Run the Project

### 1. Install MySQL

Install MySQL
