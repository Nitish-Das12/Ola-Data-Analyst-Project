CREATE DATABASE Ola;
use Ola;

CREATE TABLE bookings (
    Date DATE,
    Time TIME,
    Booking_ID VARCHAR(50),
    Booking_Status VARCHAR(20),
    Customer_ID VARCHAR(50),
    Vehicle_Type VARCHAR(30),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    V_TAT FLOAT,
    C_TAT FLOAT,
    Canceled_Rides_by_Customer VARCHAR(5), 
    Canceled_Rides_by_Driver VARCHAR(5),  
    Incomplete_Rides VARCHAR(5),           
    Incomplete_Rides_Reason VARCHAR(100),
    Booking_Value INT,
    Payment_Method VARCHAR(20),
    Ride_Distance INT,
    Driver_Ratings FLOAT,
    Customer_Rating FLOAT,
    Vehicle_Images VARCHAR(255) 
);

              
select  * from bookings;

#1. Retrieve all successful bookings:
 
CREATE OR REPLACE VIEW successful_bookings AS
SELECT * 
FROM bookings
WHERE Booking_status = 'success';
 
 SELECT * FROM successful_bookings;
 
#2. Find the average ride distance for each vehicle type:
 
 CREATE OR REPLACE VIEW ride_distance_for_each_vehicle AS
 SELECT 
	DISTINCT Vehicle_Type , 
	AVG(Ride_Distance)
 FROM bookings
 GROUP BY Vehicle_type;
 
 SELECT * FROM ride_distance_for_each_vehicle;
 
#3. Get the total number of cancelled rides by customers:
 
 CREATE OR REPLACE VIEW cancelled_rides_by_customers AS
 SELECT COUNT(*)
 FROM bookings
 WHERE Booking_Status = 'Canceled by Customer';
 
 SELECT * FROM cancelled_rides_by_customers; 
 
 
#4. List the top 5 customers who booked the highest number of rides:
 
 CREATE OR REPLACE VIEW top_5_customers AS
 SELECT Customer_ID ,
        COUNT(Booking_ID) AS  total_riders 
FROM bookings
GROUP BY Customer_ID
ORDER BY total_riders DESC LIMIT 5;        
 
 SELECT * FROM top_5_customers;
 
 
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
  
CREATE OR REPLACE VIEW driver_cancel_rides_personal_car_issues AS
SELECT COUNT(*) 
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
  
SELECT * FROM driver_cancel_rides_personal_car_issues;
  
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 
 CREATE OR REPLACE VIEW max_and_min_dri_rat_prime_sedan AS
 SELECT MAX(Driver_Ratings) AS max_rat,
 MIN(Driver_Ratings) AS min_rat
 FROM bookings
 WHERE Vehicle_Type = 'Prime Sedan';
 
 SELECT * FROM max_and_min_dri_rat_prime_sedan;
 
 #7. Retrieve all rides where payment was made using UPI:
 
 CREATE OR REPLACE VIEW payment_UPI AS
 SELECT count(*)
 FROM bookings
 WHERE Payment_Method = 'UPI';
 
 SELECT * FROM payment_UPI;
 
 #8. Find the average customer rating per vehicle type:
 
 CREATE OR REPLACE VIEW avg_customer_rat_per_vehicle_type AS
 SELECT 
      AVG(Customer_rating) AS avg_rat,
      Vehicle_Type
FROM bookings
GROUP BY 2
ORDER BY avg_rat DESC ;
 
SELECT * FROM  avg_customer_rat_per_vehicle_type;
 
 #9. Calculate the total booking value of rides completed successfully:
 
 SELECT SUM(Booking_Value) as total_sucessful_value
 FROM bookings
 WHERE Booking_Status = 'Success';
 
 #10. List all incomplete rides along with the reason:
 
 CREATE OR REPLACE VIEW incomplete_rides AS
  SELECT Booking_ID,
		Incomplete_Rides_Reason
 from bookings
 where Incomplete_Rides = 'Yes';
 
 SELECT * FROM incomplete_rides;
 
 
 
 
 

