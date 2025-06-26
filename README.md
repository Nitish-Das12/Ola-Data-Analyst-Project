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
























