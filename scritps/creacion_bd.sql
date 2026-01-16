CREATE DATABASE crm_whatsapp;

CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    plan VARCHAR(20) DEFAULT 'basic',
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    company_id INTEGER REFERENCES companies(id),
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash TEXT,
    role VARCHAR(20) CHECK (role IN ('admin','agent')),
    created_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    company_id INTEGER REFERENCES companies(id),
    phone VARCHAR(20) NOT NULL,
    name VARCHAR(100),
    status VARCHAR(30) DEFAULT 'nuevo',
    tags TEXT[],
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id),
    assigned_to INTEGER REFERENCES users(id),
    status VARCHAR(20) DEFAULT 'open',
    last_message_at TIMESTAMP
);

CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    chat_id INTEGER REFERENCES chats(id),
    direction VARCHAR(5) CHECK (direction IN ('in','out')),
    content TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE followups (
    id SERIAL PRIMARY KEY,
    client_id INTEGER REFERENCES clients(id),
    due_at TIMESTAMP,
    completed BOOLEAN DEFAULT FALSE
);

--------------------------------------


INSERT INTO companies (name) VALUES ('Inmobiliaria Demo');

INSERT INTO users (company_id, name, email, password_hash, role)
VALUES (1, 'Admin Demo', 'admin@demo.com', 'hash_fake', 'admin');

INSERT INTO clients (company_id, phone, name)
VALUES (1, '999888777', 'Juan Perez');

INSERT INTO chats (client_id, assigned_to, last_message_at)
VALUES (1, 1, NOW());

INSERT INTO messages (chat_id, direction, content)
VALUES 
(1, 'in', 'Hola, quiero información del departamento'),
(1, 'out', 'Claro, ¿en qué distrito estás buscando?');





