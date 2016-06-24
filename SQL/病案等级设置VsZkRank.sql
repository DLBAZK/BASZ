USE [Batj2005]
GO


CREATE TABLE [dbo].[VsZkRank](
	[ID] [int] NOT NULL,
	[LowScore] [varchar](10) NOT NULL,
	[HighScore] [varchar](10) NOT NULL,
	[rankcolor] [int] NULL,
 CONSTRAINT [PK_VsZkRank] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
insert into VsZkRank values(101,'90','100')
insert into VsZkRank values(102,'70','90')
insert into VsZkRank values(103,'0','70')
GO


