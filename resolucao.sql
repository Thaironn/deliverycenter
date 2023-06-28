/*1: */
 SELECT count(hub_name) Hubs, hub_city City FROM hubs 
 GROUP BY City; 

/*2: */
 SELECT count(order_id) Amount, order_status 'Status' FROM orders 
 GROUP BY order_status; 
  
/*3: */
  
 SELECT * FROM stores 
 LIMIT 10; 
  
 SELECT count(store_id) Amount, h.hub_city City FROM stores s 
 INNER JOIN hubs h on h.hub_id = s.store_id 
 GROUP BY h.hub_city; 
  
  
/*4: */ 
 SELECT MAX(payment_amount) maior, MIN(payment_amount) menor FROM payments

/*5: */
 SELECT driver_type "type", COUNT(delivery_id) deliveries FROM drivers d 
 INNER JOIN deliveries dl on d.driver_id = dl.driver_id 
 GROUP BY driver_type 
 ORDER BY deliveries;
  
/*6: */

 SELECT * FROM DRIVERS; 
 SELECT * FROM DELIVERIES; 
  
 SELECT AVG(delivery_distance_meters) Distance, driver_modal `type` FROM drivers dr 
 INNER JOIN deliveries dl on dl.driver_id = dr.driver_id 
 GROUP BY `type`; 
  
/*7: */
 SELECT * FROM orders; 
 SELECT * FROM stores; 
  
 SELECT store_name Store, AVG(order_amount) amount FROM stores s 
 INNER JOIN orders o on s.store_id = o.store_id 
 GROUP BY s.store_id 
 ORDER BY amount desc; 
  
/*8: */
 SELECT * FROM orders 
 WHERE store_id = null or store_id = 0; 
  
/*9: */
 SELECT * FROM channels; 
 SELECT * FROM orders; 
  
 SELECT SUM(order_amount) amount, channel_name `Name` FROM orders o 
 INNER JOIN channels c on c.channel_id = o.channel_id 
 WHERE o.channel_id = 5; 
  
/*10: */
 SELECT count(order_id) amount FROM orders 
 WHERE order_status like "Canceled"; 
  
/*11: */

 SELECT AVG(order_amount) average FROM orders 
 WHERE order_status like "Canceled"; 
  
/*12: */
 SELECT * FROM payments; 
 SELECT * FROM orders; 
  
 SELECT payment_method method, AVG(order_amount) average FROM payments p 
 INNER JOIN orders o on o.payment_order_id = p.payment_id 
 GROUP BY method 
 ORDER BY average desc; 
  
/*13: */

 SELECT payment_method method, AVG(order_amount) average FROM payments p 
 INNER JOIN orders o on o.payment_order_id = p.payment_id 
 GROUP BY method 
 HAVING average > 100; 
  
  
/*15: */

 SELECT AVG(order_amount) average, hub_state estado_hub, store_segment segmento, channel_type `tipo_canal` FROM orders o 
  
 INNER JOIN stores s on s.store_id = o.store_id 
  
 INNER JOIN hubs h on  h.hub_id = s.hub_id 
  
 INNER JOIN channels c on c.channel_id = o.channel_id 
  
 HAVING average > 450;
