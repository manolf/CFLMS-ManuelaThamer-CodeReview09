--deliveryhistory of item 4:
select *
from deliverydetails
where deliverydetails.itemID = 4;


-- which employees work at Delivery3?
select employee.firstname, employee.lastname
from station
inner join employee on employee.stationID = station.stationID
where station.name = "Delivery3"

--how many letters and packages have been dropped of?
select item.medium, count(item.itemID) as "amount of items"
from item
group by item.medium


-- How many drop-ofs by station?
select count(itemID),station.name, address.Street, address.Zipcode, address.city
from item
inner join customer on customer.customerID = item.customerID
inner join station on station.stationID = item.stationID
inner join address on address.addressID = station.addressID
group by station.stationID



--the items of which customers are right now in the distribution process and to what station?
select customer.firstname, customer.lastname, item.medium, item.itemID, packageset.setID, station.name
from deliverydetails
inner join item on item.itemID = deliverydetails.itemID
inner join packagedetail on packagedetail.itemID = item.itemID
inner join packageset on packageset.setID = packagedetail.setID
inner join customer on customer.customerID = item.itemID
inner join station on station.stationID = packageset.stationID


-- when and in which packageset was item 3 handed over to which employee?
select item.itemID, deliverydetails.HandOverDate, packageset.setID, employee.firstname, employee.lastname
from deliverydetails
inner join item on item.itemID = deliverydetails.itemID
inner join packagedetail on packagedetail.itemID = item.itemID
inner join packageset on packageset.setID = packagedetail.setID
inner join shipping on shipping.setID = packageset.setID
inner join employee on employee.employeeID = shipping.employeeID
where item.itemID = 3











