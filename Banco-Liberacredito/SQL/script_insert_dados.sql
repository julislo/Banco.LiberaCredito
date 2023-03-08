

SET IDENTITY_INSERT [dbo].[TipoDoFinanciamento] ON 
INSERT [dbo].[TipoDoFinanciamento] ([Id], [Nome], [Juros]) VALUES (1, 'Crédito Direto',				CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[TipoDoFinanciamento] ([Id], [Nome], [Juros]) VALUES (2, 'Crédito Consignado',			CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[TipoDoFinanciamento] ([Id], [Nome], [Juros]) VALUES (3, 'Crédito Pessoa Jurídica',	CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[TipoDoFinanciamento] ([Id], [Nome], [Juros]) VALUES (4, 'Crédito Pessoa Física',		CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[TipoDoFinanciamento] ([Id], [Nome], [Juros]) VALUES (5, 'Crédito Imobiliário',		CAST(9 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[TipoFinanciamento] OFF
GO

SET IDENTITY_INSERT [dbo].[Cliente] ON 
INSERT [dbo].[Cliente] ([Id], [Nome],[Cpf], [Uf], [Celular]) VALUES (1,'Eduardo Silva',		'32947937074','SP', '11975467890');
INSERT [dbo].[Cliente] ([Id], [Nome],[Cpf], [Uf], [Celular]) VALUES (2,'Pedro Gonçalves',	'01236611020','SP', '11975467890');
INSERT [dbo].[Cliente] ([Id], [Nome],[Cpf], [Uf], [Celular]) VALUES (3,'Mariana Guedes',	'30113381085','SP', '11975467890');
INSERT [dbo].[Cliente] ([Id], [Nome],[Cpf], [Uf], [Celular]) VALUES (4,'Lucia Souza',		'58779657001','SP', '11975467890');
INSERT [dbo].[Cliente] ([Id], [Nome],[Cpf], [Uf], [Celular]) VALUES (5,'Fernando Fernandes','48008961007','SP', '11975467890');
INSERT [dbo].[Cliente] ([Id], [Nome],[Cpf], [Uf], [Celular]) VALUES (6,'Gabriela Silva',	'12770916092','SP', '11975467890');
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO

SET IDENTITY_INSERT [dbo].[Financiamento] ON
INSERT [dbo].[Financiamento] ([Id], [Cliente_id], [Cpf], [Tipo_Financiamento] ,[Valor_Total], [Data_Vencimento]) VALUES (1,	1, '01236611020',  1, CAST(61200 AS Decimal(18, 0)), CAST('2023-03-24T00:00:00.000' AS DateTime));
INSERT [dbo].[Financiamento] ([Id], [Cliente_id], [Cpf], [Tipo_Financiamento] ,[Valor_Total], [Data_Vencimento]) VALUES (2,	2, '01236611020',  2, CAST(40400 AS Decimal(18, 0)), CAST('2023-03-25T00:00:00.000' AS DateTime));
INSERT [dbo].[Financiamento] ([Id], [Cliente_id], [Cpf], [Tipo_Financiamento] ,[Valor_Total], [Data_Vencimento]) VALUES (3,	3, '30113381085',  3, CAST(21000 AS Decimal(18, 0)), CAST('2023-03-26T00:00:00.000' AS DateTime));
INSERT [dbo].[Financiamento] ([Id], [Cliente_id], [Cpf], [Tipo_Financiamento] ,[Valor_Total], [Data_Vencimento]) VALUES (4,	4, '58779657001',  4, CAST(51500 AS Decimal(18, 0)), CAST('2023-03-27T00:00:00.000' AS DateTime));
INSERT [dbo].[Financiamento] ([Id], [Cliente_id], [Cpf], [Tipo_Financiamento] ,[Valor_Total], [Data_Vencimento]) VALUES (5,	5, '48008961007',  5, CAST(32700 AS Decimal(18, 0)), CAST('2023-03-28T00:00:00.000' AS DateTime));
INSERT [dbo].[Financiamento] ([Id], [Cliente_id], [Cpf], [Tipo_Financiamento] ,[Valor_Total], [Data_Vencimento]) VALUES (6,	5, '48008961007',  5, CAST(32700 AS Decimal(18, 0)), CAST('2023-03-28T00:00:00.000' AS DateTime));
SET IDENTITY_INSERT [dbo].[Financiamento] OFF
GO

SET IDENTITY_INSERT [dbo].[Parcela] ON
--cliente 'Eduardo Silva'
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (1,   1, 1, CAST(10200 AS Decimal(18, 0)), CAST('2023-03-24T00:00:00.000' AS DateTime), CAST('2023-03-24T00:00:00.000' AS DateTime),1);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (2,   1, 2, CAST(10200 AS Decimal(18, 0)), CAST('2023-04-24T00:00:00.000' AS DateTime), CAST('2023-03-24T00:00:00.000' AS DateTime),1);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (3,   1, 3, CAST(10200 AS Decimal(18, 0)), CAST('2023-05-24T00:00:00.000' AS DateTime), CAST('2023-03-24T00:00:00.000' AS DateTime),1);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (4,   1, 4, CAST(10200 AS Decimal(18, 0)), CAST('2023-06-24T00:00:00.000' AS DateTime), CAST('2023-03-24T00:00:00.000' AS DateTime),1);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (5,   1, 5, CAST(10200 AS Decimal(18, 0)), CAST('2023-07-24T00:00:00.000' AS DateTime), null,1);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (6,   1, 6, CAST(10200 AS Decimal(18, 0)), CAST('2023-08-24T00:00:00.000' AS DateTime), null,1);
																														
--cliente 'Pedro Gonçalves'																								
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (7,   2, 1, CAST(6734 AS Decimal(18, 0)), CAST('2023-03-25T00:00:00.000' AS DateTime), CAST('2023-03-25T00:00:00.000' AS DateTime),2);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (8,   2, 2, CAST(6734 AS Decimal(18, 0)), CAST('2023-04-25T00:00:00.000' AS DateTime), CAST('2023-04-25T00:00:00.000' AS DateTime),2);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (9,   2, 3, CAST(6734 AS Decimal(18, 0)), CAST('2023-05-25T00:00:00.000' AS DateTime), CAST('2023-05-25T00:00:00.000' AS DateTime),2);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (10,  2, 4, CAST(6734 AS Decimal(18, 0)), CAST('2023-06-25T00:00:00.000' AS DateTime), CAST('2023-06-25T00:00:00.000' AS DateTime),2);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (11,  2, 5, CAST(6734 AS Decimal(18, 0)), CAST('2023-07-25T00:00:00.000' AS DateTime), null,2);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (12,  2, 6, CAST(6734 AS Decimal(18, 0)), CAST('2023-08-25T00:00:00.000' AS DateTime), null,2);
																														
--cliente Mariana Guedes																								
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (13,  3, 1, CAST(4200 AS Decimal(18, 0)), CAST('2023-03-02T00:00:00.000' AS DateTime), null,3);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (14,  3, 2, CAST(4200 AS Decimal(18, 0)), CAST('2023-04-26T00:00:00.000' AS DateTime), null,3);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (15,  3, 3, CAST(4200 AS Decimal(18, 0)), CAST('2023-05-26T00:00:00.000' AS DateTime), null,3);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (16,  3, 4, CAST(4200 AS Decimal(18, 0)), CAST('2023-06-26T00:00:00.000' AS DateTime), null,3);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (17,  3, 5, CAST(4200 AS Decimal(18, 0)), CAST('2023-07-26T00:00:00.000' AS DateTime), null,3);
																																					    
--cliente Lucia Souza																								 								    
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (18,  3, 1, CAST(10300 AS Decimal(18, 0)), CAST('2023-03-02T00:00:00.000' AS DateTime), null,4);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (19,  3, 2, CAST(10300 AS Decimal(18, 0)), CAST('2023-04-27T00:00:00.000' AS DateTime), null,4);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (20,  3, 3, CAST(10300 AS Decimal(18, 0)), CAST('2023-05-27T00:00:00.000' AS DateTime), null,4);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (21,  3, 4, CAST(10300 AS Decimal(18, 0)), CAST('2023-06-27T00:00:00.000' AS DateTime), null,4);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (22,  3, 5, CAST(10300 AS Decimal(18, 0)), CAST('2023-07-27T00:00:00.000' AS DateTime), null,4);
																													 								    
--cliente Fernando Fernandes																							 							    
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (23,  3, 1, CAST(6540 AS Decimal(18, 0)), CAST('2023-03-02T00:00:00.000' AS DateTime), null,5);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (24,  3, 2, CAST(6540 AS Decimal(18, 0)), CAST('2023-04-28T00:00:00.000' AS DateTime), null,5);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (25,  3, 3, CAST(6540 AS Decimal(18, 0)), CAST('2023-05-28T00:00:00.000' AS DateTime), null,5);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (26,  3, 4, CAST(6540 AS Decimal(18, 0)), CAST('2023-06-28T00:00:00.000' AS DateTime), null,5);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (27,  3, 5, CAST(6540 AS Decimal(18, 0)), CAST('2023-07-28T00:00:00.000' AS DateTime), null,5);
																																					    
--cliente Gabriela Silva																								 							    
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (28,  3, 1, CAST(6540 AS Decimal(18, 0)), CAST('2023-03-02T00:00:00.000' AS DateTime), null,6);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (29,  3, 2, CAST(6540 AS Decimal(18, 0)), CAST('2023-04-29T00:00:00.000' AS DateTime), null,6);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (30,  3, 3, CAST(6540 AS Decimal(18, 0)), CAST('2023-05-29T00:00:00.000' AS DateTime), null,6);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (31,  3, 4, CAST(6540 AS Decimal(18, 0)), CAST('2023-06-29T00:00:00.000' AS DateTime), null,6);
INSERT [dbo].[Parcela] ([Id], [Id_Financiamento], [Numero_Parcela], [Valor_Parcela], [Data_Vencimento], [Data_Pagamento], [Id_Cliente]) VALUES (32,  3, 5, CAST(6540 AS Decimal(18, 0)), CAST('2023-07-29T00:00:00.000' AS DateTime), null,6);
SET IDENTITY_INSERT [dbo].[Parcela] OFF
GO



