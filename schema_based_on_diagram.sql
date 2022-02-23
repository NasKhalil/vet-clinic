CREATE TABLE patients{
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    date_of_birth DATE NOT NULL
}

CREATE TABLE medical_histories{
    id SERIAL PRIMARY KEY,
     admitted_at TIMESTAMP NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR(50),
    CONSTRAINT patients_fk FOREIGN KEY (patient_id) REFERENCES patients(id)
}

CREATE TABLE invoices{
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL NOT NULL,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP NOT NULL,
    medical_history_id SERIAL NOT NULL,
    CONSTRAINT history_fk FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
}

CREATE TABLE treatments{
    id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    name VARCHAR(50)
}

CREATE TABLE invoice_items(
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL NOT NULL,
    invoice_id SERIAL NOT NULL,
    treatment_id SERIAL NOT NULL,
    CONSTRAINT invoices_fk FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    CONSTRAINT treatment_fk FOREIGN KEY(treatment_id) REFERENCES treaments(id)
);

CREATE TABLE medical_histories_treatments{
    medical_history_id SERIAL,
    treatment_id SERIAL,
    CONSTRAINT history_fk FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT treatment_fk FOREIGN KEY(treatment_id) REFERENCES treatments(id)
}

CREATE INDEX invoice_items_index ON invoice_items(invoice_id);
CREATE INDEX treatements_histories_id_index ON medical_histories_treatements(id);
CREATE INDEX invoice_medical_history_index ON invoices(medical_history_id);
CREATE INDEX histories_patients_id_index ON medical_histories(id);
CREATE INDEX treatements_items_id_index ON invoice_items(id);