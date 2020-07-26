CREATE DATABASE IF NOT EXISTS howtovids; -- We create the database if it does not exists

-- Video Table
CREATE TABLE `Videos` (
  `Video_Id` int(255) NOT NULL,
  `Video_Title` varchar(255) NOT NULL,
  `Video_Description` varchar(255) NOT NULL,
  `Video_URL` varchar(255) NOT NULL,
  `Video_Length` datetime NOT NULL
); 

-- Review Table
CREATE TABLE `Reviews` (
  `Review_Id` int(255) NOT NULL,
  `Review_UserName` varchar(64) NOT NULL,
  `Review_Rating` enum('0','1','2','3','4','5') DEFAULT NULL,
  `Review_ShortText` enum('Loved it!','Liked it.','It''s okay.','Don''t like it.','Hated it!') NOT NULL,
  `Reviews_Video_Id` int(255) NOT NULL
);

-- We create a Primary Key constraint in Reviews table for the column name Review_Id and assign a key to Review_Video_Id to be used a medium for a foreign key
ALTER TABLE `Reviews`
  ADD PRIMARY KEY (`Review_Id`),
  ADD KEY `Reviews_fk_Videos` (`Reviews_Video_Id`);

-- We create a Primary Key constraint in Videos table for the column name Video_Id
ALTER TABLE `Videos`
  ADD PRIMARY KEY (`Video_Id`);

-- We alter the accounts table by modifying its field name (Review_Id) and add auto incrementation to allow unique numbers to be generated when a new record is inserted into the table 
ALTER TABLE `Reviews`
  MODIFY `Review_Id` int(255) NOT NULL AUTO_INCREMENT;

-- We alter the accounts table by modifying its field name (Review_Id) and add auto incrementation to allow unique numbers to be generated when a new record is inserted into the table 
ALTER TABLE `Videos`
  MODIFY `Video_Id` int(255) NOT NULL AUTO_INCREMENT;

-- We alter the Reviews table to add the foreign key constraint with its constraint name Reviews_FK_Videos
ALTER TABLE `Reviews`
  ADD CONSTRAINT `Reviews_fk_Videos` FOREIGN KEY (`Reviews_Video_Id`) REFERENCES `Videos` (`Video_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Insert records into our Videos table related to its field names
INSERT INTO `Videos` (`Video_Title`, `Video_Description`, `Video_URL`, `Video_Length`) VALUES
('Find Eigenvalues and Eigenvectors of a 2x2 Matrix', 'We work through two methods of finding the characteristic equation for λ, then use this to find two eigenvalues. We use Ax=λx to calculate two eigenvectors, then look at a visualisation.', 'http://www.youtube.com/watch?v=tXlMbAxbUI4', '2016-02-23 18:36:00'),
('How to Factor any Quadratic Equation', 'How to factor anything with x squared in it.', 'http://www.youtube.com/watch?v=ZQ-NRsWhOGI', '2011-09-12 09:37:00'),
('How to calculate the singular values of a matrix', 'In this video you will learn how to calculate the singular values of a matrix by finding the eigenvalues of A transpose A.  We will also do a worked example to show you how it is done.', 'http://www.youtube.com/watch?v=4g-zS32oKEw', '2018-07-14 03:20:00'),
('Make Your Own Raycaster Game', 'I\'m happy to share my raycaster video with you! I hope you learn something, or find it interesting and stay tuned for more fun videos! ', 'https://www.youtube.com/watch?v=gYRrGTC7GtA&t=201s', '2020-03-13 16:51:00'),
('FIRST PERSON MOVEMENT in Unity - FPS Controller', 'Let\'s see how to get an FPS Character Controller up and running in no time!\r\n\r\n', 'https://www.youtube.com/watch?v=_QajrabyTJc', '2019-10-27 23:52:00');

-- Insert records into our Reviews table related to its field names
INSERT INTO `Reviews` (`Review_UserName`, `Review_Rating`, `Review_ShortText`, `Reviews_Video_Id`) VALUES
('Avocado Pirate', '5', 'Loved it!', 1),
('John Richards', '5', 'Loved it!', 1),
('Zhang Dave', NULL, 'Loved it!', 2),
('Velez Darlene', '3', 'It\'s okay.', 3),
('Suzie Mahase', '5', 'Loved it!', 3),
('Levin Michael', NULL, 'It\'s okay.', 3),
('Alexis Santos', '4', 'Liked it.', 3),
('Dave Seliger', '1', 'Don\'t like it.', 2),
('Robles Jessica', '2', 'Hated it!', 2),
('Rodriquez Bianca', '3', 'It\'s okay.', 2),
('John Wick', '0', 'Hated it!', 2),
('Matt Booty', '3', 'It\'s okay.', 4),
('Tim Cook', '2', 'Hated it!', 5),
('Jane Doe', '5', 'Loved it!', 4),
('Bill Gates', '5', 'Loved it!', 2),
('John Doe', '3', 'It\'s okay.', 5);
