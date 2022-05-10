USE Blogs

INSERT INTO Languages(Name, Abbreviation)
VALUES
('french', 'fr'),
('english', 'en'),
('spanish', 'es')

INSERT INTO Topics(Name)
VALUES
('recipe'),
('vegan'),
('car'),
('japan'),
('magic')

INSERT INTO Users(Username, Email, PasswordHash, LanguageId)
VALUES
('Taco98', 'taco@hotmail.com', '34rsgesasd', (SELECT Id FROM Languages WHERE Name = 'french')),
('IronMan', 'ironman@gmail.com', 'dsdfefqrq2q2r', (SELECT Id FROM Languages WHERE Name = 'english'))

INSERT INTO Posts(Title, MainContent, Introduction, Published, UserId)
VALUES
('How to cook tofu', 'MainContent for tofu', 'Intro for tofu', '2022-01-01T10:15:36', (SELECT Id FROM Users WHERE Username = 'Taco98')),
('Top 5 japan car', 'MainContent for japan car', 'Intro for japan car', '2019-02-21T23:59:59', (SELECT Id FROM Users WHERE Username = 'IronMan')),
('Make the magic happen!', 'Maincontent for magic', 'Intro for magic', '1993-10-11T02:56:23', (SELECT Id FROM Users WHERE Username = 'Taco98'))

INSERT INTO Topics_Posts(TopicId, PostId)
VALUES
((SELECT Id FROM Topics WHERE Name = 'recipe'), (SELECT Id FROM Posts WHERE Title = 'How to cook tofu')),
((SELECT Id FROM Topics WHERE Name = 'vegan'), (SELECT Id FROM Posts WHERE Title = 'How to cook tofu')),
((SELECT Id FROM Topics WHERE Name = 'car'), (SELECT Id FROM Posts WHERE Title = 'Top 5 japan car')),
((SELECT Id FROM Topics WHERE Name = 'japan'), (SELECT Id FROM Posts WHERE Title = 'Top 5 japan car')),
((SELECT Id FROM Topics WHERE Name = 'magic'), (SELECT Id FROM Posts WHERE Title = 'Make the magic happen!'))

INSERT INTO Users_Posts(UserId, PostId, IsContributor)
VALUES
((SELECT Id FROM Users WHERE Username = 'Taco98'), (SELECT Id FROM Posts WHERE Title = 'How to cook tofu'), 1),
((SELECT Id FROM Users WHERE Username = 'Taco98'), (SELECT Id FROM Posts WHERE Title = 'Make the magic happen!'), 1),
((SELECT Id FROM Users WHERE Username = 'IronMan'), (SELECT Id FROM Posts WHERE Title = 'Top 5 japan car'), 1),
((SELECT Id FROM Users WHERE Username = 'Taco98'), (SELECT Id FROM Posts WHERE Title = 'Top 5 japan car'), 1)


INSERT INTO Comments(Text, PostId, CommentParentId, UserId)
VALUES
('Comment on how to cook tofu', (SELECT Id FROM Posts WHERE Title = 'How to cook tofu'), null, (SELECT Id FROM Users WHERE Username = 'Taco98')),
('Comment on Taco98 how to cook tofu', (SELECT Id FROM Posts WHERE Title = 'How to cook tofu'), (SELECT Id FROM Comments WHERE Text = 'Comment on how to cook tofu'), (SELECT Id FROM Users WHERE Username = 'IronMan')),
('Comment on IronMan how to cook tofu', (SELECT Id FROM Posts WHERE Title = 'How to cook tofu'), (SELECT Id FROM Comments WHERE Text = 'Comment on Taco98 how to cook tofu'), (SELECT Id FROM Users WHERE Username = 'Taco98')),
('Amazing comment on how to cook tofu', (SELECT Id FROM Posts WHERE Title = 'How to cook tofu'), null, (SELECT Id FROM Users WHERE Username = 'IronMan'))

