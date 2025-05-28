use ola;

 -- 1. Retrieve all successful bookings:
create view Successful_Booking as
select * from booking
where booking_status = "success";
-- 1. Retrieve all successful bookings:
select * from Successful_Booking;

 -- 2. Find the average ride distance for each vehicle type:
 create view average_ride_distance_for_each_vehicle as
 select Vehicle_Type, Avg(Ride_Distance) as Avg_Distance
 from Booking
 Group By Vehicle_type; 
 -- 2. Find the average ride distance for each vehicle type:
 select * from average_ride_distance_for_each_vehicle;
 
 --  3. Get the total number of cancelled rides by customers:
 create view Canceled_Rides_by_Customers as 
 select count(*)
 from booking
 where Booking_status = "canceled by customer";
--  3. Get the total number of cancelled rides by customers:
 select * from Canceled_Rides_by_Customers;

--  4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers as
select customer_ID, count(Booking_ID) as Total_rides
from Booking 
group by customer_id
order by total_rides desc
limit 5;
--  4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers;

--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view canceled_by_driver_p_c_issue as
select count(*)
from Booking 
where Canceled_Rides_by_Driver = "personal and car-related issue";
--  5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from canceled_by_driver_p_c_issue;

--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view maximum_and_minimum_driver_ratings as
select max(Driver_ratings) as max_rating,
min(Driver_ratings) as min_rating
from Booking
where vehicle_type = "prime sedan";
--  6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from maximum_and_minimum_driver_ratings;

--  7. Retrieve all rides where payment was made using UPI:
create view payment_made_using_UPI as
select * from Booking
where payment_method = "upi";
--  7. Retrieve all rides where payment was made using UPI:
select * from payment_made_using_UPI;

--  8. Find the average customer rating per vehicle type:
create view average_customer_rating_per_vehicle as
select vehicle_type, avg(Customer_Rating)as average_customer_rating 
from Booking
Group by vehicle_type;
--  8. Find the average customer rating per vehicle type:
select * from average_customer_rating_per_vehicle;

--  9. Calculate the total booking value of rides completed successfully:
create view total_successful_rides as
select sum(booking_value) as total_successful_value
from Booking
where Booking_status = "success";
--  9. Calculate the total booking value of rides completed successfully:
select * from total_successful_rides;

--  10. List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason
from Booking 
where Incomplete_Rides = "yes";
--  10. List all incomplete rides along with the reason:
select * from Incomplete_Rides_Reason;