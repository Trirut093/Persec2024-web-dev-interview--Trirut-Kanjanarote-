/*
อยากทราบข่อมูลยอดขายรายปีทั้งหมดที่ส่ง(ship_region) ไปยัง  Western Europe โดยยอดรวมต้องหักdiscount ใน order_details

    ปี               ยอดขาย
    2016        3925.9500000000003
    2017        10031.150000000003
    2018        6299.750000000002

*/

SELECT 
    YEAR(o.order_date) AS order_year,
    SUM( (od.quantity - od.discount)) AS total_sales
FROM order_details od
INNER JOIN orders o ON od.order_id = o.order_id

WHERE o.ship_region IN ('Western Europe')  
GROUP BY YEAR(o.order_date)
ORDER BY order_year;


/*
ถ้าเราเปลี่ยน  o.ship_region IN ('Western Europe')  เป็น  North America	

    ปี               ยอดขาย
    2016        1831.3000000000002
    2017        5874.9000000000015
    2018        3582.0599999999995

*/

SELECT 
    YEAR(o.order_date) AS order_year,
    SUM( (od.quantity - od.discount)) AS total_sales
FROM order_details od
INNER JOIN orders o ON od.order_id = o.order_id

WHERE o.ship_region IN ('North America')  
GROUP BY YEAR(o.order_date)
ORDER BY order_year;
