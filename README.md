# Ola-Data-Analyst-Project-Using-PostgreSQL
![Ola Logo](https://github.com/Nitish-Das12/Ola-Data-Analyst-Project/blob/main/ola%20dastboard%20ss.png)

## 📌 Overview

The **Ola Data Analyst Project** is a real-world case study that involves analyzing 20,000 ride booking records from a simulated Ola dataset using **PostgreSQL** and **Power BI**. The goal is to extract key business insights such as ride volume patterns, cancellation reasons, customer and driver behavior, and revenue trends.

This project demonstrates how SQL and visualization tools can be combined to support decision-making in the ride-hailing industry.

---

### 🔍 Project Objectives:

- Analyze ride booking data to understand success and cancellation rates
- Measure customer and driver ratings by vehicle type
- Identify top-performing customers and high-revenue vehicle segments
- Visualize trends using Power BI for stakeholders


### 🧱 Database Schema
This project uses a single table bookings that captures all ride-related data, including status, customer/driver behavior, and financials. Below is the schema definition used in PostgreSQL:

```sql
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
```
## 🧰 Tools Used

- **SQL (MySQL/PostgreSQL)**: Data aggregation and KPIs
- **Power BI**: Data visualization
- **Excel/CSV**: Raw data
- **Canva/PPT**: Reporting visuals

## ❓ SQL Questions

#1. Retrieve all successful bookings:

```sql
CREATE OR REPLACE VIEW successful_bookings AS
SELECT * 
FROM bookings
WHERE Booking_status = 'success';

```

#2. Find the average ride distance for each vehicle type:

```sql
 CREATE OR REPLACE VIEW ride_distance_for_each_vehicle AS
 SELECT 
	DISTINCT Vehicle_Type , 
	AVG(Ride_Distance)
 FROM bookings
 GROUP BY Vehicle_type;
 
 SELECT * FROM ride_distance_for_each_vehicle;

```

#3. Get the total number of cancelled rides by customers:

```sql
 CREATE OR REPLACE VIEW cancelled_rides_by_customers AS
 SELECT COUNT(*)
 FROM bookings
 WHERE Booking_Status = 'Canceled by Customer';
 
 SELECT * FROM cancelled_rides_by_customers; 

```

#4. List the top 5 customers who booked the highest number of rides:

```sql
 CREATE OR REPLACE VIEW top_5_customers AS
 SELECT Customer_ID ,
        COUNT(Booking_ID) AS  total_riders 
FROM bookings
GROUP BY Customer_ID
ORDER BY total_riders DESC LIMIT 5;        
 
 SELECT * FROM top_5_customers;

```
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:

```sql
CREATE OR REPLACE VIEW driver_cancel_rides_personal_car_issues AS
SELECT COUNT(*) 
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
  
SELECT * FROM driver_cancel_rides_personal_car_issues;

  ```
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

```sql

 CREATE OR REPLACE VIEW max_and_min_dri_rat_prime_sedan AS
 SELECT MAX(Driver_Ratings) AS max_rat,
 MIN(Driver_Ratings) AS min_rat
 FROM bookings
 WHERE Vehicle_Type = 'Prime Sedan';
 
 SELECT * FROM max_and_min_dri_rat_prime_sedan;

```

#7. Retrieve all rides where payment was made using UPI:

```sql
 CREATE OR REPLACE VIEW payment_UPI AS
 SELECT count(*)
 FROM bookings
 WHERE Payment_Method = 'UPI';
 
 SELECT * FROM payment_UPI;

```

#8. Find the average customer rating per vehicle type:

```sql

 CREATE OR REPLACE VIEW avg_customer_rat_per_vehicle_type AS
 SELECT 
      AVG(Customer_rating) AS avg_rat,
      Vehicle_Type
FROM bookings
GROUP BY 2
ORDER BY avg_rat DESC ;
 
SELECT * FROM  avg_customer_rat_per_vehicle_type;

```

#9. Calculate the total booking value of rides completed successfully:

```sql

 SELECT SUM(Booking_Value) as total_sucessful_value
 FROM bookings
 WHERE Booking_Status = 'Success';
 ```
#10. List all incomplete rides along with the reason:

```sql

 CREATE OR REPLACE VIEW incomplete_rides AS
  SELECT Booking_ID,
		Incomplete_Rides_Reason
 from bookings
 where Incomplete_Rides = 'Yes';
 
 SELECT * FROM incomplete_rides;
```

### 🧾 Key Takeaways:

📊 62% of total bookings were successfully completed, showcasing a healthy operational rate.

🚫 Cancellations were maintained within optimal limits:

<7% by customers

<18% by drivers

🚗 Prime Sedan and Prime Plus had the highest average ratings, making them preferred vehicle types.

📈 Higher ride volumes and booking values were observed on weekends and match days.

💬 Cancellation reasons, customer and driver ratings, and booking values offer deep insights into user behavior and operational efficiency.

### 🎯 Business Value:

By integrating SQL for structured analysis and Power BI for visualization, stakeholders can:

Optimize vehicle allocation and driver performance

Reduce cancellation rates through behavior analysis

Improve customer satisfaction using feedback and rating data

Make data-backed marketing and operational decisions
















