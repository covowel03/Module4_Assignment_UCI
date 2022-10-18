
-- Notice that the user can choose only one story for the FavoriteStory (his favorite one)

CREATE DATABASE storydatabase;

create user marty with password 'mypass';

\c storydatabase;

CREATE SCHEMA storyschema;

CREATE TABLE storyschema.Stories(
   StoryID SERIAL,
   Name VARCHAR(50) NOT NULL,
   Pages INT NOT NULL,
   Author VARCHAR(50) NOT NULL,
   ReleaseDate DATE NOT NULL,
   PRIMARY KEY(StoryID),
   UNIQUE(Name)
);

CREATE TABLE storyschema.OnlineUser(
   UserID SERIAL,
   Username VARCHAR(50) NOT NULL,
   Password VARCHAR(50) NOT NULL,
   Firstname VARCHAR(50) NOT NULL,
   Lastname VARCHAR(50) NOT NULL,
   Birthday DATE NOT NULL,
   PRIMARY KEY(UserID)
);

-- Here, the user can post a comment for everybody about the story
CREATE TABLE storyschema.Comment(
   CommentID SERIAL,
   PublishedDate TIMESTAMP NOT NULL,
   NumberLike INT NOT NULL,
   Message TEXT NOT NULL,
   UserID INT NOT NULL,
   StoryID INT NOT NULL,
   PRIMARY KEY(CommentID),
   FOREIGN KEY(UserID) REFERENCES storyschema.OnlineUser(UserID),
   FOREIGN KEY(StoryID) REFERENCES storyschema.Stories(StoryID)
);

-- Here, the user can choose only one story (his favorite one). Moreover, he can also add a comment on why he chooses the story
CREATE TABLE storyschema.FavoriteStory(
   FavoriteID SERIAL,
   CreationDate TIMESTAMP NOT NULL,
   Comment TEXT,
   UserID INT NOT NULL,
   StoryID INT NOT NULL,
   PRIMARY KEY(FavoriteID),
   UNIQUE(UserID),
   FOREIGN KEY(UserID) REFERENCES storyschema.OnlineUser(UserID),
   FOREIGN KEY(StoryID) REFERENCES storyschema.Stories(StoryID)
);

ALTER TABLE storyschema.Stories
ADD CONSTRAINT ck_NumberPagesMin CHECK (Pages >= 0);