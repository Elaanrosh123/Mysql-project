-- Create the library database
CREATE DATABASE library;

-- Use the library database
USE library;

-- Create Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(255),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Create Books table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(255),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- Insert values into Branch table

INSERT INTO Branch VALUES
(1, 101, '123 Main St', '555-1234'),
(2, 102, '456 Oak St', '555-5678'),
(3, 103, '789 Maple St', '555-9101'),
(4, 104, '321 Pine St', '555-2468'),
(5, 105, '654 Cedar St', '555-1357'),
(6, 106, '987 Elm St', '555-7890'),
(7, 107, '111 Birch St', '555-2222'),
(8, 108, '444 Walnut St', '555-3333'),
(9, 109, '777 Ash St', '555-4444'),
(10, 110, '888 Oak St', '555-5555');
-- Insert values into Employee table
INSERT INTO Employee VALUES
(1, 'John Doe', 'Manager', 60000.00, 1),
(2, 'Jane Smith', 'Assistant Manager', 50000.00, 1),
(3, 'Bob Johnson', 'Clerk', 40000.00, 2),
(4, 'Alice Brown', 'Clerk', 45000.00, 2),
(5, 'Charlie Wilson', 'Clerk', 55000.00, 3),
(6, 'Diana Miller', 'Clerk', 50000.00, 3),
(7, 'Eva Davis', 'Manager', 60000.00, 4),
(8, 'Frank White', 'Assistant Manager', 55000.00, 4),
(9, 'Grace Taylor', 'Clerk', 48000.00, 5),
(10, 'Harry Adams', 'Clerk', 52000.00, 5);

-- Insert values into Customer table
INSERT INTO Customer VALUES
(101, 'Customer1', '123 Street', '2021-01-01'),
(102, 'Customer2', '456 Road', '2022-02-02'),
(103, 'Customer3', '789 Avenue', '2022-03-03'),
(104, 'Customer4', '321 Boulevard', '2023-04-04'),
(105, 'Customer5', '654 Lane', '2024-05-05'),
(106, 'Customer6', '987 Drive', '2021-06-06'),
(107, 'Customer7', '111 Place', '2022-07-07'),
(108, 'Customer8', '444 Circle', '2023-08-08'),
(109, 'Customer9', '777 Square', '2024-09-09'),
(110, 'Customer10', '888 Avenue', '2021-10-10');

-- Insert values into IssueStatus table
INSERT INTO IssueStatus VALUES
(1, 101, 'Book1', '2022-01-15', 1),
(2, 102, 'Book2', '2022-02-20', 2),
(3, 103, 'Book3', '2023-06-10', 3),
(4, 104, 'Book4', '2023-07-05', 4),
(5, 105, 'Book5', '2024-04-18', 5),
(6, 106, 'Book6', '2022-09-22', 6),
(7, 107, 'Book7', '2023-11-30', 7),
(8, 108, 'Book8', '2024-02-14', 8),
(9, 109, 'Book9', '2022-05-25', 9),
(10, 110, 'Book10', '2023-08-12', 10);

-- Insert values into ReturnStatus table
INSERT INTO ReturnStatus VALUES
(1, 101, 'Book1', '2022-02-10', 1),
(2, 102, 'Book2', '2022-03-15', 2),
(3, 103, 'Book3', '2023-06-25', 3),
(4, 104, 'Book4', '2023-07-20', 4),
(5, 105, 'Book5', '2024-05-02', 5),
(6, 106, 'Book6', '2022-10-05', 6),
(7, 107, 'Book7', '2024-01-12', 7),
(8, 108, 'Book8', '2024-03-28', 8),
(9, 109, 'Book9', '2022-06-10', 9),
(10, 110, 'Book10', '2023-09-20', 10);

-- Insert values into Books table
INSERT INTO Books VALUES
(1, 'Book1', 'Fiction', 5.99, 'yes', 'Author1', 'Publisher1'),
(2, 'Book2', 'Non-Fiction', 6.99, 'no', 'Author2', 'Publisher2'),
(3, 'Book3', 'History', 7.99, 'yes', 'Author3', 'Publisher3'),
(4, 'Book4', 'Science', 8.99, 'no', 'Author4', 'Publisher4'),
(5, 'Book5', 'Mystery', 9.99, 'yes', 'Author5', 'Publisher5'),
(6, 'Book6', 'Romance', 10.99, 'yes', 'Author6', 'Publisher6'),
(7, 'Book7', 'Thriller', 11.99, 'no', 'Author7', 'Publisher7'),
(8, 'Book8', 'Biography', 12.99, 'yes', 'Author8', 'Publisher8'),
(9, 'Book9', 'Self-Help', 13.99, 'no', 'Author9', 'Publisher9'),
(10, 'Book10', 'Fantasy', 14.99, 'yes', 'Author10', 'Publisher10');
select * from Branch;
select * from Employee;
select * from Customer;
select * from IssueStatus ;
select * from  ReturnStatus;
select * from Book;


-- 1 Retrieve the book title, category, and rental price of all availablebooks.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';
-- 2 List the employee names and their respective salaries in descendingorder of salary.

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;
-- 3 Retrieve the book titles and the corresponding customers who haveissued those books.
SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customer c ON i.Issued_cust = c.Customer_Id;
-- 4 Display the total count of books in each category
SELECT Category, COUNT(*) AS Total_Count FROM Books GROUP BY Category;
-- 5  Retrieve the employee names and their positions for the employeeswhose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;
-- 6 List the customer names who registered before 2022-01-01 and havenot issued any books yet.
SELECT c.Customer_name
FROM Customer c
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issue_Id IS NULL;
-- 7Display the branch numbers and the total count of employees in eachbranch.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;
-- 8 Display the names of customers who have issued books in the monthof June 2023.

SELECT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;
-- 9 Retrieve book_title from book table containing history. 10.Retrievethe branch numbers along with the count of employees for brancheshaving more than 5 employees.
SELECT Book_title FROM Books WHERE Category = 'History';
-- 10 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING Total_Employees > 5;
