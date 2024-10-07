-- Create the database
CREATE DATABASE KidProgrammingDB;
GO

-- Use the created database
USE KidProgrammingDB;
GO

-- Table: Users
-- This table stores the basic information of the users (students/kids)
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),  -- Unique identifier for each user
    Username NVARCHAR(100) NOT NULL,       -- Username for the user
    Email NVARCHAR(255) NOT NULL UNIQUE,   -- User's email (must be unique)
    PasswordHash NVARCHAR(255) NOT NULL,   -- Hashed password for authentication
    Age INT,                               -- User's age
    DateJoined DATETIME DEFAULT GETDATE(), -- Date when the user joined
    IsActive BIT DEFAULT 1                 -- Flag to check if the user account is active
);
GO

-- Table: Roles
-- This table stores different roles that users can have (e.g., Kid, Parent, Admin)
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),  -- Unique identifier for each role
    RoleName NVARCHAR(100) NOT NULL        -- Name of the role (e.g., Kid, Admin)
);
GO

-- Insert default roles
-- Prepopulate the Roles table with default roles
INSERT INTO Roles (RoleName) VALUES ('Kid'), ('Parent'), ('Admin');
GO

-- Table: UserRoles
-- This table links users to their roles (many-to-many relationship)
CREATE TABLE UserRoles (
    UserRoleID INT PRIMARY KEY IDENTITY(1,1),              -- Unique identifier for user-role mapping
    UserID INT FOREIGN KEY REFERENCES Users(UserID) ON DELETE CASCADE, -- Foreign key reference to Users table
    RoleID INT FOREIGN KEY REFERENCES Roles(RoleID) ON DELETE CASCADE  -- Foreign key reference to Roles table
);
GO

-- Table: Tutorials
-- This table stores information about programming tutorials
CREATE TABLE Tutorials (
    TutorialID INT PRIMARY KEY IDENTITY(1,1),      -- Unique identifier for each tutorial
    Title NVARCHAR(255) NOT NULL,                  -- Title of the tutorial
    Description NVARCHAR(MAX),                     -- Description of what the tutorial covers
    Level NVARCHAR(50),                            -- Difficulty level (e.g., Beginner, Intermediate, Advanced)
    Duration INT,                                  -- Duration of the tutorial in minutes
    CreatedDate DATETIME DEFAULT GETDATE(),        -- Date when the tutorial was created
    IsActive BIT DEFAULT 1                         -- Flag to check if the tutorial is active
);
GO

-- Table: TutorialContent
-- This table stores the content (steps, instructions, or media) related to each tutorial
CREATE TABLE TutorialContent (
    ContentID INT PRIMARY KEY IDENTITY(1,1),       -- Unique identifier for each piece of content
    TutorialID INT FOREIGN KEY REFERENCES Tutorials(TutorialID) ON DELETE CASCADE, -- Foreign key reference to the tutorial
    ContentText NVARCHAR(MAX),                     -- The content or instructions for the tutorial
    MediaURL NVARCHAR(255)                         -- URL to any associated media (optional)
);
GO

-- Table: Progress
-- This table tracks the progress of users in each tutorial
CREATE TABLE Progress (
    ProgressID INT PRIMARY KEY IDENTITY(1,1),      -- Unique identifier for progress tracking
    UserID INT FOREIGN KEY REFERENCES Users(UserID) ON DELETE CASCADE,    -- Foreign key reference to the user
    TutorialID INT FOREIGN KEY REFERENCES Tutorials(TutorialID) ON DELETE CASCADE, -- Foreign key reference to the tutorial
    CurrentStep INT,                               -- The current step the user is on within the tutorial
    Completed BIT DEFAULT 0,                       -- Flag indicating if the tutorial is completed (0 for not completed, 1 for completed)
    StartedDate DATETIME DEFAULT GETDATE(),        -- Date when the user started the tutorial
    CompletedDate DATETIME NULL                    -- Date when the user completed the tutorial (null if not completed)
);
GO

-- Table: Achievements
-- This table stores different achievements that users can earn by completing tutorials or other actions
CREATE TABLE Achievements (
    AchievementID INT PRIMARY KEY IDENTITY(1,1),   -- Unique identifier for each achievement
    Title NVARCHAR(255) NOT NULL,                  -- Title of the achievement (e.g., "Loop Master")
    Description NVARCHAR(MAX),                     -- Description of how the achievement is earned
    CreatedDate DATETIME DEFAULT GETDATE()         -- Date when the achievement was created
);
GO

