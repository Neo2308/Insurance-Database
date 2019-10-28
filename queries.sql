update Calim_Details set Damage=? where Claim_Id=?;
select * from Claim_Detail where Claim_Id="+claim_id";
select * from Claim_Details where Policy_Number=?;
select * from Claim_Details where Customer_Id=?;

select Customer_Id from Claim_Details where Claim_Id=?;
select Policy_Number from Claim_Details where Claim_Id=?;
update Claim_Details set Status=1-Status where Claim_Id="+p+";
update Claim_Details set Damage='"+p.getDamage()+"',Status='"+p.getStatus()+"',Date='"+p.getDate()+"',Policy_Number="+p.getPolicy_Number()+",Customer_Id="+p.getCustomer_Id()+" where Claim_Id="+p.getClaim_Id()+";
delete from Claim_Details where Claim_Id="+c+";
insert into Claim_Details(Damage,Status,Date,Policy_Number,Customer_Id) values('"+p.getDamage()+"','"+p.getStatus()+"',curdate(),"+p.getPolicy_Number()+","+p.getCustomer_Id()+ ";

select * from Assets as a where a.Asset_Id in " +
            "( select Asset_Id from Customer_Policies where date_of_expire >= CURDATE() and Customer_Id=?);
select * from Assets where Asset_ID NOT IN  (select Asset_Id from Customer_Policies where date_of_expire>curdate() and Customer_Id=?) and Customer_Id=?;
select * from Customer_Policies;
select * from Customer_Policies where Customer_Id=?;
update Customer_Policies set date_of_expire=subdate(curdate(),1) where Asset_Id=?;
select Policy_Number from Customer_Policies where Customer_Id=? and Asset_Id=? and date_of_expire>curdate();
select * from Customer_Email_Id where Customer_Id=?;
delete from Customer_Email_Id where Customer_Id="+id+" and Email_Id;
insert into Customer_Email_Id(Email_Id,Customer_Id) values('"+p.getEmail_Id()+"',"+p.getCustomer_Id()+");  
    -- // System.out.print(sql);getEmail_Id 
select Type from Employee_type where Identification=?
select Salary from Employee_type where Identification=?;
insert into Employee_type(Type,Salary) values('"+p.getType()+"',"+p.getSalary()+");
