CREATE TABLE cars(
   car_id INTEGER PRIMARY KEY,
   model VARCHAR (255) NOT NULL,
   year INTEGER NOT NULL,
   details TEXT NOT NULL
);

INSERT INTO cars (car_id, model, year, details) VALUES (1, 'Ford Mondeo', 2018, 'Second owner, very good condition');
INSERT INTO cars (car_id, model, year, details) VALUES (2, 'Chrysler Pacifica', 2012, 'Good condition, 230V power outlet in trunk');
INSERT INTO cars (car_id, model, year, details) VALUES (3, 'Fiat Panda', 2019, 'First owner, car paint needs renovation');