-- Table: UserAchievements
-- This table stores the achievements that each user has earned
CREATE TABLE UserAchievements (
    UserAchievementID INT PRIMARY KEY IDENTITY(1,1),        -- Unique identifier for the user-achievement mapping
    UserID INT FOREIGN KEY REFERENCES Users(UserID) ON DELETE CASCADE,       -- Foreign key reference to the user
    AchievementID INT FOREIGN KEY REFERENCES Achievements(AchievementID) ON DELETE CASCADE, -- Foreign key reference to the achievement
    EarnedDate DATETIME DEFAULT GETDATE()                   -- Date when the user earned the achievement
);
GO

-- Table: Feedback
-- This table stores feedback provided by users on tutorials
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),    -- Unique identifier for the feedback
    UserID INT FOREIGN KEY REFERENCES Users(UserID) ON DELETE CASCADE,      -- Foreign key reference to the user
    TutorialID INT FOREIGN KEY REFERENCES Tutorials(TutorialID) ON DELETE CASCADE, -- Foreign key reference to the tutorial
    FeedbackText NVARCHAR(MAX),                 -- The feedback text provided by the user
    Rating INT CHECK(Rating BETWEEN 1 AND 5),    -- Rating out of 5 (1 is lowest, 5 is highest)
    SubmittedDate DATETIME DEFAULT GETDATE()     -- Date when the feedback was submitted
);
GO

-- Sample Inserts

-- Sample user data
-- Add some initial users (JohnDoe and JaneDoe) to the Users table
INSERT INTO Users (Username, Email, PasswordHash, Age) 
VALUES ('JohnDoe', 'johndoe@example.com', 'hashedpassword1', 10),
       ('JaneDoe', 'janedoe@example.com', 'hashedpassword2', 12);

-- Assign roles to users
-- Map the users to their roles in the UserRoles table (both assigned as 'Kid')
INSERT INTO UserRoles (UserID, RoleID)
VALUES (1, 1), -- JohnDoe as Kid
       (2, 1); -- JaneDoe as Kid

-- Sample tutorial data
-- Add sample tutorials (Intro to Loops, Variables and Data Types)
INSERT INTO Tutorials (Title, Description, Level, Duration)
VALUES ('Intro to Loops', 'Learn loops with simple exercises', 'Beginner', 30),
       ('Variables and Data Types', 'Introduction to variables and data types', 'Beginner', 25);

-- Sample tutorial content
-- Add steps/content for the sample tutorials
INSERT INTO TutorialContent (TutorialID, ContentText, MediaURL)
VALUES (1, 'Step 1: Learn how loops work with simple examples.', NULL),
       (1, 'Step 2: Implement your first loop.', 'https://example.com/loop_example.png'),
       (2, 'Step 1: Learn what variables are and how to use them.', NULL);

-- Sample progress data
-- Track the progress of users in the tutorials (JohnDoe and JaneDoe)
INSERT INTO Progress (UserID, TutorialID, CurrentStep, Completed)
VALUES (1, 1, 1, 0), -- JohnDoe started "Intro to Loops"
       (2, 2, 2, 0); -- JaneDoe started "Variables and Data Types"

-- Sample achievements
-- Add sample achievements (Loop Master, Variable Expert)
INSERT INTO Achievements (Title, Description)
VALUES ('Loop Master', 'Complete the Intro to Loops tutorial'),
       ('Variable Expert', 'Complete the Variables and Data Types tutorial');

-- Assign achievements to users
-- Award achievements to the users based on their progress
INSERT INTO UserAchievements (UserID, AchievementID)
VALUES (1, 1), -- JohnDoe earned "Loop Master"
       (2, 2); -- JaneDoe earned "Variable Expert"

-- Sample feedback
-- Add feedback from users for the tutorials
INSERT INTO Feedback (UserID, TutorialID, FeedbackText, Rating)
VALUES (1, 1, 'Great tutorial, really enjoyed learning about loops!', 5),
       (2, 2, 'Helpful but a bit difficult at first.', 4);

GO
