SELECT videos.Video_Id, videos.Video_Title as 'Video Title', videos.Video_Description as Description, videos.Video_URL AS URL, TIME_FORMAT(video_Length, "%H:%I") AS 'Video Length', 
reviews.Review_Id, reviews.Review_UserName AS Reviewer, CONCAT(reviews.Review_Rating, " Stars") AS Rating, reviews.Review_ShortText AS Review, reviews.Reviews_Video_Id as VideoFK
FROM howtovids.videos
RIGHT JOIN howtovids.reviews -- Right join used to display all reviews associated with videos on the Left table
ON videos.video_Id = reviews.Review_Id;