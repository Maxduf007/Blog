DROP DATABASE IF EXISTS Blogs;
CREATE DATABASE Blogs;

CREATE TABLE LanguagePreferences (
	Id uniqueidentifier default newid(),
	Name varchar(50) NOT NULL,
	Abbreviation varchar(5) NOT NULL,

	CONSTRAINT PK_LanguagePreferences_Id PRIMARY KEY CLUSTERED(ID),
	CONSTRAINT UK_LanguagePreferences_Name UNIQUE(Name),
	CONSTRAINT UK_LanguagePreferences_Abbreviation UNIQUE(Abbreviation),
)

CREATE TABLE Topics (
	Id uniqueidentifier default newid(),
	Name varchar(75) NOT NULL,
	Description varchar(150),

	CONSTRAINT PK_Topics_Id PRIMARY KEY CLUSTERED(Id),
	CONSTRAINT UK_Topics_Name UNIQUE(Name),
)


CREATE TABLE Users (
	Id uniqueidentifier default newid(),
	Username varchar(50) NOT NULL,
	Email varchar(75) NOT NULL,
	PasswordHash varchar(200) NOT NULL,
	LanguagePreferenceId uniqueidentifier NOT NULL,

	CONSTRAINT PK_Users_Id PRIMARY KEY CLUSTERED(Id),
	CONSTRAINT UK_Users_Username UNIQUE(Username),
	CONSTRAINT UK_Users_Email UNIQUE(Email),
	CONSTRAINT FK_LanguagePreferences_Users FOREIGN KEY(LanguagePreferenceId)
		REFERENCES LanguagePreferences(Id)
)

CREATE TABLE Posts (
	Id uniqueidentifier default newid(),
	Title varchar(100) NOT NULL,
	MainContent varchar(6000) NOT NULL,
	Introduction varchar(500),
	Published DateTime,
	UserId uniqueidentifier,

	CONSTRAINT PK_Posts_Id PRIMARY KEY CLUSTERED(Id),
	CONSTRAINT FK_Users_Posts FOREIGN KEY(UserId)
		REFERENCES Users(Id),
)

CREATE TABLE Topics_Posts (
	TopicId uniqueidentifier NOT NULL,
	PostId uniqueidentifier NOT NULL,

	CONSTRAINT FK_Topics FOREIGN KEY(TopicId)
		REFERENCES Topics(Id),
	CONSTRAINT FK_Posts FOREIGN KEY(PostId)
		REFERENCES Posts(Id),
)

CREATE TABLE Users_Posts (
	UserId uniqueidentifier NOT NULL,
	PostId uniqueidentifier NOT NULL,

	CONSTRAINT FK_Users FOREIGN KEY(UserId)
		REFERENCES Users(Id),
	CONSTRAINT FK_Posts FOREIGN KEY(PostId)
		REFERENCES Posts(Id),
)

CREATE TABLE Comments (
	Id uniqueidentifier default newid(),
	Text varchar(800),
	CommentParentId uniqueidentifier,
	PostId uniqueidentifier,
	UserId uniqueidentifier,

	CONSTRAINT PK_Comments_Id PRIMARY KEY CLUSTERED(Id),
	CONSTRAINT FK_Comments_CommentParentId FOREIGN KEY(CommentParentId)
		REFERENCES Comments,
	CONSTRAINT FK_Posts_Comments FOREIGN KEY(PostId)
		REFERENCES Posts(Id),
	CONSTRAINT FK_Users_Comments FOREIGN KEY(UserId)
		REFERENCES Users(Id),
)