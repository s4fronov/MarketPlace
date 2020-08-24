insert into [dbo].[City] 
	(Id, [Name]) 
values
	(1, 'Moscow'),
	(2, 'Saint-Petersburg'),
	(3, 'Novosibirsk'),
	(4, 'Khabarovsk'),
	(5, 'Ekaterinurg'),
	(6, 'Samara'),
	(7, 'Rostov-na-Donu'),
	(8, 'Kaliningrad')
GO

insert into [dbo].[DbVersion] 
	([Created], [DbVersion]) 
values
	(SYSDATETIME(), '1.0')
GO
