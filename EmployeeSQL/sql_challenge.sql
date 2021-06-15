DROP TABLE IF EXISTS "departments" CASCADE;
DROP TABLE IF EXISTS "dept_emp" CASCADE;
DROP TABLE IF EXISTS "dept_manager" CASCADE;
DROP TABLE IF EXISTS "employees" CASCADE;
DROP TABLE IF EXISTS "salaries" CASCADE;
DROP TABLE IF EXISTS "titles" CASCADE;

CREATE TABLE "titles" (
    "title_id" varchar(200)   NOT NULL,
    "title" varchar(200)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "departments" (
    "dept_no" varchar(200)   NOT NULL,
    "dept_name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(200)   REFERENCES "titles" ("title_id"),
    "birth_date" DATE   NOT NULL,
    "first_name" varchar(200)   NOT NULL,
    "last_name" varchar(200)   NOT NULL,
    "sex" varchar(200)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int	REFERENCES employees (emp_no),
    "dept_no" varchar(200)   REFERENCES departments (dept_no)
);

CREATE TABLE "dept_manager" (
    "emp_no" int   REFERENCES "employees" ("emp_no"),
    "dept_no" varchar(200)  REFERENCES "departments" ("dept_no")
);

CREATE TABLE "salaries" (
    "emp_no" int   REFERENCES "employees" ("emp_no"),
    "salary" int   NOT NULL
);

