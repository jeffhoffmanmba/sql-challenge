-- DATA ENGINEERING
	-- Use the information you have to create a table schema for each of the six CSV files. 
	-- 	Remember to specify data types, primary keys, foreign keys, and other constraints.
	-- 	For the primary keys check to see if the column is unique, otherwise create a composite key, 
		-- which takes to primary keys in order to uniquely identify a row.
	-- Be sure to create tables in the correct order to handle foreign keys.
	-- Import each CSV file into the corresponding SQL table. Note be sure to import the data 
		-- in the same order that the tables were created and account for the headers when importing to avoid errors.
		
CREATE TABLE Departments (
    dept_no VARCHAR(30) Not Null,
    dept_name VARCHAR(50) Not Null,
	PRIMARY KEY (dept_no)
);

SELECT * from Departments;

CREATE TABLE employees (
    emp_no INT Not null,
	emp_title_id varchar(30) Not Null,
    birth_date date Not Null,
	first_name VARCHAR(50) Not Null,
    last_name VARCHAR(50) Not Null,
    gender VARCHAR(1) Not Null,
    hire_date date NOT NULL,
	PRIMARY KEY (emp_no)
);

SELECT * from employees limit 10;

CREATE TABLE dept_manager (
    dept_no VARCHAR(30) Not null,
    emp_no int Not null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * from dept_manager;

CREATE TABLE dept_employees (
    emp_no int Not Null,
	dept_no VARCHAR(30) Not Null,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * from dept_employees;

CREATE TABLE salaries (
    emp_no int Not null,
	salary int  NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * from Salaries;

CREATE TABLE titles (
	title_id VARCHAR(15) Not Null,
	title VARCHAR(50) Not Null
);

SELECT * from titles;

ALTER TABLE titles ADD CONSTRAINT fk_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);