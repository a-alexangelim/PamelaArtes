CREATE TABLE CLIENTE
(
	ID SERIAL PRIMARY KEY,
	NOME CHAR(75),
	TELEFONE CHAR(15),
	CELULAR CHAR(15),
	EMAIL CHAR(45),
	DATACADASTRO DATE
);