## Download Database: https://www.mysqltutorial.org/wp-content/uploads/2018/03/mysqlsampledatabase.zip

## 1.Find out employee names who belongs to NYC, Paris and Tokyo

select e.lastName, e.officecode, city from employees e inner join offices o on e.officecode=o.officecode 
where city in ("NYC","Paris","Tokyo");

## 2.Extract full name of employee employee who lives in USA and France

select concat(firstname, " ",lastName) as Employee_name, city, country from employees e inner join offices o on e.officecode=o.officecode where country="USA" or country="France"; 	

## 3.Find count of employees from each city with ascending order

select city, count(*) from offices group by city order by city desc;

## 4.Report the account representative for each customer?

select customerName,employeeNumber as Account_reps  from customers c inner join employees e
on c.salesRepEmployeeNumber=e.employeeNumber;

## 5.Report the account representative name, designation and employee id for each customer?

select customerName,concat(firstName," ",lastName) as Account_reps_name,jobTitle , employeeNumber as Account_reps  from customers c inner join employees e
on c.salesRepEmployeeNumber=e.employeeNumber;

## 6.Report total payments for Atelier graphique

Select customername, sum(amount) as Total_payment from payments p inner join customers c
on p.customerNumber=c.customerNumber;

## 7.Report total payments for Petit Auto which are above 5000

Select customername, sum(amount) as Total_payment from payments p inner join customers c
on p.customerNumber=c.customerNumber
where c.customerName="Petit Auto" and amount>5000;

## 8.Report the total payments by Date

select paymentDate,sum(amount) as Total_amount from payments
group by paymentDate order by paymentDate asc;

## 9.Find out the products which are not sold

SELECT * from products where not exists ( select * from orderdetails where products.productCode=orderdetails.productCode);

## 10.Extract list of customer with their total payments

select customerName, sum(amount) from payments p inner join customers c
on p.customerNumber=c.customerNumber
group by customerName;
