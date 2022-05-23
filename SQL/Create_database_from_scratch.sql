USE master;
ALTER DATABASE Blogs SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE IF EXISTS Blogs;
CREATE DATABASE Blogs;
USE Blogs;

CREATE TABLE Languages (
	Id uniqueidentifier default newid(),
	Name varchar(50) NOT NULL,
	Abbreviation varchar(5) NOT NULL,

	CONSTRAINT PK_Languages_Id PRIMARY KEY CLUSTERED(ID),
	CONSTRAINT UK_Language_Name UNIQUE(Name),
	CONSTRAINT UK_Language_Abbreviation UNIQUE(Abbreviation),
)

CREATE TABLE Topics (
	Id uniqueidentifier default newid(),
	Name varchar(75) NOT NULL,

	CONSTRAINT PK_Topics_Id PRIMARY KEY CLUSTERED(Id),
	CONSTRAINT UK_Topics_Name UNIQUE(Name),
)


CREATE TABLE Users (
	Id uniqueidentifier default newid(),
	Username varchar(50) NOT NULL,
	Email varchar(75) NOT NULL,
	PasswordHash varchar(200) NOT NULL,
	LanguageId uniqueidentifier NOT NULL,
	CreatedAt DateTime DEFAULT GETUTCDATE(),
	UpdatedAt DateTime DEFAULT NULL,

	CONSTRAINT PK_Users_Id PRIMARY KEY CLUSTERED(Id),
	CONSTRAINT UK_Users_Username UNIQUE(Username),
	CONSTRAINT UK_Users_Email UNIQUE(Email),
	CONSTRAINT FK_Languages_Users FOREIGN KEY(LanguageId)
		REFERENCES Languages(Id)
)

CREATE TABLE Posts (
	Id uniqueidentifier default newid(),
	Title varchar(100) NOT NULL DEFAULT '',
	MainContent varchar(6000) NOT NULL DEFAULT '',
	Introduction varchar(500) NOT NULL DEFAULT '',
	PublishedAt DateTime DEFAULT NULL,
	CreatedAt DateTime DEFAULT GETUTCDATE(),
	UpdatedAt DateTime DEFAULT NULL,
	UserId uniqueidentifier,

	CONSTRAINT PK_Posts_Id PRIMARY KEY CLUSTERED(Id),
	CONSTRAINT FK_Users_Posts FOREIGN KEY(UserId)
		REFERENCES Users(Id),
)

CREATE TABLE Topics_Posts (
	TopicId uniqueidentifier NOT NULL,
	PostId uniqueidentifier NOT NULL,

	CONSTRAINT FK_Topics_TopicsPosts FOREIGN KEY(TopicId)
		REFERENCES Topics(Id),
	CONSTRAINT FK_Posts_TopicsPosts FOREIGN KEY(PostId)
		REFERENCES Posts(Id),
)

CREATE TABLE Users_Posts (
	UserId uniqueidentifier NOT NULL,
	PostId uniqueidentifier NOT NULL,
	IsContributor bit NOT NULL,

	CONSTRAINT FK_Users_UsersPosts FOREIGN KEY(UserId)
		REFERENCES Users(Id),
	CONSTRAINT FK_Posts_UsersPosts FOREIGN KEY(PostId)
		REFERENCES Posts(Id),
)

CREATE TABLE Comments (
	Id uniqueidentifier default newid(),
	Text varchar(800),
	CommentParentId uniqueidentifier,
	PostId uniqueidentifier NOT NULL,
	UserId uniqueidentifier NOT NULL,
	CreatedAt DateTime DEFAULT GETUTCDATE(),
	UpdatedAt DateTime DEFAULT NULL,

	CONSTRAINT PK_Comments_Id PRIMARY KEY CLUSTERED(Id),
	CONSTRAINT FK_Comments_CommentParentId FOREIGN KEY(CommentParentId)
		REFERENCES Comments,
	CONSTRAINT FK_Posts_Comments FOREIGN KEY(PostId)
		REFERENCES Posts(Id),
	CONSTRAINT FK_Users_Comments FOREIGN KEY(UserId)
		REFERENCES Users(Id),
)

