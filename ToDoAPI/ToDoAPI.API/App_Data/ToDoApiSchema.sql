/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TodoItems]') AND type in (N'U'))
ALTER TABLE [dbo].[TodoItems] DROP CONSTRAINT IF EXISTS [FK_TodoItems_Categories]
GO
/****** Object:  Table [dbo].[TodoItems]    Script Date: 10/1/2021 2:46:28 PM ******/
DROP TABLE IF EXISTS [dbo].[TodoItems]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/1/2021 2:46:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/1/2021 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TodoItems]    Script Date: 10/1/2021 2:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TodoItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TodoItems](
	[TodoId] [int] NOT NULL,
	[Action] [nvarchar](max) NOT NULL,
	[Done] [bit] NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_TodoItems] PRIMARY KEY CLUSTERED 
(
	[TodoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (1, N'Home', N'Any chores done in the house')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (2, N'Work', N'Task done for work')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (3, N'Personal', N'Tasks to help your personal growth')
INSERT [dbo].[Categories] ([CategoryId], [Name], [Description]) VALUES (4, N'Famiy', N'Task to help for family')
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (1001, N'Clean Kitchen', 1, 1)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (1002, N'Take out trash', 0, 1)
INSERT [dbo].[TodoItems] ([TodoId], [Action], [Done], [CategoryId]) VALUES (1003, N'Dr appointment ', 1, 4)
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TodoItems_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[TodoItems]'))
ALTER TABLE [dbo].[TodoItems]  WITH CHECK ADD  CONSTRAINT [FK_TodoItems_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TodoItems_Categories]') AND parent_object_id = OBJECT_ID(N'[dbo].[TodoItems]'))
ALTER TABLE [dbo].[TodoItems] CHECK CONSTRAINT [FK_TodoItems_Categories]
GO
