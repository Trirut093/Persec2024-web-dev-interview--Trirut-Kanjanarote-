/*
จากคำถามที่ 5 ให้เขียน SQL เพื่อค้นหาสินค้าขายดี 5 อันดับแรกในปี 2016 และ
ปี 2017 ตามคะแนนปัจจุบันอาจไม่ใช่อันดับ 1 แต่ต้องเป็นอันดับ 1 ทั้งสองปี
ตัวอย่างเช่นเช่น
สินค้าขายดี 5 อันดับแรกในปี 2016 ได้แก่ ส้ม แอปเปิ้ล มะนาว ผักคะน้า และมะละกอ
สินค้าขายดี 5 อันดับแรกในปี 2017 ได้แก่ มะนาว กล้วย มะละกอ เงาะ และไทย
คำตอบที่ถูกต้องควรเป็นมะนาวและมะละกอเพราะติด 5 อันดับแรกในทั้งสองปี
ex1
    2016
Gorgonzola Telino  	
Camembert Pierrot   
Steeleye Stout      
Chartreuse verte    
lotemysost          

    2017
Gnocchi di nonna Alice  
Raclette Courdavault
Camembert Pierrot
Gorgonzola Telino
Rhönbräu Klosterbier

ผลลัพธ์ที่ได้
2016-2017 
Camembert Pierrot
Gorgonzola Telino
*/
-- Subquery เพื่อหาสินค้าขายดี 5 อันดับแรกในปี 2016
WITH 
top_2016 AS (
    SELECT 
        products.product_name,
        SUM(order_details.quantity) AS total_quantity  
    FROM order_details  
    INNER JOIN orders ON order_details.order_id = orders.order_id
    INNER JOIN products ON order_details.product_id = products.product_id
    WHERE YEAR(orders.order_date) = 2016
    GROUP BY products.product_name 
    ORDER BY total_quantity DESC
    LIMIT 5
),

-- Subquery เพื่อหาสินค้าขายดี 5 อันดับแรกในปี 2017
top_2017 AS (
    SELECT 
        products.product_name,
        SUM(order_details.quantity) AS total_quantity  
    FROM order_details  
    INNER JOIN orders ON order_details.order_id = orders.order_id
    INNER JOIN products ON order_details.product_id = products.product_id
    WHERE YEAR(orders.order_date) = 2017
    GROUP BY products.product_name 
    ORDER BY total_quantity DESC
    LIMIT 5
)

-- Query เพื่อหาสินค้าที่ติดอันดับ 5 อันดับแรกทั้งสองปี
SELECT 
    t2016.product_name
FROM top_2016 t2016
INNER JOIN top_2017 t2017 ON t2016.product_name = t2017.product_name;


/*
Ex2 
    2017
Gnocchi di nonna Alice  
Raclette Courdavault
Camembert Pierrot
Gorgonzola Telino
Rhönbräu Klosterbier


    2018
Konbu	                        
Guaraná Fantástica	            
Camembert Pierrot	            
Raclette Courdavault	        
Uncle Bob's Organic Dried Pears	


ผลลัพธ์ที่ได้
Raclette Courdavault
Camembert Pierrot

*/
-- Subquery เพื่อหาสินค้าขายดี 5 อันดับแรกในปี 2016
WITH 
top_2017 AS (
    SELECT 
        products.product_name,
        SUM(order_details.quantity) AS total_quantity  
    FROM order_details  
    INNER JOIN orders ON order_details.order_id = orders.order_id
    INNER JOIN products ON order_details.product_id = products.product_id
    WHERE YEAR(orders.order_date) = 2017
    GROUP BY products.product_name 
    ORDER BY total_quantity DESC
    LIMIT 5
),

-- Subquery เพื่อหาสินค้าขายดี 5 อันดับแรกในปี 2017
top_2018 AS (
    SELECT 
        products.product_name,
        SUM(order_details.quantity) AS total_quantity  
    FROM order_details  
    INNER JOIN orders ON order_details.order_id = orders.order_id
    INNER JOIN products ON order_details.product_id = products.product_id
    WHERE YEAR(orders.order_date) = 2018
    GROUP BY products.product_name 
    ORDER BY total_quantity DESC
    LIMIT 5
)

-- Query เพื่อหาสินค้าที่ติดอันดับ 5 อันดับแรกทั้งสองปี
SELECT 
    t2017.product_name
FROM top_2017 t2017
INNER JOIN top_2018 t2018 ON t2017.product_name = t2018.product_name;


