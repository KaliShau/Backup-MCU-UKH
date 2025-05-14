ALTER TABLE #__chronoforms8 ADD created datetime default NULL AFTER alias;
ALTER TABLE #__chronoforms8 ADD parent_id INT AFTER id;
UPDATE #__chronoforms8 SET parent_id = 0 WHERE parent_id IS NULL;
ALTER TABLE #__chronoforms8 MODIFY parent_id INT NOT NULL DEFAULT 0;
ALTER TABLE #__chronoforms8 ADD category VARCHAR(100) default "" AFTER published;