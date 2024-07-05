/* ข้อ 5 ใช้ยีน SQL เพื่อค้นหาหุ้นที่สี่และห้าอันดับแรกในปี 2016 โดยพิจารณาจากผลรวมของตัวเลข
(ปริมาณใน order_details) ผลลัพธ์ที่ต้องการคือ product_name ผลรวมของจำนวนคำสั่งซื้อ
สินค้าวันนี้ในปี 2016
ผลลัพธ์
    2016
Gorgonzola Telino  	444
Camembert Pierrot   370
Steeleye Stout      274
Chartreuse verte    266
lotemysost          261

*/

select products.product_name,sum(order_details.quantity) as total_quantity  
FROM	order_details  
inner join  orders  on  order_details.order_id =   orders.order_id
inner join products on  order_details.product_id = products.product_id
WHERE YEAR(orders.order_date) = 2016
GROUP BY products.product_name 
ORDER BY total_quantity DESC
LIMIT 5;



/*
ถ้าเราเปลี่ยน ปี เป็น 2017
    2017
Gnocchi di nonna Alice  971
Raclette Courdavault    752
Camembert Pierrot       665
Gorgonzola Telino       656
Rhönbräu Klosterbier    630



*/
select products.product_name,sum(order_details.quantity) as total_quantity  
FROM	order_details  
inner join  orders  on  order_details.order_id =   orders.order_id
inner join products on  order_details.product_id = products.product_id
WHERE YEAR(orders.order_date) = 2017
GROUP BY products.product_name 
ORDER BY total_quantity DESC
LIMIT 5;
