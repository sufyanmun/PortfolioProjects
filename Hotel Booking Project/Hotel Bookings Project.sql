-- Calculates the Revenue by adding the stays and multiplying it by the average daily rate (ADR)
SELECT (stays_in_week_nights+stays_in_weekend_nights)*adr AS Revenue FROM travel_booking_data

-- Revenue per year for each hotel type sorted by year
SELECT arrival_date_year AS Year, hotel AS Hotel_Type, SUM((stays_in_week_nights+stays_in_weekend_nights)*adr) AS Revenue
FROM travel_booking_data WHERE hotel IS NOT NULL GROUP BY arrival_date_year, hotel ORDER BY Year;

-- Shows the busiest month ranked by number of bookings
SELECT DISTINCT COUNT(*) AS Number_of_bookings, arrival_date_month FROM travel_booking_data 
WHERE is_canceled ="0" GROUP BY arrival_date_month ORDER BY Number_of_bookings DESC;


