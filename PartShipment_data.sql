insert into Supplier values ('S1','Smith','20','London')
insert into Supplier values ('S2','Jones','10','Paris')
insert into Supplier values ('S3','Blake','30','Paris')
insert into Supplier values ('S4','Clark','20','London')
insert into Supplier values ('S5','Adams','30','Athens')


Insert  into Part  values  ( 'P1' , 'Nut' , 'Red' , 12.0 , 'London')
Insert  into Part  values  ( 'P2' , 'Bolt' , 'Green', 17.0 , 'Paris')
Insert  into Part  values  ( 'P3' , 'Screw' , 'Blue', 17.0 , 'Oslo')
Insert  into Part  values  ( 'P4' , 'Screw' , 'Red' , 14.0 , 'London')
Insert  into Part  values  ( 'P5' , 'Cam' , 'Blue' , 12.0 , 'Paris')
Insert  into Part  values  ( 'P6' , 'Cog' , 'Red' , 19.0 , 'London')



Insert into Shipment values ('S1','P1',300)
Insert into Shipment values ('S1','P2',200)
Insert into Shipment values ('S1','P3',400)
Insert into Shipment values ('S1','P4',200)
Insert into Shipment values ('S1','P5',100)
Insert into Shipment values ('S1','P6',100)
Insert into Shipment values ('S2','P1',300)
Insert into Shipment values ('S2','P2',400)
Insert into Shipment values ('S3','P2',200)
Insert into Shipment values ('S4','P2',200)
Insert into Shipment values ('S4','P4',300)
Insert into Shipment values ('S4','P5',400)

select * from Shipment
