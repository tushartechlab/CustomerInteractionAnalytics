USE [customer_interactions]
GO
SET IDENTITY_INSERT [dbo].[fact_customer_interactions] ON 
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (1, -1, 1, CAST(N'2024-12-07' AS Date), 3, CAST(N'2024-07-12T11:49:27.010' AS DateTime), CAST(N'2024-07-12T11:49:27.010' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (2, 1, 1, CAST(N'2024-10-07' AS Date), 1, CAST(N'2024-07-12T11:49:27.047' AS DateTime), CAST(N'2024-07-12T11:49:27.047' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (3, 1, 2, CAST(N'1900-01-01' AS Date), 3, CAST(N'2024-07-12T11:49:27.050' AS DateTime), CAST(N'2024-07-12T11:49:27.050' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (4, 2, 1, CAST(N'2024-07-18' AS Date), 3, CAST(N'2024-07-12T11:49:27.050' AS DateTime), CAST(N'2024-07-12T11:49:27.050' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (5, 2, 4, CAST(N'2024-07-13' AS Date), 3, CAST(N'2024-07-12T11:49:27.050' AS DateTime), CAST(N'2024-07-12T11:49:27.050' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (6, 3, -1, CAST(N'1900-01-01' AS Date), 3, CAST(N'2024-07-12T11:49:27.050' AS DateTime), CAST(N'2024-07-12T11:49:27.050' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (7, 3, 1, CAST(N'2024-07-14' AS Date), 2, CAST(N'2024-07-12T11:49:27.050' AS DateTime), CAST(N'2024-07-12T11:49:27.050' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (8, 3, 4, CAST(N'2024-07-17' AS Date), 3, CAST(N'2024-07-12T11:49:27.053' AS DateTime), CAST(N'2024-07-12T11:49:27.053' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (9, 4, 1, CAST(N'2024-10-07' AS Date), 2, CAST(N'2024-07-12T11:49:27.053' AS DateTime), CAST(N'2024-07-12T11:49:27.053' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (10, 4, 2, CAST(N'2024-07-16' AS Date), 3, CAST(N'2024-07-12T11:49:27.053' AS DateTime), CAST(N'2024-07-12T11:49:27.053' AS DateTime))
GO
INSERT [dbo].[fact_customer_interactions] ([fact_customer_interactions_id], [user_id], [product_id], [interaction_date], [interaction_count], [inserted_timestamp], [updated_timestamp]) VALUES (11, 5, 1, CAST(N'2024-07-14' AS Date), 1, CAST(N'2024-07-12T11:49:27.053' AS DateTime), CAST(N'2024-07-12T11:49:27.053' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[fact_customer_interactions] OFF
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (1, 1, 1, N'social media interaction', CAST(N'2024-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (2, 1, 2, N'email', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (3, -1, 1, N'social media interaction', CAST(N'2024-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (4, 2, 4, N'unknown', CAST(N'2024-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (5, 5, 1, N'email', CAST(N'2024-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (6, 3, -1, N'social media interaction', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (7, 4, 2, N'delivery', CAST(N'2024-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (8, 3, 4, N'social media interaction', CAST(N'2024-07-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (9, 2, 1, N'demo', CAST(N'2024-07-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (10, 4, 1, N'social media interaction', CAST(N'2024-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (11, 1, 2, N'email', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (12, -1, 1, N'social media interaction', CAST(N'2024-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (13, 2, 4, N'unknown', CAST(N'2024-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (14, 3, 1, N'email', CAST(N'2024-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (15, 3, -1, N'social media interaction', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (16, 4, 2, N'delivery', CAST(N'2024-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (17, 3, 4, N'social media interaction', CAST(N'2024-07-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (18, 2, 1, N'demo', CAST(N'2024-07-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (19, 4, 1, N'social media interaction', CAST(N'2024-10-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (20, 1, 2, N'email', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (21, -1, 1, N'social media interaction', CAST(N'2024-12-07T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (22, 2, 4, N'unknown', CAST(N'2024-07-13T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (23, 3, 1, N'email', CAST(N'2024-07-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (24, 3, -1, N'social media interaction', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (25, 4, 2, N'delivery', CAST(N'2024-07-16T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (26, 3, 4, N'social media interaction', CAST(N'2024-07-17T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_customer_interactions] ([interaction_id], [user_id], [product_id], [action], [timestamp]) VALUES (27, 2, 1, N'demo', CAST(N'2024-07-18T00:00:00.000' AS DateTime))
GO
