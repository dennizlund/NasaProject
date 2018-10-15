
SELECT * FROM [dbo].[UserAccounts] WHERE username COLLATE Latin1_General_CS_AS LIKE  '%' + 'dennis' + '%' AND password COLLATE Latin1_General_CS_AS LIKE '%' + 'dennis' + '%';