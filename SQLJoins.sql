
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

SELECT P.NAME, C.NAME FROM BESTBUY.PRODUCTS P 
 JOIN BESTBUY.CATEGORIES C 
 ON C.CATEGORYID= P.CATEGORYID AND C.CATEGORYID=1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT P.NAME, P.PRICE, R.RATING FROM BESTBUY.PRODUCTS P 
JOIN BESTBUY.REVIEWS  R 
ON R.PRODUCTID= R.REVIEWID WHERE R.RATING=5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT E.FIRSTNAME, E.LASTNAME,SUM(S.QUANTITY) FROM BESTBUY.EMPLOYEES E  
JOIN BESTBUY.SALES S 
ON E.EMPLOYEEID = S.EMPLOYEEID 
GROUP BY S.EMPLOYEEID 
ORDER BY SUM(S.QUANTITY) DESC LIMIT 2 ;

/* joins: find the name of the department, and the name of the category for Appliances and Games */

SELECT D.NAME AS "DEPARTMENT NAME", C.NAME AS "CATEGORY NAME" FROM BESTBUY.DEPARTMENTS D 
JOIN BESTBUY.CATEGORIES C
 ON C.DEPARTMENTID= D.DEPARTMENTID 
 WHERE C.NAME = "APPLIANCES" OR C.NAME= "GAMES";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT  P.NAME, SUM(S.QUANTITY) AS "TOTAL", SUM(S.PRICEPERUNIT) *SUM(S.QUANTITY)  AS "TOTAL PRICE SOLD" 
 FROM BESTBUY.PRODUCTS P 
 INNER JOIN BESTBUY.SALES S ON S.PRODUCTID=P.PRODUCTID  
 WHERE P.NAME = 'Eagles: Hotel California' ;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT P.NAME, R.REVIEWER, R.RATING,R.COMMENT FROM BESTBUY.PRODUCTS P 
INNER JOIN BESTBUY.REVIEWS R
ON P.PRODUCTID =R.PRODUCTID 
WHERE R.RATING =1 AND P.NAME="VISIO TV";

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */

SELECT E.EMPLOYEEID, E.FIRSTNAME, E.LASTNAME,P.NAME AS PRODUCT_NAME , SUM(S.QUANTITY) AS QUANTITY_SOLD
FROM BESTBUY.SALES S 
INNER JOIN BESTBUY.EMPLOYEES E 
ON S.EMPLOYEEID= E.EMPLOYEEID 
INNER JOIN BESTBUY.PRODUCTS P 
ON P.PRODUCTID=S.PRODUCTID 
GROUP BY E.EMPLOYEEID, E.FIRSTNAME,E.LASTNAME,P.NAME
ORDER BY QUANTITY_SOLD DESC;




