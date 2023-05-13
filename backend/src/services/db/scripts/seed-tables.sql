DELETE FROM budgets;
DELETE FROM transactions;
DELETE FROM accounts;
DELETE FROM users;

DO $$
DECLARE
  user1Id uuid = uuid_generate_v4();
  user2Id uuid = uuid_generate_v4();
  account1Id uuid = uuid_generate_v4();
  account2Id uuid = uuid_generate_v4();
  account3Id uuid = uuid_generate_v4();
  transaction1Id uuid = uuid_generate_v4();
  transaction2Id uuid = uuid_generate_v4();
  transaction3Id uuid = uuid_generate_v4();
  transaction4Id uuid = uuid_generate_v4();
  transaction5Id uuid = uuid_generate_v4();
  budget1Id uuid = uuid_generate_v4();
  budget2Id uuid = uuid_generate_v4();
BEGIN
INSERT INTO users("id","first_name","last_name","username","email","password","updated_at","created_at")
VALUES
(user1Id::UUID,E'Antoinette',E'Jackson',E'ajackson',E'antoinette@email.com',E'password',E'2020-07-05 00:00:00',E'2020-07-15 00:00:00'),
(user2Id::UUID,E'Michael',E'Byrd',E'mbyrd',E'michael@email.com',E'password',E'2020-07-05 00:00:00',E'2020-07-15 00:00:00');
INSERT INTO accounts("id","name","balance","debit","credit_limit","bank","user_id","created_at","updated_at")
VALUES
(account1Id::UUID,'Checking',5000,true,NULL,'Chase',user1Id::UUID,'2023-01-24 20:51:09.356843','2023-01-24 20:51:09.356843'),
(account2Id::UUID,'Savings',2000000,true,NULL,'Bank of America',user1Id::UUID,'2023-01-24 20:51:09.356843','2023-01-24 20:51:09.356843'),
(account3Id::UUID,'Credit Card',8000,false,1000000000,'Wells Fargo',user1Id::UUID,'2023-01-24 20:51:09.356843','2023-01-24 20:51:09.356843');
INSERT INTO transactions("id","title","amount","credit","memo","occurrence_frequency","due_by_date","payee","user_id","account_id","created_at","updated_at")
VALUES
(transaction1Id::UUID,'Red Lobster',5000,true,'Food',Null,'2019-02-03','Someone', user1Id::UUID, account2Id::UUID,'2023-01-24 20:51:09.372587','2023-01-24 20:51:09.372587'),
(transaction2Id::UUID,'Gas',3000,false,'Transportation',Null,'2019-02-03','Someone Else', user1Id::UUID, account1Id::UUID,'2023-01-24 20:51:09.378276','2023-01-24 20:51:09.378276'),
(transaction3Id::UUID,'Mortgage',900000,false,'Housing','Every month','2019-06-21','Someone New', user1Id::UUID, account2Id::UUID,'2023-01-24 20:51:09.381576','2023-01-24 20:51:09.381576'),
(transaction4Id::UUID,'School',50000,true,'Education','Every quarter','2019-06-21','Someone Old', user1Id::UUID, account1Id::UUID,'2023-01-24 20:51:09.384919','2023-01-24 20:51:09.384919'),
(transaction5Id::UUID,'Movies',4000,false,'Entertainment',NULL,'2020-07-15','Someone I dont know', user1Id::UUID, account3Id::UUID,'2023-01-24 20:51:09.387656','2023-01-24 20:51:09.387656');
INSERT INTO budgets("id","title","amount","category","user_id","created_at","updated_at")
VALUES
(budget1Id::UUID,'Summer Trip',400000,'Fun',user1Id::UUID,'2023-01-24 20:51:09.356843','2023-01-24 20:51:09.356843'),
(budget2Id::UUID,'Saving for remodel',200000,'Life', user1Id::UUID,'2023-01-24 20:51:09.362003','2023-01-24 20:51:09.362003');
END $$;

