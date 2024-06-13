-- Tabla PAISES
CREATE TABLE COUNTRIES (
    id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    info VARCHAR(1000),
    photo VARCHAR(1000),
    country_group varchar(1),
    titles INTEGER
);

-- Tabla JUGADORES
CREATE TABLE PLAYERS (
    id SERIAL PRIMARY KEY,
    player_name VARCHAR(100) NOT NULL,
    team VARCHAR(100),
    photo VARCHAR(1000),
    country INTEGER REFERENCES COUNTRIES(id),
    position varchar(20)
);

-- Tabla SEDES
CREATE TABLE STADIUMS (
    id SERIAL PRIMARY KEY,
    stadium_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    photo VARCHAR(1000),
    capacity INTEGER
);

-- Insertar los países de la Copa América 2024
INSERT INTO countries (country_name, info, photo, country_group, titles)
VALUES
    ('Argentina', 'Campeón defensor', 'https://copaamerica.com/_next/image?url=%2Fselecao-argentina.jpg&w=3840&q=75', 'A', 15),
    ('Perú', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-peru.jpg&w=3840&q=75', 'A', 0),
    ('Chile', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-chile.jpg&w=3840&q=75', 'A', 2),
    ('Canadá', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-canada.jpg&w=3840&q=75', 'A', 0),
    ('México', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-mexico.jpg&w=2048&q=75', 'B', 10),
    ('Ecuador', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-equador.jpg&w=3840&q=75', 'B', 0),
    ('Venezuela', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-venezuela.jpg&w=3840&q=75', 'B', 0),
    ('Jamaica', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-jamaica.jpg&w=2048&q=75', 'B', 0),
    ('Estados Unidos', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-estados-unidos.jpg&w=2048&q=75', 'C', 0),
    ('Uruguay', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-uruguai.jpg&w=2048&q=75', 'C', 15),
    ('Panamá', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-panama.jpg&w=2048&q=75', 'C', 0),
    ('Bolivia', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-bolivia.jpg&w=2048&q=75', 'C', 1),
    ('Brasil', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-brasil.jpg&w=3840&q=75', 'D', 9),
    ('Colombia', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-colombia.jpg&w=3840&q=75', 'D', 1),
    ('Paraguay', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-paraguai.jpg&w=3840&q=75', 'D', 2),
    ('Costa Rica', NULL, 'https://copaamerica.com/_next/image?url=%2Fselecao-costa-rica.jpg&w=2048&q=75', 'D', 0);
   
 
   
INSERT INTO stadiums (stadium_name, city, photo, capacity)
VALUES
    ('Mercedes-Benz Stadium', 'Atlanta, GA', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fmercedesbenz-stadium.jpg&w=1920&q=75', 71000),
    ('Hard Rock Stadium', 'Miami Gardens, FL', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fhardrock-stadium.jpg&w=1920&q=75', 65300),
    ('AT&T Stadium', 'Arlington, TX', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fatt-stadium.jpg&w=1920&q=75', 80000),
    ('GEHA Field at Arrowhead Stadium', 'Kansas City, MO', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fgeha-stadium.jpg&w=1920&q=75', 76400),
    ('Q2 Stadium', 'Austin, TX', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fq2-stadium.jpg&w=1920&q=75', 20700),
    ('Bank of America Stadium', 'Charlotte, NC', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fbankofamerica-stadium.jpg&w=1920&q=75', 74500),
    ('MetLife Stadium', 'East Rutherford, NJ', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fmetlife-stadium.jpg&w=1920&q=75', 82500),
    ('State Farm Stadium', 'Glendale, AZ', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fstatefarm-stadium.jpg&w=1920&q=75', 63400),
    ('NRG Stadium', 'Houston, TX', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fnrg-stadium.jpg&w=1920&q=75', 72200),
    ('SoFi Stadium', 'Inglewood, CA', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fsofi-stadium.jpg&w=1920&q=75', 70000),
    ('Children’s Mercy Park', 'Kansas City, KS', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fchildrenmercypark-stadium.jpg&w=1920&q=75', 18500),
    ('Allegiant Stadium', 'Las Vegas, NV', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Fallegiant-stadium.jpg&w=1920&q=75', 65000),
    ('Inter&Co Stadium', 'Orlando, FL', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Finterco-stadium.jpg&w=1920&q=75', 25500),
    ('Levi’s® Stadium', 'Santa Clara, CA', 'https://copaamerica.com/_next/image?url=%2Fstadiums%2Flevis-stadium.jpg&w=1920&q=75', 68500);