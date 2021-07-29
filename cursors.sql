
SELECT BillingCountry,BillingState,Total FROM Chinook.Invoice


## Method 1
DROP PROCEDURE IF EXISTS sp_tmp_cursor;

CREATE PROCEDURE sp_tmp_cursor ()
BEGIN
	DECLARE is_last_row INTEGER DEFAULT 0;
	
	DECLARE c_state,c_country varchar(100) DEFAULT "";
	
	DECLARE c_total decimal(10,2);
	
	DECLARE tax decimal(10,2);
	    
	    -- declare cursor for employee email
	DECLARE cur_inv CURSOR FOR SELECT BillingCountry,BillingState,Total FROM Chinook.Invoice limit 4;
	    
	    -- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_last_row = 1;
	
	OPEN cur_inv;
	    WHILE is_last_row <> 1 DO
	        FETCH cur_inv INTO c_country,c_state,c_total;
	
	        if c_country = 'USA' then
	            if c_state != 'CA' then
	                set tax = c_total * 0.07;
	            else
	                set tax = c_total * 0.10;
	            end if;
	        else
	            if c_total > 1 then
	                set tax = c_total * 0.05;
	            else
	                set tax = 0;
	            end if;
	        end if;
	        
	        select c_country,c_state,c_total,tax;
	        
	    END WHILE;
	CLOSE cur_inv;
END

CALL sp_tmp_cursor



## Method 2
DROP PROCEDURE IF EXISTS sp_tmp_cursor2;

CREATE PROCEDURE sp_tmp_cursor2 ()
BEGIN
    DECLARE is_last_row INTEGER DEFAULT 0;
    DECLARE c_state,c_country varchar(100) DEFAULT "";
    DECLARE c_total decimal(10,2);
    DECLARE tax decimal(10,2);
    DECLARE name_list varchar(200) DEFAULT "";
        
        -- declare cursor for employee email
    DECLARE cur_inv CURSOR FOR SELECT BillingCountry,BillingState,Total FROM Chinook.Invoice;
        
        -- declare NOT FOUND handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_last_row = 1;

    Create temporary table tmpResult (country varchar(30), state varchar(30), total decimal(10,2), tax decimal(10,2));

    OPEN cur_inv;
        WHILE is_last_row <> 1 DO
            FETCH cur_inv INTO c_country,c_state,c_total;

            if c_country = 'USA' then
                if c_state != 'CA' then
                    set tax = c_total * 0.07;
                else
                    set tax = c_total * 0.10;
                end if;
            else
                if c_total > 1 then
                    set tax = c_total * 0.05;
                else
                    set tax = 0;
                end if;
            end if;
            
            insert into tmpResult
            select c_country,c_state,c_total,tax;
            
        END WHILE;
    CLOSE cur_inv;

    select * from tmpResult;
END


CALL sp_tmp_cursor2



