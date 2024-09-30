 CREATE DATABASE expense_tracker;
 USE expense_tracker;
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
     user_id INT,
     category_name VARCHAR(50) NOT NULL,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (user_id) REFERENCES Users(user_id)
 );

 CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category_id INT,
     amount DECIMAL(10, 2) NOT NULL,
    date DATE NOT NULL,
     description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (user_id) REFERENCES Users(user_id),
     FOREIGN KEY (category_id) REFERENCES Categories(category_id)
 );

 CREATE TABLE Payment_Methods (
     payment_method_id INT AUTO_INCREMENT PRIMARY KEY,
     user_id INT,
     payment_method_name VARCHAR(50) NOT NULL,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (user_id) REFERENCES Users(user_id)
 );

 CREATE TABLE Budgets (
     budget_id INT AUTO_INCREMENT PRIMARY KEY,
     user_id INT,
     category_id INT,
     amount DECIMAL(10, 2) NOT NULL,
     start_date DATE NOT NULL,
     end_date DATE NOT NULL,
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (user_id) REFERENCES Users(user_id),
     FOREIGN KEY (category_id) REFERENCES Categories(category_id)
 );
-- Regions Table
INSERT INTO Regions (RegionID, RegionName)
VALUES 
(1, 'North'),
(2, 'South'),
(3, 'East'),
(4, 'West');

-- Hospitals Table
INSERT INTO Hospitals (HospitalID, Name, RegionID, Capacity)
VALUES 
(1, 'North General Hospital', 1, 200),
(2, 'South Health Center', 2, 150),
(3, 'East Medical Institute', 3, 250),
(4, 'West Wellness Clinic', 4, 100),
(5, 'Central City Hospital', 1, 300);

-- Treatments Table
INSERT INTO Treatments (TreatmentID, TreatmentName, Cost)
VALUES 
(1, 'General Checkup', 50.00),
(2, 'Cardiology Consultation', 150.00),
(3, 'Orthopedic Surgery', 2000.00),
(4, 'Pediatric Care', 100.00),
(5, 'Maternity Care', 500.00);

-- Patients Table
INSERT INTO Patients (PatientID, Name, Age, Gender, HospitalID)
VALUES 
(1, 'Alice Johnson', 34, 'F', 1),
(2, 'Bob Smith', 45, 'M', 2),
(3, 'Carol White', 29, 'F', 3),
(4, 'David Brown', 60, 'M', 4),
(5, 'Eva Green', 40, 'F', 1),
(6, 'Frank Black', 50, 'M', 2),
(7, 'Grace King', 33, 'F', 3),
(8, 'Henry Knight', 70, 'M', 4),
(9, 'Isabel Queen', 55, 'F', 5),
(10, 'Jack Prince', 65, 'M', 5),
(11, 'Kathy Duke', 38, 'F', 1),
(12, 'Leo Knight', 25, 'M', 3),
(13, 'Mona Ray', 50, 'F', 2),
(14, 'Nancy Lane', 72, 'F', 4),
(15, 'Oscar Ford', 20, 'M', 5);

-- Assign Treatments to Patients
INSERT INTO PatientTreatments (PatientID, TreatmentID, TreatmentDate)
VALUES
(1, 1, '2024-08-01'),
(2, 2, '2024-08-02'),
(3, 3, '2024-08-03'),
(4, 4, '2024-08-04'),
(5, 5, '2024-08-05'),
(6, 1, '2024-08-06'),
(7, 2, '2024-08-07'),
(8, 3, '2024-08-08'),
(9, 4, '2024-08-09'),
(10, 5, '2024-08-10'),
(11, 1, '2024-08-11'),
(12, 2, '2024-08-12'),
(13, 3, '2024-08-13'),
(14, 4, '2024-08-14'),
(15, 5, '2024-08-15');
