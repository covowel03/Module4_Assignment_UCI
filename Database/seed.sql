INSERT INTO storyschema.Stories (StoryID,Name,Pages,Author,ReleaseDate) VALUES 
(1010,'The Lion and the Mouse',1,'Jean de La Fontaine','1668/01/01'),
(1011,'The Raven and the Fox',1,'Jean de La Fontaine','1668/02/10'),
(1012,'The Grasshopper and the Ant',1,'Jean de La Fontaine','1668/09/15'),
(1013,'Harrison Bergeron',6,'Kurt Vonnegut','1961/10/10');

INSERT INTO storyschema.OnlineUser (UserID,Username,Firstname,Lastname,Birthday) VALUES 
(001007799,'covowel03','Marty','EVUORT','2002/03/30'),
(001009099,'VILL V','Ryan','SEBBANE','2002/05/29'),
(001009100,'MGN','Morgan','SENECHAL','2002/07/24');

INSERT INTO storyschema.Comment (CommentID,PublishedDate,NumberLike,Message,UserID,StoryID) VALUES 
(10,CURRENT_TIMESTAMP,1000,'Very funny ! It made me laugh a lot xD',001007799,1011),
(11,CURRENT_TIMESTAMP,1101,'Very good story with an excellent moral',001007799,1010),
(12,CURRENT_TIMESTAMP,1050,'Sadge for the Grasshopper',001009099,1012);

-- Notice that the user can choose only one story for the FavoriteStory (his favorite one)
INSERT INTO storyschema.FavoriteStory (FavoriteID,CreationDate,Comment,UserID,StoryID) VALUES 
(1,CURRENT_TIMESTAMP,'It is my favorite story because the height is not proportional to the usefulness',001007799,1010),
(2,CURRENT_TIMESTAMP,NULL,001009099,1011);
