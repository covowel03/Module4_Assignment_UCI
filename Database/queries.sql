-- To show the list of all comments with all information about them
SELECT Stories.Name AS Story, OnlineUser.Username AS User, Comment.Message, Comment.PublishedDate AS "Publication Date", Comment.NumberLike AS "Number Of Likes"
FROM storyschema.Comment AS Comment
INNER JOIN storyschema.Stories AS Stories ON Stories.StoryID = Comment.StoryID
INNER JOIN storyschema.OnlineUser AS OnlineUser ON OnlineUser.UserID = Comment.UserID;

-- To show the information of all users' profiles
SELECT * FROM storyschema.OnlineUser;

-- To list all the stories
SELECT Stories.Name AS Stories FROM storyschema.Stories;

-- To list all the stories written by Kurt Vonnegut
SELECT Stories.Name AS "Stories written by Kurt Vonnegut" FROM storyschema.Stories
WHERE Stories.Author like 'Kurt Vonnegut';

-- To list all the users who have already commented on the website
SELECT DISTINCT OnlineUser.Username AS "Users who have already commented on the website" FROM storyschema.OnlineUser AS OnlineUser
INNER JOIN storyschema.Comment AS Comment ON Comment.UserID = OnlineUser.UserID;

-- To list all the users who have never commented on the website
SELECT DISTINCT OnlineUser.Username AS "Users who have never commented on the website" FROM storyschema.OnlineUser AS OnlineUser
EXCEPT
SELECT DISTINCT OnlineUser.Username FROM storyschema.OnlineUser AS OnlineUser
INNER JOIN storyschema.Comment AS Comment ON Comment.UserID = OnlineUser.UserID;

-- To list all the users who published their favorite story
SELECT DISTINCT OnlineUser.Username AS "Users who published their favorite story" FROM storyschema.FavoriteStory AS FavoriteStory
INNER JOIN storyschema.OnlineUser AS OnlineUser ON OnlineUser.UserID = FavoriteStory.UserID;

-- To list all the users who wrote a comment on their favorite story
SELECT DISTINCT OnlineUser.Username AS "Users who wrote a comment on their favorite story" FROM storyschema.FavoriteStory AS FavoriteStory
INNER JOIN storyschema.OnlineUser AS OnlineUser ON OnlineUser.UserID = FavoriteStory.UserID 
WHERE FavoriteStory.Comment IS NOT NULL;

-- To list all the users who did not write a comment on their favorite story but publish their favorite story
SELECT DISTINCT OnlineUser.Username AS "Users who did not write a comment on their favorite story" FROM storyschema.FavoriteStory AS FavoriteStory
INNER JOIN storyschema.OnlineUser AS OnlineUser ON OnlineUser.UserID = FavoriteStory.UserID 
WHERE FavoriteStory.Comment IS NULL;

