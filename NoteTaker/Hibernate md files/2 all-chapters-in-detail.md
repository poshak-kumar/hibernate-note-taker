# Hibernate Topics Overview

Each of these topics has a detailed explanation. Follow the links below to jump to the respective sections:

- 1. [Introduction to Hibernate](#1-introduction-to-hibernate---1)
    - Overview of Hibernate, ORM, and its advantages.

- 2. [Setting Up Hibernate](#2-setting-up-hibernate---2)
    - Step-by-step guide to installing and configuring Hibernate.

- 3. [Hibernate Configuration](#3-hibernate-configuration---3)
    - How to configure Hibernate using XML (`hibernate.cfg.xml`) and annotations.

- 4. [Hibernate Core Concept](#4-hibernate-core-concepts---4)
    - Understanding SessionFactory, Session, Transaction, and other core components.

- 5. [Hibernate Mapping](#5-hibernate-mapping---5)
    - Mapping Java objects to database #tables and various types of mappings.

- 6. [Hibernate Query Language](#6-hibernate-query-language-hql---6)
    - Writing queries using HQL.

- 7. [Hibernate Criteria API](#7-hibernate-criteria-api---7)
    - The Hibernate Criteria API.

- 8. [Caching in Hibernate](#8-caching-in-hibernate---8)
    - Explanation of Hibernate's First-Level and Second-Level caches, and Query cache.

- 9. [Transactions and Concurrency](#9-transactions-and-concurrency---9)
    - Managing transactions and concurrency control in Hibernate.

- 10. [Fetching Strategies](#10-fetching-strategies---10)
    - Lazy and Eager loading, batch fetching, and avoiding the N+1 problem.
    - [Data Fetching Methods](#8-data-fetching-methods)

- 11. [Hibernate Relationships in Detail](#11-hibernate-relationships-in-detail---11)
    - Managing cascade types, orphan removal, and unidirectional vs bidirectional relationships.

- 12. [Inheritance Mapping in Hibernate](#12-inheritance-mapping-in-hibernate---12)
    - Mapping inheritance strategies like Single Table, Table per Class, and Joined Table.

- 13. [Integrating Hibernate with Other Frameworks](#13-integrating-hibernate-with-other-frameworks---13)
    - How to integrate Hibernate with Spring and use Spring Data JPA with Hibernate.

- 14. [Advanced Hibernate Topics](#14-advanced-hibernate-topics---14)
    - Custom types, working with collections, and more.

- 15. [Hibernate Validation](#15-hibernate-validation---15)
    - Using Hibernate Validator to enfor#ce validation constraints on entities.

- 16. [Hibernate Performance Optimization](#16-hibernate-performance-optimization---16)
    - Tips and techniques to optimize performance, such as batching and statistics.

- 17. [Best Practices and Troubleshooting](#17-best-practices-and-troubleshooting---17)
    - Best practices for using Hibernate and common issues with solutions.

- 18. [Testing Hibernate Applications](#18-testing-hibernate-applications---18)
    - How to unit test Hibernate using JUnit, Mockito, and other testing frameworks.

- 19. [Migration and Upgrades](#19-migration-and-upgrades---19)
    - Guidance on upgrading Hibernate versions and migrating between versions.

- 20. [Advanced Use Cases](#20-advanced-use-cases---20)
    - Event listeners, interceptors, and advanced lifecycle handling in Hibernate.

- 21. [Hibernate in the Cloud](#21-hibernate-in-the-cloud---21)
    - Configuring Hibernate for cloud databases and using Hibernate with cloud services.

- 22. [Security in Hibernate](#22-security-in-hibernate---22)
    - Best practices for preventing SQL injection and encrypting sensitive data.

- 23. [Commonly Used Hibernate Annotations](#23-commonly-used-hibernate-annotations---23)
    - Hibernate annotations are crucial for mapping Java classes and their properties to database tables and columns. Annotations make Hibernate configuration simpler and more readable, eliminating the need for complex XML mappings.

---
---


## **1. Introduction to Hibernate - 1**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Hibernate is one of the most popular Object-Relational Mapping (ORM) frameworks for Java applications. It simplifies the interaction between Java objects (POJOs - Plain Old Java Objects) and relational databases, automating the mapping between database tables and Java classes. Hibernate abstracts the underlying database interaction, allowing developers to focus on business logic rather than SQL and database connection details. Let’s break down this topic into its key components:

---

#### **What is ORM?**
**ORM (Object-Relational Mapping)** is a technique that allows developers to map object-oriented data structures (like Java classes) to relational databases (like tables, columns, rows). In traditional relational databases, the data is stored in tables with rows and columns, whereas in object-oriented programming (OOP), data is represented as objects with fields and methods.

ORM bridges the gap between these two paradigms:
- Objects map to database tables.
- Object fields (attributes) map to table columns.
- Object relationships (e.g., inheritance, composition) map to foreign keys or join tables in the relational model.

Without ORM, developers need to write a lot of boilerplate SQL code (for CRUD operations), and manually convert database records into Java objects and vice versa. ORM frameworks like Hibernate automate this process.

---

#### **What is Hibernate?**
**Hibernate** is a Java-based ORM framework that simplifies the process of developing Java applications that interact with relational databases. It takes care of common database operations, such as connecting to the database, performing CRUD (Create, Read, Update, Delete) operations, and managing transactions.

##### **Key Features of Hibernate:**
1. **Automatic SQL generation**: Hibernate automatically generates the necessary SQL statements for the database, making it unnecessary for the developer to write them manually.
2. **Database independence**: It supports many databases (MySQL, Oracle, PostgreSQL, etc.), making applications database-agnostic. Hibernate uses "dialects" to customize SQL for different databases.
3. **Automatic table mapping**: Maps Java objects to database tables and vice versa, eliminating the need for manual SQL and JDBC code.
4. **Caching mechanism**: Hibernate has a built-in caching system to optimize performance by reducing the number of database hits.
5. **Lazy and Eager Fetching**: Hibernate allows developers to decide whether to load related objects immediately (eager loading) or only when needed (lazy loading).
6. **Transaction Management**: Provides an abstraction layer for managing database transactions.
7. **HQL (Hibernate Query Language)**: Hibernate provides its own query language, HQL, which is similar to SQL but works with objects and their properties.
8. **Declarative mapping via annotations**: Hibernate allows declarative mappings using JPA annotations, making the configuration simple and more readable.

---

#### **Why Use Hibernate?**
Hibernate offers several advantages that make it a superior choice for Java developers who work with databases:

1. **Eliminates Boilerplate Code**: Hibernate removes the need to write repetitive code for opening/closing database connections, writing SQL queries, managing results, and converting database records into Java objects.
2. **Simplified Data Handling**: Java objects are directly mapped to database tables, so CRUD operations are straightforward.
3. **Automatic Table Generation**: Hibernate can generate database tables automatically from your entity classes, reducing the manual effort of creating and managing schema.
4. **Performance Optimization via Caching**: Hibernate supports both first-level and second-level caching, which can drastically reduce the number of database hits and improve application performance.
5. **Cross-Database Portability**: Hibernate supports multiple databases, so the same code can work across different database systems with minimal configuration changes.
6. **Reduced SQL Errors**: Since Hibernate generates SQL internally, there are fewer chances of runtime SQL errors.
7. **Declarative Transactions**: Transaction management becomes easier as Hibernate allows declarative transactions using annotations and XML.

---

#### **Advantages of Hibernate Over JDBC**
Before ORM tools like Hibernate, developers used JDBC (Java Database Connectivity) to interact with databases. While JDBC works, it requires manual SQL query writing, result set processing, and exception handling. Here’s how Hibernate improves over JDBC:

| Feature                     | JDBC                                   | Hibernate                                |
|------------------------------|----------------------------------------|------------------------------------------|
| **Boilerplate Code**          | Requires a lot of repetitive code      | Reduces boilerplate code significantly   |
| **Object to Table Mapping**   | Manual conversion of objects to tables | Automatic mapping between objects & tables |
| **Query Language**            | SQL, database-specific                 | HQL (Object-oriented, database-agnostic) |
| **Transaction Management**    | Manual management of transactions      | Built-in transaction management          |
| **Caching**                   | No caching support                     | First- and second-level caching          |
| **Lazy/Eager Loading**        | Not supported                          | Supported                                |
| **Database Switching**        | Difficult (SQL may vary)               | Easy with different Dialects             |
| **Schema Auto-generation**    | Not supported                          | Can auto-generate tables and schema      |

---

#### **Hibernate Architecture**
Hibernate’s architecture consists of several key components that work together to manage the database interaction:

1. **Configuration**: This component is responsible for loading the configuration properties (from `hibernate.cfg.xml` or annotations) that define the database connection settings, Hibernate properties, and class-to-table mappings.

2. **SessionFactory**: 
   - `SessionFactory` is the factory class responsible for creating `Session` objects.
   - It is a heavyweight object that is typically instantiated once and used across the application. It’s thread-safe and should be used as a singleton.
   - The `SessionFactory` is created based on the `Configuration` and is responsible for initializing database connections and providing a way to interact with the database.

3. **Session**: 
   - `Session` is an interface representing a single interaction between a Java application and the database.
   - It is used to perform CRUD operations and handle transactions. It is not thread-safe, and each thread should use its own session instance.
   - Common methods of `Session` include `save()`, `update()`, `delete()`, `get()`, and `load()`.

4. **Transaction**: 
   - This component manages database transactions. A transaction ensures that a set of database operations (e.g., save, update) is executed in a consistent and atomic manner.
   - Hibernate provides both programmatic and declarative transaction management.

5. **Query**: 
   - `Query` is an interface used to create and execute HQL or native SQL queries.
   - HQL (Hibernate Query Language) is an object-oriented query language that works with entity objects rather than directly with database tables.
   - `Query` can retrieve data, update records, or delete records.

6. **Criteria API**: 
   - The `Criteria` API is a programmatic alternative to HQL for building dynamic queries.
   - It allows developers to construct queries using Java objects and methods, providing a type-safe way to query entities.

7. **Entity**: 
   - An entity is a lightweight Java class that represents a table in the database.
   - Each entity is mapped to a specific table, and the fields of the entity correspond to the columns of the table.
   - Entities can be annotated with JPA annotations like `@Entity`, `@Table`, `@Id`, and `@Column` to define the mapping.

8. **Persistent Objects**: 
   - These are the Java objects that Hibernate manages and stores in the database. An object becomes persistent when it is saved using a Hibernate `Session`.
   - Persistent objects represent the data stored in a relational database.

---

#### **Hibernate vs JPA (Java Persistence API)**
While Hibernate is an ORM framework, JPA is a specification for ORM frameworks. JPA provides guidelines and standards for ORM implementations, and Hibernate is one of the implementations of JPA. Here’s a comparison between them:

- **JPA** is just a specification, a set of guidelines that various ORM frameworks must follow.
- **Hibernate** is a full-fledged ORM framework that implements the JPA specification and extends it with additional features.
  
**Key Differences:**
- **Standard vs Implementation**: JPA is the standard API, while Hibernate is the implementation.
- **Additional Features**: Hibernate provides several advanced features that are not part of the JPA specification, such as caching, batch processing, and custom SQL generation.
- **Annotations**: JPA annotations are part of the Java EE standard, whereas Hibernate offers additional annotations that provide more functionality.

---

#### **Components of Hibernate**

Here are the core components of the Hibernate framework:

1. **Session**: A `Session` is the primary interface for interacting with the database using Hibernate. Each session represents a single unit of work, and it provides methods to perform CRUD operations.
   - Example:
     ```java
     Session session = sessionFactory.openSession();
     session.beginTransaction();
     // perform some operations
     session.getTransaction().commit();
     session.close();
     ```

2. **SessionFactory**: As mentioned earlier, this is a thread-safe object responsible for managing sessions and database connections. It’s generally created at application startup and used throughout the application’s lifecycle.

3. **Transaction**: Used to group a series of operations into a single atomic action, ensuring that either all operations succeed or none do (rollback).

4. **Query and HQL**: Hibernate Query Language (HQL) is an object-oriented query language that uses entity objects and their properties rather than database tables and columns.
   - Example:
     ```java
     Query query = session.createQuery("from Employee where id = :id");
     query.setParameter("id", 1);
     Employee emp = (Employee) query.uniqueResult();
     ```

5. **Configuration**: Configures the Hibernate environment by reading

 settings from a configuration file (typically `hibernate.cfg.xml`) or through programmatic setup.

---

The introduction to Hibernate gives a foundational understanding of what Hibernate is, how it works, and why it’s beneficial to use it in Java applications. Hibernate solves the problem of object-relational impedance mismatch by providing seamless mapping between Java objects and relational databases. It automates common tasks like generating SQL queries, managing database connections, and handling transactions, allowing developers to focus on business logic rather than database details. Through its rich feature set, Hibernate improves the productivity of developers and the performance of Java applications.

---
---

## **2. Setting Up Hibernate - 2**

Go on [Hibernate all topics list](#hibernate-topics-overview).

When setting up Hibernate, you need to follow several essential steps to ensure that your Java application can successfully communicate with the database using the Hibernate ORM framework. Hibernate handles a lot of boilerplate code for database operations, but it still needs some initial configuration to work properly.

---

#### **2.1 Installing Hibernate**

Before you can use Hibernate in a Java application, you need to install or add the Hibernate libraries to your project. There are several ways to do this, depending on how you manage your dependencies. Let’s look at how you can do this with Maven, Gradle, or manually adding JAR files.

##### **2.1.1 Adding Hibernate with Maven**

Maven is a build automation tool commonly used in Java projects to manage dependencies. If your project uses Maven, you can add Hibernate as a dependency in your `pom.xml` file.

- Add Hibernate Core dependency in your Maven project:
  ```xml
  <!-- Hibernate Core dependency -->
    <dependency>
      <groupId>org.hibernate</groupId>
      <artifactId>hibernate-core</artifactId>
      <version>6.6.1.Final</version>
    </dependency>
  ```

- Add the necessary database driver for your database (for example, MySQL):
  ```xml
  <!-- MySQL Connector dependency for connecting to MySQL database -->
    <dependency>
      <groupId>mysql</groupId>
      <artifactId>mysql-connector-java</artifactId>
      <version>8.0.33</version>
    </dependency>
  ```

These dependencies will allow Maven to download the Hibernate and MySQL (or other databases) libraries and include them in your project.

##### **2.1.2 Adding Hibernate with Gradle**

If you’re using Gradle instead of Maven, you can add Hibernate as a dependency in your `build.gradle` file.

- Example:
  ```gradle
  implementation 'org.hibernate:hibernate-core:6.6.1.Final'
  implementation 'mysql:mysql-connector-java:8.0.33'
  ```

Gradle will handle the downloading and inclusion of the required Hibernate and database libraries.

##### **2.1.3 Adding Hibernate Manually**

If you're not using a build tool like Maven or Gradle, you can manually download the Hibernate JAR files and include them in your project. You'll also need to download the appropriate JDBC driver for your database.

- Download Hibernate from the official website [https://hibernate.org/](https://hibernate.org/).
- Download the necessary database driver for your specific database (e.g., MySQL, PostgreSQL, Oracle).
- Add the `.jar` files to your project’s classpath.

---

#### **2.2 Hibernate Core Libraries**

When setting up Hibernate, you must understand the core libraries that Hibernate depends on. Some of the key libraries required to run Hibernate are:

- **hibernate-core.jar**: The core functionality of Hibernate, which includes the ORM engine, transaction management, and session management.
- **hibernate-entitymanager.jar**: Provides JPA (Java Persistence API) support in Hibernate. This is needed if you plan to use JPA annotations and standards with Hibernate.
- **hibernate-jpa-2.1-api.jar**: Contains the JPA API specification. If you use Hibernate as a JPA provider, this jar is required.
- **JDBC Driver**: Hibernate needs a database-specific JDBC driver (like `mysql-connector-java` for MySQL, `postgresql` for PostgreSQL, etc.) to interact with the database.

Each of these libraries plays a role in enabling Hibernate to perform database operations, handle transactions, and map objects to relational tables.

---

#### **2.3 Configuring Hibernate**

To use Hibernate in an application, you need to configure several properties and specify how Hibernate will interact with the database. You can configure Hibernate in two ways: through an **XML configuration file** (`hibernate.cfg.xml`) or **annotations** in your Java classes. 

##### **2.3.1 Configuration with XML (`hibernate.cfg.xml`)**

The most traditional way to configure Hibernate is through an XML configuration file called `hibernate.cfg.xml`. This file is placed in the project's `src/main/resources` directory and contains information about the database connection, entity mappings, and other Hibernate properties.

Here is a breakdown of the key elements of a typical `hibernate.cfg.xml` file:

```xml
<hibernate-configuration>
    <session-factory>
        <!-- Database connection settings -->
        <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
        <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/mydatabase</property>
        <property name="hibernate.connection.username">root</property>
        <property name="hibernate.connection.password">password</property>

        <!-- JDBC properties -->
        <property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>
        <property name="hibernate.show_sql">true</property>
        <property name="hibernate.format_sql">true</property>

        <!-- Entity class mapping -->
        <mapping class="com.example.entity.Employee"/>

        <!-- Other Hibernate settings -->
        <property name="hibernate.hbm2ddl.auto">update</property>
    </session-factory>
</hibernate-configuration>
```

**Key Elements:**

- **hibernate.connection.driver_class**: Specifies the JDBC driver class for your database. In this case, it’s MySQL.
- **hibernate.connection.url**: The JDBC URL of your database, which tells Hibernate where your database is hosted.
- **hibernate.connection.username** and **hibernate.connection.password**: The database credentials for the user that Hibernate will use to connect to the database.
- **hibernate.dialect**: Defines the SQL dialect that Hibernate should use. Different databases have different SQL syntaxes, and this property helps Hibernate generate appropriate SQL. For example, `org.hibernate.dialect.MySQLDialect` is for MySQL databases.
- **hibernate.show_sql**: If set to `true`, Hibernate will log SQL statements to the console (helpful for debugging).
- **hibernate.format_sql**: When set to `true`, SQL queries printed to the console are formatted to be more readable.
- **hibernate.hbm2ddl.auto**: Controls how Hibernate handles schema updates and validations. It has several possible values:
  - `validate`: Validate the schema against the database, but make no changes.
  - `update`: Update the schema to match the entity mappings.
  - `create`: Create a new schema every time the session factory starts.
  - `create-drop`: Drop the schema when the session factory is closed.

---

##### **2.3.2 Configuration with Annotations**

In more modern Java applications, you can configure Hibernate using annotations directly within your Java entity classes. This is the preferred approach when using JPA (Java Persistence API) with Hibernate, as it makes the configuration part of your codebase rather than relying on external XML files.

**Example of an Entity Class Using Annotations:**

```java
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;

@Entity
@Table(name = "Employee")
public class Employee {
    
    @Id
    @Column(name = "id")
    private int id;
    
    @Column(name = "name")
    private String name;
    
    @Column(name = "salary")
    private double salary;

    // Getters and setters
}
```

**Key Annotations:**
- **@Entity**: This annotation marks the class as a persistent entity, meaning it will be mapped to a database table.
- **@Table(name = "Employee")**: This specifies the name of the table in the database to which this entity class will be mapped. If the table name is the same as the class name, this annotation is optional.
- **@Id**: Marks the field as the primary key.
- **@Column(name = "name")**: Maps the field to a specific column in the table.

Annotations are cleaner and more intuitive for modern projects, and using them reduces the need for XML configurations.

---

#### **2.4 Setting Up the Database Connection Properties**

Whether you're using XML or annotations, you need to set up your database connection properties correctly. These properties tell Hibernate how to connect to your specific database.

##### **Database Connection Properties**:
1. **hibernate.connection.url**: The JDBC URL for your database. For example, `jdbc:mysql://localhost:3306/mydatabase`.
2. **hibernate.connection.username**: The database username.
3. **hibernate.connection.password**: The database password.
4. **hibernate.connection.driver_class**: The fully qualified name of the JDBC driver class. For example, `com.mysql.cj.jdbc.Driver` for MySQL.
5. **hibernate.dialect**: The Hibernate dialect is a class that abstracts SQL variations between different relational databases. You must specify the appropriate dialect for your database (e.g., `MySQLDialect`, `PostgreSQLDialect`, `OracleDialect`).

These properties are essential as Hibernate needs this information to establish a connection with your database and interact with it.

---

#### **2.5 Hibernate Dialects**

A dialect in Hibernate is an abstraction that allows the framework to generate SQL statements that are specific to the underlying database. Since each relational database has slightly different SQL syntax, Hibernate needs to know which SQL syntax to use when generating queries.

Some common dialects:
- **org.hibernate.dialect.MySQLDialect**: For MySQL databases.
- **org.hibernate.dialect.PostgreSQLDialect**: For PostgreSQL databases.
- **org.hibernate.dialect.OracleDialect**: For Oracle databases.
- **org.hibernate.dialect.SQL

ServerDialect**: For Microsoft SQL Server.

By setting the correct dialect, Hibernate will generate appropriate SQL for your database.

---

#### **2.6 Testing the Hibernate Configuration**

After setting up Hibernate, you can write a simple test to ensure that everything is configured correctly. Typically, this involves creating a simple `main` method, obtaining a Hibernate `SessionFactory`, and testing the connection to the database.

Example:

```java
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateTest {
    public static void main(String[] args) {
        // Create a SessionFactory using hibernate.cfg.xml
        SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();

        // Obtain a session from the SessionFactory
        Session session = factory.openSession();
        
        // Perform database operations (e.g., testing connection)
        System.out.println("Hibernate setup is successful!");

        // Close session and factory
        session.close();
        factory.close();
    }
}
```

This code tests whether Hibernate can create a session factory and connect to the database successfully.

---

### **2.7 Common Setup Issues**

During the setup, common issues can arise, such as:
- **Driver Class Not Found**: Ensure the correct JDBC driver is in your classpath.
- **Incorrect Dialect**: Check that the dialect you are using matches your database type.
- **Connection URL Errors**: Ensure that the JDBC URL is correctly formed and points to the correct database.

---

With these steps, you will have successfully set up Hibernate in your Java project. Once configured, Hibernate can handle complex data operations with minimal effort.

---
---

## **3. Hibernate Configuration - 3**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Hibernate configuration is one of the most critical steps in setting up Hibernate for an application. It allows Hibernate to connect to the database, understand entity classes, and configure various settings that affect how Hibernate operates. In this chapter, we will explore everything related to Hibernate configuration in detail, covering both XML-based and annotation-based approaches.

---

#### **1. Hibernate Configuration File (hibernate.cfg.xml)**

The primary configuration file for Hibernate is the `hibernate.cfg.xml`. It defines the necessary properties for Hibernate to work with the database and contains mapping information for the entity classes.

Here is a breakdown of the important elements in `hibernate.cfg.xml`:

**Hibernate DTD-**
```xml
<!DOCTYPE hibernate-configuration PUBLIC
	"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
	"http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">

```

```xml
<hibernate-configuration>
    <session-factory>
        <!-- Database connection settings -->
        <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
        <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/mydb</property>
        <property name="hibernate.connection.username">root</property>
        <property name="hibernate.connection.password">password</property>

        <!-- Hibernate dialect -->
        <property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>

        <!-- Hibernate settings -->
        <property name="hibernate.show_sql">true</property>  <!-- Show generated SQL in console -->
        <property name="hibernate.format_sql">true</property> <!-- Format SQL for readability -->
        <property name="hibernate.hbm2ddl.auto">update</property> <!-- Schema auto-update -->
        
        <!-- Entity mapping -->
        <mapping class="com.example.entity.Employee"/>
    </session-factory>
</hibernate-configuration>
```

##### **Key Elements of `hibernate.cfg.xml`**

1. **Database Connection Properties**:
   - **`hibernate.connection.driver_class`**: Specifies the JDBC driver class to connect to the database.
   - **`hibernate.connection.url`**: The JDBC URL to connect to your database (e.g., MySQL, PostgreSQL).
   - **`hibernate.connection.username`** and **`hibernate.connection.password`**: The credentials for accessing the database.

2. **Hibernate Dialect**:
   Hibernate requires the dialect to generate SQL statements that are compatible with the specific database. Hibernate includes predefined dialects for many databases:
   - **`hibernate.dialect`**: For example, `org.hibernate.dialect.MySQLDialect` for MySQL, `org.hibernate.dialect.PostgreSQLDialect` for PostgreSQL, etc.

3. **Hibernate Settings**:
   - **`hibernate.show_sql`**: If set to `true`, it will show the generated SQL statements in the console, which is helpful for debugging.
   - **`hibernate.format_sql`**: When set to `true`, it formats the SQL queries for better readability.
   - **`hibernate.hbm2ddl.auto`**: Controls the automatic schema generation and update:
     - `create`: Creates the schema from scratch every time the SessionFactory is started.
     - `update`: Updates the schema, preserving the existing data.
     - `create-drop`: Creates the schema and drops it when the SessionFactory is closed.
     - `validate`: Validates that the schema matches the mappings, without making any changes.
   
4. **Entity Mapping**:
   - **`<mapping class="..."/>`**: Specifies the entity classes that Hibernate should manage and map to database tables. In this example, `Employee` is the mapped entity class.

##### **Complete Example of `hibernate.cfg.xml` for MySQL**:

```xml
<hibernate-configuration>
    <session-factory>
        <!-- Database connection settings -->
        <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
        <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/mydb</property>
        <property name="hibernate.connection.username">root</property>
        <property name="hibernate.connection.password">password</property>

        <!-- MySQL Dialect -->
        <property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>

        <!-- Hibernate settings -->
        <property name="hibernate.show_sql">true</property>
        <property name="hibernate.format_sql">true</property>
        <property name="hibernate.hbm2ddl.auto">update</property>

        <!-- Cache settings (optional) -->
        <property name="hibernate.cache.use_second_level_cache">true</property>
        <property name="hibernate.cache.region.factory_class">
            org.hibernate.cache.ehcache.EhCacheRegionFactory
        </property>

        <!-- Entity class mappings -->
        <mapping class="com.example.entity.Employee"/>
    </session-factory>
</hibernate-configuration>
```

---

#### **2. Configuring Hibernate Programmatically**

Instead of using XML, you can configure Hibernate programmatically using the `Configuration` class. This is useful when you want to configure Hibernate dynamically, or when you want to avoid maintaining an XML file.

Here’s an example of configuring Hibernate programmatically:

```java
Configuration configuration = new Configuration();

// Set Hibernate properties
configuration.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
configuration.setProperty("hibernate.connection.driver_class", "com.mysql.cj.jdbc.Driver");
configuration.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:3306/mydb");
configuration.setProperty("hibernate.connection.username", "root");
configuration.setProperty("hibernate.connection.password", "password");
configuration.setProperty("hibernate.show_sql", "true");
configuration.setProperty("hibernate.format_sql", "true");
configuration.setProperty("hibernate.hbm2ddl.auto", "update");

// Add annotated classes
configuration.addAnnotatedClass(Employee.class);

// Build the SessionFactory
SessionFactory sessionFactory = configuration.buildSessionFactory();
```

In this code:
- The `Configuration` object is used to set Hibernate properties.
- We programmatically add the `Employee` class as a mapped entity.
- Finally, the `SessionFactory` is built.

---

#### **3. Hibernate Annotations Configuration**

Hibernate also supports annotations to reduce XML configuration and keep everything inside your Java code. It uses JPA annotations to define entity mappings, table names, and relationships.

To enable annotations, you still need the basic database configuration in `hibernate.cfg.xml` or programmatically. However, mappings can be handled via annotations within entity classes.

##### **Example Entity Class with Annotations**:

```java
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Column;

@Entity
@Table(name = "employee")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "salary")
    private double salary;

    // Getters and setters
}
```

In this example:
- The **`@Entity`** annotation marks this class as a Hibernate entity.
- The **`@Table`** annotation specifies the database table to map (`employee`).
- The **`@Id`** annotation identifies the primary key.
- The **`@GeneratedValue(strategy = GenerationType.IDENTITY)`** indicates that the primary key will be auto-generated by the database.
- The **`@Column`** annotation specifies the column name for each field.

With annotations, you don’t need to declare the mapping in `hibernate.cfg.xml`. Hibernate will automatically map the class to the corresponding table and columns based on the annotations.

---

#### **4. SessionFactory Configuration**

The `SessionFactory` is a heavyweight object responsible for managing database connections and providing `Session` objects. It is typically created once during application startup and used throughout the application's lifetime.

##### **Creating SessionFactory from Configuration**:

```java
Configuration configuration = new Configuration();
configuration.configure();  // Automatically loads hibernate.cfg.xml
SessionFactory sessionFactory = configuration.buildSessionFactory();

// You can done this ☝️☝️☝️in only one line
// SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
```

- **`configure()`**: Automatically loads the `hibernate.cfg.xml` file and configures Hibernate accordingly.
- **`buildSessionFactory()`**: Creates the `SessionFactory`, which is used to create `Session` objects for interacting with the database.

##### **Creating SessionFactory with Annotations**:

If you use annotations, you need to add the annotated class explicitly when creating the `SessionFactory`:

```java
Configuration configuration = new Configuration();
configuration.configure();  // Load hibernate.cfg.xml
configuration.addAnnotatedClass(Employee.class);  // Add annotated entity
SessionFactory sessionFactory = configuration.buildSessionFactory();
```

Once the `SessionFactory` is created, it should be reused throughout the application because it's expensive to create.

**Detailed Example:**

- Create a hibernate.cfg.xml file first-

```xml
<!DOCTYPE hibernate-configuration PUBLIC
	"-//Hibernate/Hibernate Configuration DTD 3.0//EN"
	"http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <property name="connection.driver_class">com.mysql.jdbc.Driver</property>
        <property name="connection.url">jdbc:mysql://localhost:3306/myhiber</property>
        <property name="connection.username">root</property>
        <property name="connection.password">mayank</property>
        <property name="dialect">org.hibernate.dialect.MySQLDialect</property>
        <property name="hbm2ddl.auto">update</property>
        <property name="show_sql">true</property>

        <!-- Add this property for thread-bound session -->
        <property name="hibernate.current_session_context_class">thread</property>

        <mapping class="com.hiber.Student"/>
    </session-factory>
</hibernate-configuration>
```
- Create a Student class (Entity class)-

```java
package com.hiber;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Student {

    @Id
    private int id;
    private String name;
    private String city;

    public Student() {
        super();
    }
    public Student(int id, String name, String city) {
        this.id = id;
        this.name = name;
        this.city = city;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    @Override
    public String toString() {
        return "Student [id=" + id + ", name=" + name + ", city=" + city + ", getId()=" + getId() + ", getName()="
                + getName() + ", getCity()=" + getCity() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
                + ", toString()=" + super.toString() + "]";
    }

}

```

- Now create a Main class (App.java) to run the program

```java
package com.hiber;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class App {
    public static void main(String[] args) {
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        
        // Creating Student
        Student st1 = new Student();
        st1.setId(11);
        st1.setName("Raj");
        st1.setCity("Delhi");

        System.out.println(st1);

        // Session session = sessionFactory.openSession(); // You can also use this openSession() method
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        session.save(st1); // The method save(Object) from the type Session is deprecated since version 6.0
        session.getTransaction().commit();

        session.close();
    }
}

```

To learn about **getCurrentSession()** and **openSession()** methods in detail then [click here](./3%20getCurrentSession-openSession.md).

In Hibernate 6.0 and above, the `Session.save(Object)` method has been deprecated. Instead, you can use the `persist(Object)` method, which serves a similar purpose.

The key difference is that `persist()` doesn't return the generated identifier, whereas `save()` does. The Hibernate team deprecated `save()` to encourage a more consistent approach with JPA (Java Persistence API), which uses `persist()` for saving new entities.

Here’s an example of how you can update your code:

#### Before (using `save()`):
```java
Session session = sessionFactory.openSession();
session.beginTransaction();
session.save(entity);  // Deprecated in Hibernate 6.0
session.getTransaction().commit();
session.close();
```

#### After (using `persist()`):
```java
Session session = sessionFactory.openSession();
session.beginTransaction();
session.persist(entity);  // Use persist() instead of save()
session.getTransaction().commit();
session.close();
```

If you need the generated ID after persisting, you can still get it from the entity (assuming you have proper mappings). Alternatively, you can explore using `Session.persistAndFetch(Object)` if available in your specific setup.

---

#### **5. Database Connection Pooling**

Hibernate can manage database connection pooling, which improves performance by reusing existing connections instead of creating a new one every time a `Session` is opened.

You can configure connection pooling in `hibernate.cfg.xml`:

```xml
<property name="hibernate.c3p0.min_size">5</property>
<property name="hibernate.c3p0.max_size">20</property>
<property name="hibernate.c3p0.timeout">300</property>
<property name="hibernate.c3p0.max_statements">50</property>
<property name="hibernate.c3p0.idle_test_period">3000</property>
```

These settings configure the following:
- **`hibernate.c3p0.min_size`**: Minimum number of connections in the pool.
- **`hibernate.c3p0.max_size`**: Maximum number of connections in the pool.
- **`hibernate.c3p0.timeout`**: The timeout before a connection is closed.
- **`hibernate.c3p0.max_statements`**: The maximum number of prepared statements.
- **`hibernate.c3p0.idle_test_period`**: Periodically test idle connections.

Using connection pooling optimizes database operations

 by reducing the overhead of establishing and tearing down database connections.

---

#### **6. Externalizing Hibernate Properties**

If you want to keep your configuration flexible, you can externalize your Hibernate settings to a `.properties` file, separate from the main `hibernate.cfg.xml`. For instance, the following file (`hibernate.properties`) might contain:

```properties
hibernate.dialect = org.hibernate.dialect.MySQLDialect
hibernate.connection.driver_class = com.mysql.cj.jdbc.Driver
hibernate.connection.url = jdbc:mysql://localhost:3306/mydb
hibernate.connection.username = root
hibernate.connection.password = password
hibernate.show_sql = true
hibernate.format_sql = true
hibernate.hbm2ddl.auto = update
```

You can load this properties file in Java:

```java
Configuration configuration = new Configuration();
configuration.addProperties(new Properties().load(new FileInputStream("hibernate.properties")));
SessionFactory sessionFactory = configuration.buildSessionFactory();
```

This approach gives you flexibility if you want to change configuration settings without modifying code or the main XML configuration.

---

Hibernate configuration plays a crucial role in defining how Hibernate interacts with the database and how it manages your entity mappings. Whether using XML or annotations, understanding how to properly configure Hibernate is essential for building efficient, maintainable applications.

Key points include:
- Configuring database connections.
- Managing entity mappings and Hibernate settings.
- Choosing between XML-based and programmatic configuration.
- Setting up connection pooling.
- Using annotations to simplify entity mappings.

This chapter is the foundation for setting up Hibernate in any Java project.

---
---

## **4. Hibernate Core Concepts - 4**

Go on [Hibernate all topics list](#hibernate-topics-overview).

The "Core Concepts" of Hibernate are the building blocks that define how Hibernate works as an ORM (Object-Relational Mapping) framework. Understanding these concepts is essential to working with Hibernate effectively and efficiently. Let’s go through the key concepts in detail:

---

### **4.1 Session**

The **Session** in Hibernate is the primary interface through which you interact with the database. It represents a single unit of work with the database and acts as a factory for transaction management, query execution, and CRUD (Create, Read, Update, Delete) operations on entities.

#### **Key Characteristics of `Session`**
- **Not Thread-Safe**: A `Session` object is not thread-safe, so each request or transaction should have its own session.
- **Transaction Scope**: Typically, a session corresponds to a single unit of work, meaning one session per transaction.
- **Connection Management**: Hibernate's session abstracts the complexity of JDBC `Connection` handling.
- **Cache Mechanism**: The session implements the first-level cache. Once an entity is loaded within a session, Hibernate caches it so that any subsequent requests for that entity do not hit the database again.

#### **Important Session Methods**
- **`save()`**: Used to persist a transient object into the database. If the entity is transient, it will assign a primary key and insert it into the database.
  ```java
  session.save(employee);
  ```
- **`get()`**: Retrieves an entity from the database using its primary key. If the entity is found, it returns it; otherwise, it returns `null`.
  ```java
  Employee emp = session.get(Employee.class, 1);
  ```
- **`load()`**: Similar to `get()`, but if the entity is not found, it throws a `HibernateException`. It also returns a proxy object that is lazily initialized.
  ```java
  Employee emp = session.load(Employee.class, 1);
  ```
- **`update()`**: Used to reattach a detached object to a session and update its state in the database.
  ```java
  session.update(employee);
  ```
- **`delete()`**: Removes an entity from the database.
  ```java
  session.delete(employee);
  ```

#### **Session Lifecycle**
1. **Open**: You open a session using `SessionFactory`.
2. **Transaction**: Begin a transaction and perform operations (insert, update, delete).
3. **Close**: After the operations are complete, close the session.

Example usage of a `Session`:
```java
Session session = sessionFactory.openSession();
Transaction transaction = session.beginTransaction();

try {
    Employee employee = new Employee();
    employee.setName("John");
    session.save(employee);
    transaction.commit();
} catch (Exception e) {
    transaction.rollback();
} finally {
    session.close();
}
```

---

### **4.2 SessionFactory**

**`SessionFactory`** is a heavyweight object that serves as a factory for creating `Session` objects. It is thread-safe and is typically instantiated only once at the startup of the application. Since creating a `SessionFactory` is expensive, it is designed to be shared among multiple threads and throughout the application lifecycle.

#### **Key Characteristics of `SessionFactory`**
- **Thread-safe**: Can be safely used by multiple threads.
- **Singleton**: Often, a single `SessionFactory` is created per database and used across the entire application.
- **Immutable**: Once configured, you cannot change its configuration.

#### **How to Create `SessionFactory`**
You configure a `SessionFactory` typically by using the `Configuration` object, which reads settings from an XML file or Java annotations.

Example:
```java
Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
SessionFactory sessionFactory = configuration.buildSessionFactory();
```

#### **SessionFactory Lifecycle**
- Created during application initialization (e.g., in a `ServletContextListener` for web applications).
- It lasts for the duration of the application and is closed when the application shuts down.

---

### **4.3 Transaction**

The **Transaction** object in Hibernate ensures that the operations you perform within a session are executed within the boundaries of a database transaction. It is a critical part of maintaining the integrity of the database, ensuring that multiple operations either complete successfully or fail as a whole.

#### **Key Characteristics of `Transaction`**
- **ACID Properties**: Transactions in Hibernate respect the ACID properties (Atomicity, Consistency, Isolation, Durability) of database transactions.
- **Explicit Control**: You explicitly begin, commit, or roll back transactions.
- **Rollback Mechanism**: If any error occurs during a transaction, you can roll back the entire transaction to maintain data integrity.

#### **Common Methods**
- **`beginTransaction()`**: Starts a new transaction.
  ```java
  Transaction transaction = session.beginTransaction();
  ```
- **`commit()`**: Commits the transaction, making all changes permanent in the database.
  ```java
  transaction.commit();
  ```
- **`rollback()`**: Rolls back the transaction, discarding all changes since the transaction began.
  ```java
  transaction.rollback();
  ```

#### **Transaction Example**
```java
Session session = sessionFactory.openSession();
Transaction transaction = session.beginTransaction();

try {
    Employee emp = new Employee();
    emp.setName("John Doe");
    session.save(emp);
    transaction.commit(); // Commit the transaction
} catch (Exception e) {
    transaction.rollback(); // Rollback in case of error
} finally {
    session.close(); // Always close the session
}
```

---

### **4.4 Query**

The **Query** interface in Hibernate is used to execute HQL (Hibernate Query Language) or native SQL queries. It is a powerful feature that abstracts SQL queries into object-oriented HQL queries.

#### **Key Characteristics of `Query`**
- **HQL**: Queries are written using Hibernate's HQL, which works with entity objects and their properties instead of raw database tables.
- **SQL Support**: Hibernate also allows the execution of native SQL queries.
- **Parameter Binding**: You can bind parameters to avoid SQL injection.
- **Pagination Support**: Hibernate provides methods for paginating results.

#### **Query Types**
1. **HQL Queries**: Object-oriented queries written in Hibernate Query Language.
   ```java
   Query query = session.createQuery("from Employee where name = :name");
   query.setParameter("name", "John");
   List<Employee> employees = query.list();
   ```
2. **Native SQL Queries**: If you need to use raw SQL queries.
   ```java
   Query query = session.createSQLQuery("SELECT * FROM Employee WHERE name = :name");
   query.setParameter("name", "John");
   List<Object[]> employees = query.list();
   ```

#### **Pagination with Query**
Hibernate provides methods for paginating query results, which is useful when dealing with large datasets:
- **`setFirstResult()`**: Specifies the index of the first result to be retrieved.
- **`setMaxResults()`**: Specifies the maximum number of results to be retrieved.
  
Example:
```java
Query query = session.createQuery("from Employee");
query.setFirstResult(0); // Start from the first result
query.setMaxResults(10); // Limit to 10 results
List<Employee> employees = query.list();
```

#### **Named Queries**
You can also define named queries using annotations or XML, which can be reused throughout the application.
```java
@NamedQuery(
  name = "Employee.findByName",
  query = "from Employee where name = :name"
)
```

---

### **4.5 Hibernate Object State | Persistent Life Cycle**

In Hibernate, objects can exist in four different states during their lifecycle: **Transient**, **Persistent**, **Detached**, and **Removed**. Each state reflects the association (or lack thereof) between the object and a database session (session is a connection to the database). Here's a detailed look at each of these states and the transition process between them:

#### 1. **Transient State**
   - **Description**: An object is in the **Transient** state when it is created using the `new` keyword and has not yet been associated with any Hibernate session. In this state, the object is just an instance in memory with no corresponding record in the database.
   - **Characteristics**:
     - Not associated with any Hibernate session.
     - Not mapped to any database row.
     - Changes made to the object will not affect the database unless it transitions to a Persistent state.
     - No primary key is assigned yet.
   - **Example**:
     ```java
     Employee emp = new Employee(); // emp is in Transient state
     emp.setName("John");
     emp.setSalary(50000);
     ```

#### 2. **Persistent State**
   - **Description**: An object enters the **Persistent** state when it is associated with a Hibernate session, typically by calling `session.save()`, `session.persist()`, or by loading the object from the database using `session.get()` or `session.load()`. In this state, the object is linked to a database record and any changes made to the object will automatically be reflected in the database when the transaction is committed.
   - **Characteristics**:
     - Associated with a Hibernate session.
     - Mapped to a database row.
     - Any changes made to the object’s properties will be automatically synchronized with the database, usually at the end of the transaction or by calling `session.flush()`.
     - Has a unique identifier (primary key) assigned.
   - **Example**:
     ```java
     Session session = sessionFactory.openSession();
     Transaction tx = session.beginTransaction();

     Employee emp = new Employee();
     emp.setName("Alice");
     emp.setSalary(60000);

     session.save(emp); // emp is now Persistent
     tx.commit();
     session.close();
     ```
   - **Note**: When the session is open, any modifications to the object (e.g., `emp.setSalary(65000);`) will automatically be saved to the database when `flush()` or `commit()` is called.

#### 3. **Detached State**
   - **Description**: An object enters the **Detached** state when the session that was managing it is closed or explicitly evicted (`session.evict()`) from the session cache. Detached objects represent data that is still mapped to the database, but there’s no active session managing it. If you want to persist changes made to a Detached object, you must reattach it to a session using methods like `session.update()` or `session.merge()`.
   - **Characteristics**:
     - Not associated with an active session, but still has a representation in the database.
     - Any changes made to the object will not be synchronized with the database unless reattached to a session.
     - Useful for long-lived objects in applications that may require working with data outside of a session context.
   - **Example**:
     ```java
     Session session1 = sessionFactory.openSession();
     Employee emp = session1.get(Employee.class, empId);
     session1.close(); // emp is now Detached

     emp.setSalary(70000); // changes will not be saved automatically

     Session session2 = sessionFactory.openSession();
     session2.update(emp); // emp reattaches and becomes Persistent
     session2.close();
     ```
   - **Transition**: Detached objects can be reattached to a session to become Persistent again.

#### 4. **Removed State**
   - **Description**: An object enters the **Removed** state when it is scheduled for deletion from the database. You can delete the object using `session.delete()`, which removes the database row associated with the object upon flushing or committing the transaction. The object remains in memory but will not be saved in the database unless saved again in a Persistent state.
   - **Characteristics**:
     - Associated with a session but scheduled for deletion.
     - Once the transaction is committed or `flush()` is called, the record is permanently removed from the database.
     - The object is still in memory but is no longer mapped to any database row.
   - **Example**:
     ```java
     Session session = sessionFactory.openSession();
     Transaction tx = session.beginTransaction();

     Employee emp = session.get(Employee.class, empId);
     session.delete(emp); // emp is now in Removed state
     
     tx.commit(); // emp's record is deleted from the database
     session.close();
     ```

#### Lifecycle Transitions
- **Transient to Persistent**: Call `session.save()`, `session.persist()`, or `session.saveOrUpdate()`.
- **Persistent to Detached**: Close the session, or call `session.evict()`.
- **Detached to Persistent**: Reattach to a session using `session.update()`, `session.merge()`, or `session.lock()`.
- **Persistent to Removed**: Call `session.delete()` on a Persistent object.

#### Summary Table

| **State**     | **Associated with Session?** | **Mapped to DB Row?** | **Changes Saved Automatically?** | **Example Method**       |
|---------------|------------------------------|------------------------|----------------------------------|---------------------------|
| Transient     | No                           | No                     | No                               | `new`                     |
| Persistent    | Yes                          | Yes                    | Yes                              | `session.save()`          |
| Detached      | No                           | Yes                    | No                               | `session.evict()`, `close()` |
| Removed       | Yes (until flush)            | No (after flush)       | N/A                              | `session.delete()`        |

This understanding of the Hibernate object states helps ensure efficient data management and synchronization between application memory and the database.

---

### **4.6 Entity Lifecycle**

Understanding the lifecycle of an entity in Hibernate helps to control its state transitions more effectively.

#### **Entity States Recap**
1. **Transient**: Object exists in memory but is not associated with any session.
2. **Persistent**: Object is associated with a session and database.
3. **Detached**: Object is still in memory but no longer associated with an active session.
4. **Removed**: Object is marked for deletion and will be removed from the database.

#### **Important Methods

 for State Management**
- **`save()`**: Moves an object from the transient to the persistent state.
- **`update()`**: Reattaches a detached object to a session.
- **`delete()`**: Moves an object from the persistent state to the removed state.
- **`merge()`**: Similar to `update()`, but works on a detached object, copying its changes to the current session.

---

These core concepts form the backbone of Hibernate's functioning. Mastering them will help you build robust, scalable, and efficient applications using Hibernate.
  
---
---

## **5. Hibernate Mapping - 5**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Hibernate mapping is the process by which Java objects (also known as entities) are linked to database tables. This is a fundamental feature of Hibernate, as it allows Hibernate to manage the persistence of Java objects (POJOs) into relational databases in a transparent manner.

There are two main ways to define the mapping between Java objects and database tables:
1. **XML Configuration (Legacy approach)**.
2. **Annotations (Modern approach)**.

In this chapter, we will explore the details of both approaches and cover all aspects of mapping, from basic field mappings to complex relationships like one-to-one, one-to-many, many-to-many, and composite keys.

---

### **1. Basic Entity Mapping**

#### **Mapping a Java Class to a Database Table**
In Hibernate, an entity is a simple Java class (also called POJO — Plain Old Java Object) that is mapped to a table in a database. Each instance of this class represents a row in the table.

Using Annotations:
- The `@Entity` annotation is used to mark a class as an entity, meaning it is mapped to a database table.
- The `@Table` annotation specifies the table name in the database if it's different from the default name.

**Example**:
```java
@Entity
@Table(name = "employees")  // Maps to 'employees' table in the database
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Primary key with auto-increment
    private int id;

    @Column(name = "name")  // Column in the 'employees' table
    private String name;

    @Column(name = "designation")
    private String designation;

    // Getters and Setters
}
```

In this example:
- The `@Entity` annotation maps the class `Employee` to a table named `employees`.
- The `@Id` annotation marks the `id` field as the primary key.
- The `@GeneratedValue(strategy = GenerationType.IDENTITY)` specifies the strategy for generating the primary key values (auto-increment in MySQL, for example).
- The `@Column` annotation maps the `name` and `designation` fields to the respective columns in the `employees` table.

---

#### **Primary Key Mapping**
Every entity must have a primary key, which uniquely identifies each record in the table. The primary key can be a single column or a combination of multiple columns (composite key).

**Primary Key Generation Strategies**:
1. `GenerationType.IDENTITY`: Auto-increment or identity column in the database.
2. `GenerationType.SEQUENCE`: Uses a database sequence to generate the primary key.
3. `GenerationType.TABLE`: Uses a separate table in the database to generate the primary key.
4. `GenerationType.AUTO`: Automatically selects the appropriate generation strategy depending on the database.

**Example using SEQUENCE**:
```java
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "prod_seq")
    @SequenceGenerator(name = "prod_seq", sequenceName = "PRODUCT_SEQ", allocationSize = 1)
    private int productId;

    private String productName;
}
```
In this example, Hibernate uses a database sequence named `PRODUCT_SEQ` to generate the primary key values.

---

### **2. Field Mapping**

#### **Mapping Basic Types**
Each field of the Java class can be mapped to a column in the table. Hibernate automatically maps Java data types to their respective SQL types. Common mappings include:
- `String` → `VARCHAR`
- `int` → `INTEGER`
- `boolean` → `BIT` or `BOOLEAN`
- `Date` → `DATE` or `TIMESTAMP`

If the column name is different from the field name, you can explicitly specify it using the `@Column` annotation.

**Example**:
```java
@Entity
@Table(name = "employees")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "employee_name")  // Maps 'employee_name' column to 'name' field
    private String name;

    @Column(name = "is_active", nullable = false)
    private boolean active;
}
```

#### **Column Constraints**
You can define column constraints such as `nullable`, `unique`, `length`, and `precision` directly in the mapping.

- `nullable = false`: Specifies that the column cannot contain `null` values.
- `unique = true`: Ensures that all values in the column are unique.
- `length`: Defines the maximum length for `String` fields.
- `precision` and `scale`: Used for `BigDecimal` fields to define the precision and scale of the decimal values.

**Example**:
```java
@Column(name = "salary", nullable = false, precision = 10, scale = 2)
private BigDecimal salary;
```
This example specifies that the `salary` column cannot be `null` and will store decimal numbers with up to 10 digits, including 2 decimal places.

---

### **3. Mapping Relationships**

#### **One-to-One Relationship**
In a one-to-one relationship, one entity is associated with exactly one instance of another entity.

There are two ways to implement one-to-one relationships in Hibernate:
1. Using a foreign key in one of the tables.
2. Using a shared primary key between both entities.

**Example (One-to-One with Foreign Key)**:
```java
@Entity
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address_id")  // Foreign key column
    private Address address;
}
```

In this example, each `Employee` has one `Address`. The `@JoinColumn` annotation specifies the column that acts as a foreign key in the `Employee` table.

#### **One-to-Many Relationship**
A one-to-many relationship is where one entity is related to many instances of another entity. This can be implemented using a `List`, `Set`, or `Collection` in Java.

**Example (One-to-Many)**:
```java
@Entity
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToMany(mappedBy = "department", cascade = CascadeType.ALL)
    private Set<Employee> employees;
}
```
Here, one `Department` can have many `Employees`. The `mappedBy` attribute refers to the `department` field in the `Employee` class, indicating the ownership of the relationship.

**Inverse Mapping (in `Employee` class)**:
```java
@Entity
public class Employee {
    @ManyToOne
    @JoinColumn(name = "department_id")  // Foreign key
    private Department department;
}
```
In this example, the `Employee` class refers to the `Department` class using a foreign key column `department_id`.

#### **Many-to-One Relationship**
This is the inverse of a one-to-many relationship. Many instances of one entity are associated with one instance of another entity.

The example provided in the one-to-many relationship applies here. In the `Employee` class, the `ManyToOne` relationship indicates that many employees can belong to a single department.

#### **Many-to-Many Relationship**
A many-to-many relationship is where multiple entities are associated with multiple instances of another entity. This is typically represented by a join table that holds the primary keys of both entities.

**Example (Many-to-Many)**:
```java
@Entity
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
        name = "project_employee", 
        joinColumns = { @JoinColumn(name = "project_id") }, 
        inverseJoinColumns = { @JoinColumn(name = "employee_id") }
    )
    private Set<Employee> employees = new HashSet<>();
}
```

In this example, the `Project` class is mapped to the `Employee` class with a many-to-many relationship, which means multiple employees can work on multiple projects. The `@JoinTable` annotation specifies the name of the join table (`project_employee`) and defines the foreign keys (`project_id` and `employee_id`).

**Inverse Mapping (in `Employee` class)**:
```java
@Entity
public class Employee {
    @ManyToMany(mappedBy = "employees")
    private Set<Project> projects = new HashSet<>();
}
```
Here, the `mappedBy` attribute indicates that the `Project` entity owns the relationship.

---

### **4. Composite Primary Key**

A composite primary key is a primary key that consists of more than one column. Hibernate provides two ways to map composite primary keys:
1. Using `@IdClass`
2. Using `@EmbeddedId`

#### **Using `@IdClass`**
In this approach, a separate class (which implements `Serializable`) is used to represent the composite key. Each field in the composite key class corresponds to a field in the entity class.

**Example**:
```java
@Entity
@IdClass(EnrollmentId.class)
public class Enrollment {
    @Id
    @Column(name = "student_id")
    private int studentId;

    @Id
    @Column(name = "course_id")
    private int courseId;

    private Date enrollmentDate;
}

public class EnrollmentId implements Serializable {
    private int studentId;
    private int courseId;

    // Getters, Setters, equals() and hashCode() methods
}
```
In this example, `EnrollmentId` is used to represent the composite key for the `Enrollment` entity.

#### **Using `@EmbeddedId`**
The `@EmbeddedId` annotation

 is used when the composite key is itself an embeddable class.

**Example**:
```java
@Embeddable
public class EnrollmentId implements Serializable {
    private int studentId;
    private int courseId;

    // Getters, Setters, equals() and hashCode() methods
}

@Entity
public class Enrollment {
    @EmbeddedId
    private EnrollmentId id;

    private Date enrollmentDate;
}
```
Here, the `EnrollmentId` class is embedded directly into the `Enrollment` entity using the `@EmbeddedId` annotation.

---

### **5. Inheritance Mapping**

Hibernate supports inheritance, allowing you to map a class hierarchy to a relational database. There are three strategies for inheritance mapping:
1. **Single Table Strategy**
2. **Joined Table Strategy**
3. **Table Per Class Strategy**

We will cover these strategies in more detail under the "Inheritance Mapping" topic, but briefly:
- **Single Table**: All entities in the hierarchy are stored in a single table with a discriminator column.
- **Joined Table**: Each entity has its own table, and the tables are joined using foreign keys.
- **Table Per Class**: Each entity has its own table, and no joins are required.

---

Hibernate mapping is a vast and essential topic. It provides the flexibility to map Java objects to database tables in various ways, including simple fields, relationships, composite keys, and inheritance hierarchies. By mastering Hibernate mapping, developers can easily manage database interactions, reducing boilerplate code and simplifying the persistence layer in Java applications.

---
---

## **6. Hibernate Query Language (HQL) - 6**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Hibernate Query Language (HQL) is one of the most powerful features of Hibernate. HQL is an object-oriented query language similar to SQL, but instead of working with database tables and columns, it works with entity objects and their properties. This makes HQL much more flexible and object-centric compared to SQL, as it allows developers to express database queries using the object model.

Let’s go step by step through everything you need to understand about HQL.

---

### **Introduction to HQL**

HQL is designed to be database-independent, meaning the same HQL query can run on different databases without modification, as Hibernate translates HQL into the database-specific SQL queries. Unlike SQL, which operates on the relational data model (tables, columns, and rows), HQL works with the object model (classes, attributes, and relationships).

- **Case Sensitivity**: HQL is not case-sensitive for keywords, but it is case-sensitive for entity names and field names.
- **Object-Oriented**: HQL operates on persistent objects and their properties, not directly on tables and columns.
- **Similar to SQL**: The syntax of HQL is quite similar to SQL, but the primary difference is that HQL uses entity names and properties instead of table names and column names.

### **HQL Syntax Overview**

HQL has the same structure as SQL. Here are the basic components of an HQL query:

```sql
SELECT [fields] FROM [entity] [alias] WHERE [conditions] ORDER BY [fields]
```

### **Basic HQL Queries**

#### 1. **Selecting Data**

The simplest form of an HQL query is a select query that retrieves data from the database.

```java
String hql = "FROM Employee";
Query query = session.createQuery(hql);
List<Employee> employees = query.list();
```

- `FROM Employee`: This retrieves all the records of the `Employee` entity.
- `Employee` refers to the entity class, not the table.
- The result is a list of `Employee` objects.

#### 2. **Aliasing**

You can use aliases in HQL queries to make them easier to read and refer to.

```java
String hql = "FROM Employee e";
Query query = session.createQuery(hql);
List<Employee> employees = query.list();
```

Here, `e` is an alias for `Employee`, and you can refer to its properties using this alias:

```java
String hql = "SELECT e.name FROM Employee e WHERE e.id = :id";
Query query = session.createQuery(hql);
query.setParameter("id", 101);
String name = (String) query.uniqueResult();
```

#### 3. **Selecting Specific Properties**

Instead of selecting whole entities, you can retrieve only specific properties.

```java
String hql = "SELECT e.name, e.salary FROM Employee e";
Query query = session.createQuery(hql);
List<Object[]> results = query.list();
for (Object[] row : results) {
    String name = (String) row[0];
    Double salary = (Double) row[1];
}
```

- This query selects the `name` and `salary` properties of the `Employee` entity.
- The result is a list of `Object[]` arrays where each array represents a row of selected values.

#### 4. **Where Clause (Filtering)**

You can filter the records using the `WHERE` clause, just like SQL.

```java
String hql = "FROM Employee e WHERE e.salary > :minSalary";
Query query = session.createQuery(hql);
query.setParameter("minSalary", 50000);
List<Employee> employees = query.list();
```

- This query retrieves all employees with a salary greater than 50,000.
- Parameters are set using the `setParameter` method, making the query safe from SQL injection.

#### 5. **Order By Clause (Sorting)**

You can sort the results using the `ORDER BY` clause.

```java
String hql = "FROM Employee e ORDER BY e.salary DESC";
Query query = session.createQuery(hql);
List<Employee> employees = query.list();
```

- This retrieves all employees and sorts them in descending order of salary.

---

### **Using Parameters in HQL Queries**

HQL supports named parameters for passing dynamic values to queries. This improves readability and security by preventing SQL injection attacks.

#### 1. **Named Parameters**

You can pass parameters using named placeholders like `:parameterName`.

```java
String hql = "FROM Employee e WHERE e.department = :dept";
Query query = session.createQuery(hql);
query.setParameter("dept", "IT");
List<Employee> employees = query.list();
```

- `:dept` is a named parameter. The `setParameter` method is used to bind the value to this parameter.

#### 2. **Positional Parameters**

HQL also supports positional parameters using question marks (`?`) to mark placeholders.

```java
String hql = "FROM Employee e WHERE e.department = ?1 AND e.salary > ?2";
Query query = session.createQuery(hql);
query.setParameter(1, "IT");
query.setParameter(2, 50000);
List<Employee> employees = query.list();
```

Here, `?1` and `?2` represent positional parameters, which are set using `setParameter`.

---

### **Aggregation Functions in HQL**

HQL supports standard SQL aggregation functions like `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`.

#### 1. **COUNT() Function**

The `COUNT()` function is used to count the number of entities returned by a query.

```java
String hql = "SELECT COUNT(e) FROM Employee e WHERE e.department = :dept";
Query query = session.createQuery(hql);
query.setParameter("dept", "IT");
Long count = (Long) query.uniqueResult();
```

#### 2. **SUM() Function**

The `SUM()` function is used to get the total sum of a specific field.

```java
String hql = "SELECT SUM(e.salary) FROM Employee e WHERE e.department = :dept";
Query query = session.createQuery(hql);
query.setParameter("dept", "IT");
Double totalSalary = (Double) query.uniqueResult();
```

#### 3. **AVG() Function**

The `AVG()` function calculates the average value.

```java
String hql = "SELECT AVG(e.salary) FROM Employee e WHERE e.department = :dept";
Query query = session.createQuery(hql);
query.setParameter("dept", "IT");
Double avgSalary = (Double) query.uniqueResult();
```

#### 4. **GROUP BY Clause**

You can use the `GROUP BY` clause with aggregate functions to group the results by a specific field.

```java
String hql = "SELECT e.department, AVG(e.salary) FROM Employee e GROUP BY e.department";
Query query = session.createQuery(hql);
List<Object[]> results = query.list();
```

This query groups employees by department and calculates the average salary for each department.

---

### **Joins in HQL**

Learn Joins in HQL in detail [click here](./4%20Join-in-HQL.md)

HQL supports different types of joins, similar to SQL, allowing you to query related entities.

#### 1. **Inner Join**

An inner join returns records that have matching values in both entities.

```java
String hql = "SELECT e.name, d.name FROM Employee e JOIN e.department d";
Query query = session.createQuery(hql);
List<Object[]> results = query.list();
```

- Here, `JOIN` is used to fetch employees and their respective departments.
- `e.department` refers to the `Department` object mapped in the `Employee` class.

#### 2. **Left Join**

A left join returns all records from the left entity and matching records from the right entity.

```java
String hql = "SELECT e.name, d.name FROM Employee e LEFT JOIN e.department d";
Query query = session.createQuery(hql);
List<Object[]> results = query.list();
```

#### 3. **Fetch Join**

A fetch join is used to retrieve related entities together in a single query. This can help avoid the **N+1 problem** (which is when Hibernate fires additional queries to retrieve related entities).

```java
String hql = "SELECT e FROM Employee e JOIN FETCH e.department";
Query query = session.createQuery(hql);
List<Employee> employees = query.list();
```

- `JOIN FETCH` loads both `Employee` and `Department` in a single query.

---

### **Named Queries in HQL**

Hibernate allows you to define queries statically using the `@NamedQuery` annotation or in XML configurations.

#### 1. **Using Annotations**

```java
@Entity
@NamedQuery(name = "findEmployeeByName", query = "FROM Employee e WHERE e.name = :name")
public class Employee {
    // class definition
}
```

You can execute this named query like this:

```java
Query query = session.getNamedQuery("findEmployeeByName");
query.setParameter("name", "John");
List<Employee> employees = query.list();
```

#### 2. **Using XML**

Named queries can also be defined in the Hibernate XML mapping file:

```xml
<hibernate-mapping>
    <class name="Employee">
        <query name="findEmployeeByName">
            <![CDATA[ FROM Employee e WHERE e.name = :name ]]>
        </query>
    </class>
</hibernate-mapping>
```

---

### **Pagination in HQL**

To learn **Pagination in HQL** in detail then [click here](./5%20Pagination-in-HQL.md)

Hibernate supports pagination, allowing you to fetch a subset of records (useful when dealing with large datasets).

```java
String hql = "FROM Employee";
Query query = session.createQuery(hql);
query.setFirstResult(10);  // Starting index
query.setMaxResults(5);    // Number of records to fetch
List<Employee> employees = query.list();
```

- `setFirstResult(int)`: Specifies the starting index.
- `setMaxResults(int)`: Specifies the maximum number of records to fetch.

---

### **Executing native queries using Hibernate**

Executing native queries using Hibernate allows you to perform SQL operations directly against the database while still leveraging the Hibernate framework. This can be useful for complex queries that may not be easily constructed using HQL (Hibernate Query Language) or Criteria API.

### What is a Native Query?
A native query is a SQL statement that is executed directly against the database, bypassing Hibernate’s object-relational mapping features. This can be useful for performance optimization or when you need to execute specific database functions or procedures.

### Setting Up Hibernate
Before executing native queries, ensure you have Hibernate set up in your project. Here’s a quick setup:

1. **Add Hibernate Dependencies**: If you're using Maven, include the following dependencies in your `pom.xml`:

   ```xml
   <dependency>
       <groupId>org.hibernate</groupId>
       <artifactId>hibernate-core</artifactId>
       <version>5.6.9.Final</version> <!-- Check for the latest version -->
   </dependency>
   <dependency>
       <groupId>org.hibernate</groupId>
       <artifactId>hibernate-entitymanager</artifactId>
       <version>5.6.9.Final</version>
   </dependency>
   <dependency>
       <groupId>javax.persistence</groupId>
       <artifactId>javax.persistence-api</artifactId>
       <version>2.2</version>
   </dependency>
   <dependency>
       <groupId>mysql</groupId>
       <artifactId>mysql-connector-java</artifactId>
       <version>8.0.27</version> <!-- Check for the latest version -->
   </dependency>
   ```

2. **Configuration**: Create a `hibernate.cfg.xml` file in your `src/main/resources` directory:

   ```xml
   <?xml version="1.0" encoding="utf-8"?>
   <!DOCTYPE hibernate-configuration PUBLIC
       "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
       "http://hibernate.sourceforge.net/hibernate-configuration-3.0.dtd">
   <hibernate-configuration>
       <session-factory>
           <property name="hibernate.dialect">org.hibernate.dialect.MySQLDialect</property>
           <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
           <property name="hibernate.connection.url">jdbc:mysql://localhost:3306/your_database</property>
           <property name="hibernate.connection.username">your_username</property>
           <property name="hibernate.connection.password">your_password</property>
           <property name="hibernate.hbm2ddl.auto">update</property>
       </session-factory>
   </hibernate-configuration>
   ```

### Executing Native Queries

#### 1. Using `createNativeQuery()`

You can execute native SQL queries using the `Session` interface in Hibernate. Here’s an example:

```java
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import java.util.List;

public class NativeQueryExample {
    public static void main(String[] args) {
        // Create SessionFactory
        SessionFactory factory = new Configuration().configure().buildSessionFactory();

        // Create session
        Session session = factory.openSession();

        try {
            session.beginTransaction();

            // Native SQL query to select data
            String sql = "SELECT * FROM students";
            List<Student> students = session.createNativeQuery(sql, Student.class).getResultList();

            for (Student student : students) {
                System.out.println(student);
            }

            session.getTransaction().commit();
        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
            factory.close();
        }
    }
}
```

#### 2. Using `@NamedNativeQuery`

You can also define a named native query in your entity class:

```java
import javax.persistence.*;

@Entity
@NamedNativeQuery(
    name = "Student.findAll",
    query = "SELECT * FROM students",
    resultClass = Student.class
)
public class Student {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    // Getters and Setters
}
```

You can then execute this query as follows:

```java
List<Student> students = session.createNamedQuery("Student.findAll").getResultList();
```

### 3. Parameterized Native Queries

You can also pass parameters to your native queries to make them dynamic:

```java
String sql = "SELECT * FROM students WHERE name = :name";
List<Student> students = session.createNativeQuery(sql, Student.class)
                               .setParameter("name", "John")
                               .getResultList();
```

### 4. Updating Data

To perform updates or inserts using native queries, you can use `executeUpdate()`:

```java
String sql = "UPDATE students SET name = :name WHERE id = :id";
int result = session.createNativeQuery(sql)
                    .setParameter("name", "Jane")
                    .setParameter("id", 1)
                    .executeUpdate();
```

Using native queries in Hibernate provides flexibility and allows you to leverage SQL directly when necessary. However, it’s generally recommended to use HQL or Criteria API for standard operations to benefit from Hibernate’s object-relational mapping capabilities and automatic handling of SQL injection risks. Always be cautious with native queries to maintain the advantages provided by the ORM.

---

### **HQL Best Practices**

1. **Use Named Parameters**: They improve readability and security.
2. **Avoid `SELECT *`**: Select only the required properties instead of fetching the entire entity.
3. **Use Fetch Joins**: Avoid N+1 select problems by using fetch joins when necessary.
4. **Leverage Caching**: Use Hibernate's caching mechanisms to optimize performance.

---

Hibernate Query Language (HQL) is a powerful tool for database interaction in Java applications. It provides an object-oriented approach to querying the database, making it easier to work with entities and their relationships. By understanding and utilizing HQL effectively, you can create efficient, maintainable data access layers in your Hibernate applications.

---
---


## **7. Hibernate Criteria API - 7**

Go on [Hibernate all topics list](#hibernate-topics-overview).

The **Hibernate Criteria API** provides a powerful, object-oriented alternative to HQL (Hibernate Query Language) for retrieving entities from a database. It is type-safe and allows you to build queries dynamically, providing greater flexibility than string-based HQL. The Criteria API is particularly useful when the exact structure of the query is not known at compile time and needs to be constructed dynamically based on user input or program logic.

In **Hibernate 5**, the **Criteria API** was deprecated in favor of the **JPA Criteria API**, but it's still important to understand how it works because of its widespread usage.

---

### **Key Features of the Criteria API**

1. **Type-Safe Queries**: Instead of writing queries as strings (as in HQL or SQL), the Criteria API uses Java objects and methods to represent queries, which helps avoid syntax errors at runtime.
2. **Dynamic Query Creation**: The query structure can be constructed at runtime based on the input, making it highly dynamic and flexible.
3. **Readable and Maintainable**: Object-oriented approach makes queries more readable and easier to maintain compared to HQL.
4. **Pagination**: The Criteria API natively supports pagination to fetch specific subsets of data from the database.
5. **Projections and Aggregation**: Supports the selection of specific fields (projections), aggregate functions like `COUNT()`, `SUM()`, `AVG()`, etc.
6. **Joins and Associations**: You can use the Criteria API to fetch data from multiple related tables using joins.

---

### **Core Components of Criteria API**

Before diving into examples, let’s discuss the core components of the Criteria API:

1. **`CriteriaBuilder`**: The main interface to construct query objects dynamically. This is similar to a factory for different criteria-related operations (like `select`, `where`, etc.).
   
2. **`CriteriaQuery`**: Represents the actual query object. It defines the result type and structure of the query, which will be executed.

3. **`Root`**: Represents the root entity in a query, equivalent to a "FROM" clause in SQL. All entity fields are accessed via the `Root`.

4. **`Predicate`**: Represents a condition in the query (such as "WHERE" clause conditions). These are used for adding restrictions, filters, or conditions to queries.

5. **`Path`**: Allows navigation through entity relationships (such as accessing a property of an associated entity).

6. **`Order`**: Represents ordering (like SQL `ORDER BY`) in the query.

---

### **Steps to Create a Criteria Query**

1. **Create `CriteriaBuilder`**:
   The `CriteriaBuilder` is obtained from the `EntityManager` or `Session` object. This class is used to create query conditions and define the structure of the query.

2. **Define `CriteriaQuery`**:
   This object defines the result type of the query (i.e., the entity class or DTO that will be returned).

3. **Set the `Root` Entity**:
   The `Root` defines the entity from which the data will be fetched. It is equivalent to the "FROM" clause in SQL.

4. **Add Query Conditions (Predicates)**:
   Using the `CriteriaBuilder`, you can define conditions or restrictions to filter the results of the query. These conditions act like the "WHERE" clause in SQL.

5. **Execute the Query**:
   The final query is executed using the `EntityManager` or `Session`'s `createQuery()` method.

---

### **Basic Example: Selecting All Records**

Here’s a simple example that fetches all records from an `Employee` table using the Criteria API:

```java
// Step 1: Get the CriteriaBuilder from the Session
CriteriaBuilder builder = session.getCriteriaBuilder();

// Step 2: Create a CriteriaQuery object, specifying the result type (Employee)
CriteriaQuery<Employee> query = builder.createQuery(Employee.class);

// Step 3: Define the root entity (FROM clause)
Root<Employee> root = query.from(Employee.class);

// Step 4: Build the query (here we’re just selecting all employees)
query.select(root);

// Step 5: Execute the query
List<Employee> employees = session.createQuery(query).getResultList();
```

This is the equivalent of the following SQL query:
```sql
SELECT * FROM Employee;
```

---

### **Adding Conditions: WHERE Clause with Criteria API**

You can add conditions to your query using `Predicate` objects. For example, let’s fetch all employees with a salary greater than 50,000:

```java
// Step 1: Get the CriteriaBuilder from the session
CriteriaBuilder builder = session.getCriteriaBuilder();

// Step 2: Create the CriteriaQuery object for Employee
CriteriaQuery<Employee> query = builder.createQuery(Employee.class);

// Step 3: Define the root (FROM clause)
Root<Employee> root = query.from(Employee.class);

// Step 4: Add WHERE clause (salary > 50000)
Predicate salaryPredicate = builder.gt(root.get("salary"), 50000);
query.select(root).where(salaryPredicate);

// Step 5: Execute the query
List<Employee> employees = session.createQuery(query).getResultList();
```

This generates SQL similar to:
```sql
SELECT * FROM Employee WHERE salary > 50000;
```

---

### **Using Multiple Conditions: AND/OR Clauses**

You can combine multiple conditions using `CriteriaBuilder.and()` and `CriteriaBuilder.or()`:

Example: Retrieve employees who are either in the "IT" department or have a salary greater than 50,000:

```java
// Step 1: Get the CriteriaBuilder
CriteriaBuilder builder = session.getCriteriaBuilder();

// Step 2: Create CriteriaQuery for Employee
CriteriaQuery<Employee> query = builder.createQuery(Employee.class);

// Step 3: Define the root entity
Root<Employee> root = query.from(Employee.class);

// Step 4: Add multiple conditions using AND/OR
Predicate salaryPredicate = builder.gt(root.get("salary"), 50000);
Predicate deptPredicate = builder.equal(root.get("department"), "IT");

query.select(root).where(builder.or(salaryPredicate, deptPredicate));

// Step 5: Execute the query
List<Employee> employees = session.createQuery(query).getResultList();
```

This translates to:
```sql
SELECT * FROM Employee WHERE salary > 50000 OR department = 'IT';
```

---

### **Projections: Selecting Specific Columns**

The Criteria API allows you to select specific columns (fields) instead of entire entities using **Projections**.

Example: Select only the employee names and their departments:

```java
// Step 1: Get CriteriaBuilder
CriteriaBuilder builder = session.getCriteriaBuilder();

// Step 2: Create CriteriaQuery with Object[] result type for multiple fields
CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

// Step 3: Define the root entity
Root<Employee> root = query.from(Employee.class);

// Step 4: Add the columns to be selected
query.multiselect(root.get("name"), root.get("department"));

// Step 5: Execute the query
List<Object[]> results = session.createQuery(query).getResultList();

// Iterate over the results
for (Object[] row : results) {
    String name = (String) row[0];
    String department = (String) row[1];
    System.out.println("Name: " + name + ", Department: " + department);
}
```

This generates:
```sql
SELECT name, department FROM Employee;
```

---

### **Pagination with Criteria API**

Pagination is useful when working with large datasets to retrieve records in chunks. The Criteria API supports pagination using the `setFirstResult()` and `setMaxResults()` methods.

Example: Fetch the first 10 records starting from the 5th record:

```java
// Step 1: Get CriteriaBuilder
CriteriaBuilder builder = session.getCriteriaBuilder();

// Step 2: Create CriteriaQuery
CriteriaQuery<Employee> query = builder.createQuery(Employee.class);

// Step 3: Define the root entity
Root<Employee> root = query.from(Employee.class);

// Step 4: Build the query
query.select(root);

// Step 5: Create the query and set pagination
List<Employee> employees = session.createQuery(query)
                                   .setFirstResult(5)  // Start from the 6th record (index 5)
                                   .setMaxResults(10)  // Fetch the next 10 records
                                   .getResultList();
```

This translates to something like:
```sql
SELECT * FROM Employee LIMIT 10 OFFSET 5;
```

---

### **Ordering Results**

To order query results, you can use the `CriteriaBuilder.orderBy()` method to specify the sort order.

Example: Retrieve employees and order them by salary in descending order:

```java
// Step 1: Get CriteriaBuilder
CriteriaBuilder builder = session.getCriteriaBuilder();

// Step 2: Create CriteriaQuery
CriteriaQuery<Employee> query = builder.createQuery(Employee.class);

// Step 3: Define the root entity
Root<Employee> root = query.from(Employee.class);

// Step 4: Add orderBy clause for sorting by salary in descending order
query.select(root).orderBy(builder.desc(root.get("salary")));

// Step 5: Execute the query
List<Employee> employees = session.createQuery(query).getResultList();
```

This is equivalent to:
```sql
SELECT * FROM Employee ORDER BY salary DESC;
```

---

### **Aggregations and Grouping**

The Criteria API supports aggregation functions like `COUNT()`, `AVG()`, `SUM()`, etc., as well as the `GROUP BY` clause.

Example: Count the number of employees in each department:

```java
// Step 1: Get CriteriaBuilder
CriteriaBuilder builder = session.getCriteriaBuilder();

// Step 2: Create CriteriaQuery with Object[] result type
CriteriaQuery<Object[]> query = builder

.createQuery(Object[].class);

// Step 3: Define the root entity
Root<Employee> root = query.from(Employee.class);

// Step 4: Add grouping and aggregation
query.multiselect(root.get("department"), builder.count(root))
     .groupBy(root.get("department"));

// Step 5: Execute the query
List<Object[]> results = session.createQuery(query).getResultList();

// Iterate over the results
for (Object[] row : results) {
    String department = (String) row[0];
    Long count = (Long) row[1];
    System.out.println("Department: " + department + ", Count: " + count);
}
```

This generates:
```sql
SELECT department, COUNT(*) FROM Employee GROUP BY department;
```

---

### **Joins in Criteria API**

Criteria API supports **joins** for querying across multiple related entities.

Example: Fetch employees along with their associated department details:

```java
// Step 1: Get CriteriaBuilder
CriteriaBuilder builder = session.getCriteriaBuilder();

// Step 2: Create CriteriaQuery
CriteriaQuery<Employee> query = builder.createQuery(Employee.class);

// Step 3: Define the root entity
Root<Employee> root = query.from(Employee.class);

// Step 4: Perform join between Employee and Department
Join<Employee, Department> department = root.join("department");

// Step 5: Build the query
query.select(root).where(builder.equal(department.get("name"), "IT"));

// Step 6: Execute the query
List<Employee> employees = session.createQuery(query).getResultList();
```

This is equivalent to:
```sql
SELECT * FROM Employee e JOIN Department d ON e.department_id = d.id WHERE d.name = 'IT';
```

---

### **Advantages of Hibernate Criteria API**

1. **Type-Safety**: Compile-time checking of queries, unlike HQL or SQL.
2. **Dynamic Query Construction**: Queries can be constructed based on user input at runtime.
3. **Flexibility**: Easily supports complex queries like joins, groupings, aggregations, etc.
4. **Readable and Maintainable**: Object-oriented query building makes code easier to read and maintain.

---

### **Limitations of Criteria API**

1. **Verbosity**: Criteria queries can become verbose, especially for complex queries with multiple joins and conditions.
2. **Deprecated in Hibernate 5**: With the introduction of the JPA Criteria API, the Hibernate Criteria API was deprecated in Hibernate 5, although it's still widely used in legacy applications.

---

The **Hibernate Criteria API** offers a powerful, flexible, and type-safe way to create dynamic queries, making it a popular choice for developers who need flexibility beyond traditional HQL or SQL.

---
---

## **8. Caching in Hibernate - 8**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Caching is an essential aspect of Hibernate's performance optimization. It helps reduce the number of database queries, thereby improving the speed of the application. Caching stores the data in memory (RAM) temporarily, so repeated access to the same data doesn't require multiple round-trips to the database. Hibernate provides multiple levels of caching, each with different scopes and characteristics.

In this chapter, we'll cover everything related to Hibernate caching in detail, from basic concepts to advanced configurations.

---

### **1. Why Caching is Important in Hibernate**

When an application repeatedly accesses the same data, making a new database query every time can be resource-intensive, slow, and increase the load on the database server. Caching helps alleviate this by storing frequently used data in memory, allowing Hibernate to retrieve it without hitting the database every time.

Caching in Hibernate is used to:
- **Reduce database load** by minimizing the number of queries.
- **Improve application performance** by speeding up data retrieval.
- **Enhance scalability** by reducing the overall network traffic between the application and the database.

---

### **2. Types of Caching in Hibernate**

Hibernate implements two levels of caching:
1. **First-Level Cache** (Session Cache)
2. **Second-Level Cache** (Shared Cache)
3. **Query Cache** (Optional and specific for queries)

#### **2.1 First-Level Cache (Session Cache)**

- **Scope**: Exists within the scope of a Hibernate `Session`.
- **Default**: First-level cache is enabled by default and cannot be disabled.
- **Persistence**: It lasts only for the duration of the session, meaning once the session is closed, the cache is discarded.
- **Session-Specific**: Each Hibernate `Session` object has its own cache, and data stored in this cache is not shared across sessions.

**How it works**:
When you load an entity using methods like `session.get()`, `session.load()`, or `session.save()`, Hibernate first checks the first-level cache. If the entity is found in the cache, it is returned without querying the database. Otherwise, it queries the database and caches the result for the rest of the session's lifecycle.

Example:
```java
Session session = sessionFactory.openSession();
Employee emp1 = session.get(Employee.class, 1); // Hits the DB
Employee emp2 = session.get(Employee.class, 1); // Retrieves from First-Level Cache
```

In this example, the first call to `session.get()` will hit the database, but the second call for the same entity will retrieve the entity from the first-level cache.

#### **Benefits of First-Level Cache**:
- Reduces redundant database access for entities within the same session.
- Ensures that any changes made to an entity within the same session are reflected without additional database queries.

---

#### **2.2 Second-Level Cache (Shared Cache)**

- **Scope**: Shared across multiple sessions and across the entire application.
- **Not enabled by default**: Second-level cache needs to be explicitly configured and enabled.
- **Persistence**: It survives beyond a single session and can hold data even after the session is closed. This cache can be used across multiple transactions and sessions.
- **Cache Providers**: Hibernate supports several third-party cache providers for second-level caching, such as:
  - **Ehcache**
  - **Infinispan**
  - **OSCache**
  - **Hazelcast**

Second-level cache can cache entities and collections, and the data is shared between multiple Hibernate sessions in the application. It can significantly improve performance in applications where the same data is accessed frequently by different sessions.

**How it works**:
When an entity is requested, Hibernate first looks into the first-level cache (Session Cache). If the entity is not found, it checks the second-level cache. If it is present, the entity is returned from the second-level cache. Otherwise, the entity is fetched from the database and stored in both the first and second-level caches.

---

### **3. Configuring Second-Level Cache**

To enable the second-level cache in Hibernate, follow these steps:

#### **Step 1: Add Cache Provider Dependencies**
First, you need to add the cache provider dependency (e.g., Ehcache) to your project. For example, in a Maven project:

```xml
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-ehcache</artifactId>
    <version>5.4.0.Final</version>
</dependency>
```

#### **Step 2: Configure Cache in `hibernate.cfg.xml`**
Enable second-level cache and specify the cache provider in Hibernate configuration:

```xml
<property name="hibernate.cache.use_second_level_cache">true</property>
<property name="hibernate.cache.region.factory_class">org.hibernate.cache.ehcache.EhCacheRegionFactory</property>
<property name="hibernate.cache.use_query_cache">true</property>
```

- `hibernate.cache.use_second_level_cache`: Enables second-level cache.
- `hibernate.cache.region.factory_class`: Specifies the cache provider (EhCache in this case).
- `hibernate.cache.use_query_cache`: Enables caching of query results (more on this later).

#### **Step 3: Configure Caching for Specific Entities**
You need to explicitly mark which entities or collections should be cached at the second level. This can be done using annotations or XML mappings.

**Using Annotations**:
```java
@Entity
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Employee {
    // Fields, getters, setters
}
```

**Using XML Mapping**:
```xml
<class name="com.example.Employee" table="Employee">
    <cache usage="read-write"/>
</class>
```

- `@Cacheable`: Marks the entity as cacheable.
- `@Cache`: Specifies the cache usage strategy (discussed below).

#### **Cache Concurrency Strategies**:
Concurrency strategies determine how the cache behaves when entities are updated, deleted, or read in a concurrent environment. Hibernate provides the following strategies:

1. **READ_ONLY**: Use this for entities that are not modified (static data). It is the fastest and offers high concurrency.
   ```java
   @Cache(usage = CacheConcurrencyStrategy.READ_ONLY)
   ```
2. **NONSTRICT_READ_WRITE**: Suitable when you don’t need strict consistency between the cache and the database (e.g., updates can be slightly delayed).
   ```java
   @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
   ```
3. **READ_WRITE**: Ensures consistency between the cache and the database. Suitable when entities are frequently modified.
   ```java
   @Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
   ```
4. **TRANSACTIONAL**: Used when you need full transactional capabilities with the cache (rarely used unless the cache provider supports it).

---

### **4. Query Cache**

- **Scope**: The query cache is an optional, specialized cache used to store query results.
- **Use Case**: When you run the same query multiple times, it can cache the result set to avoid re-executing the query.
- **Dependency**: The second-level cache must be enabled to use the query cache.

The query cache stores the identifiers of the result set, and it relies on the second-level cache to store the actual entity data. Therefore, the entities returned by the query must also be cacheable.

**Configuring Query Cache**:
To enable the query cache, you need to add the following configuration in `hibernate.cfg.xml`:

```xml
<property name="hibernate.cache.use_query_cache">true</property>
```

You also need to indicate whether you want specific queries to be cached:
```java
Query query = session.createQuery("FROM Employee WHERE department = :dept");
query.setCacheable(true);
query.setParameter("dept", "Sales");
List<Employee> employees = query.list();
```

- `query.setCacheable(true)`: Marks the query as cacheable.
- The first time the query is executed, the result will be stored in the query cache. Subsequent executions of the same query will return the cached results.

#### **Limitations of Query Cache**:
- **Staleness**: If the underlying data changes, the query cache may return outdated results unless it is invalidated.
- **Performance overhead**: The query cache stores the result set and may introduce overhead if queries change frequently.

---

### **5. Cache Invalidation**

Cache invalidation is the process of ensuring that stale data in the cache is removed when changes are made to the underlying database. Hibernate automatically handles invalidation for cached entities when updates, inserts, or deletions occur.

**Invalidation Strategies**:
1. **Immediate Invalidation**: When an entity is updated or deleted, the cached entry is immediately removed or updated in the cache. This is the default behavior when using strategies like `READ_WRITE` and `TRANSACTIONAL`.
2. **Non-strict Invalidation**: When using `NONSTRICT_READ_WRITE`, cached entries may remain in the cache for a short period after an update, meaning some queries might see slightly stale data.

---

### **6. Cache Regions**

A cache region is a named area in the second-level cache where Hibernate stores entities. You can define multiple regions to organize your cache.

**Example of Cache Region Configuration**:
```xml
<property name="hibernate.cache.region.factory_class">org.hibernate.cache.ehcache.EhCacheRegionFactory</property>
```

In your entity mapping:
```java
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE, region = "EmployeeRegion")
public class Employee {
    // Fields, getters, setters
}
```

---

### **7. Cache Providers**

Hibernate provides a standard interface for integrating with third-party caching solutions. Some of the popular cache providers are:

1. **Ehcache**: One

 of the most commonly used providers for second-level caching. It's highly configurable and provides support for distributed caching.
2. **Infinispan**: A distributed in-memory key/value data store and cache.
3. **Hazelcast**: A distributed caching solution that supports clustering.
4. **OSCache**: A simple, open-source caching framework that is less commonly used today.

---

### **8. Best Practices for Using Hibernate Caching**

- **Cache Static Data**: Cache read-only or rarely-changing data, such as lookup tables.
- **Choose the Right Cache Provider**: Use a cache provider that fits your application's needs (e.g., distributed caching in large applications).
- **Optimize Cache Region Usage**: Group entities with similar access patterns into the same cache regions.
- **Avoid Over-Caching**: Only cache entities that are frequently accessed and rarely modified to prevent cache invalidation issues.
- **Monitor and Tune the Cache**: Use Hibernate statistics to monitor cache performance and adjust the configuration as necessary.

---

By implementing caching effectively, you can significantly improve your Hibernate application's performance, reduce database load, and scale your application efficiently.

---
---

## **9. Transactions and Concurrency - 9**

Go on [Hibernate all topics list](#hibernate-topics-overview).

In any enterprise application, managing **transactions** and ensuring **concurrency control** are crucial for maintaining data consistency and integrity. This chapter will provide an in-depth understanding of how transactions work in Hibernate, how they handle concurrency issues, and what mechanisms Hibernate provides to ensure smooth, efficient, and reliable database operations.

#### **1. Transactions in Hibernate**

A **transaction** is a sequence of operations performed as a single logical unit of work. A transaction ensures that either all operations succeed, or if any operation fails, all operations are rolled back, leaving the system in a consistent state. This principle is encapsulated in the ACID properties of a transaction.

- **Atomicity**: Ensures that all operations within a transaction are treated as a single unit. Either all of them are executed or none.
- **Consistency**: Ensures that the database remains in a consistent state before and after the transaction.
- **Isolation**: Ensures that intermediate operations within a transaction are invisible to other concurrent transactions.
- **Durability**: Once a transaction is committed, its changes are permanent, even in case of system failure.

##### **1.1 How Hibernate Handles Transactions**
Hibernate provides two main ways to manage transactions:
1. **Programmatic Transaction Management**: The transaction is controlled explicitly by the developer using Hibernate’s `Transaction` API.
2. **Declarative Transaction Management**: The transaction is controlled by a framework like **Spring**, where the developer can simply annotate methods with `@Transactional`, and the framework handles transaction boundaries.

##### **1.2 Programmatic Transaction Management Example**

Hibernate provides the `Transaction` interface for handling transactions. A typical flow for managing a transaction programmatically in Hibernate is:

```java
Session session = sessionFactory.openSession();
Transaction transaction = null;

try {
    transaction = session.beginTransaction(); // Start a new transaction

    // Perform database operations
    Employee emp = new Employee("John Doe", "Software Engineer");
    session.save(emp);

    transaction.commit();  // Commit the transaction, making changes permanent
} catch (Exception e) {
    if (transaction != null) transaction.rollback(); // Rollback in case of failure
    e.printStackTrace();
} finally {
    session.close(); // Close the session
}
```

Key points:
- `beginTransaction()`: Starts a new transaction.
- `commit()`: Ends the transaction and permanently saves the changes.
- `rollback()`: Reverts the changes if any operation within the transaction fails.

##### **1.3 Declarative Transaction Management with Spring**

When using **Spring**, transaction management can be handled declaratively using the `@Transactional` annotation. Here’s an example:

```java
@Service
public class EmployeeService {

    @Autowired
    private EmployeeDAO employeeDAO;

    @Transactional
    public void saveEmployee(Employee employee) {
        employeeDAO.save(employee);
    }
}
```

In this approach:
- The `@Transactional` annotation automatically starts and commits the transaction for the `saveEmployee` method.
- If an exception occurs, Spring rolls back the transaction automatically.

This method is often preferred as it reduces boilerplate code, and Spring handles the complexities of transaction management.

#### **2. Concurrency in Hibernate**

Concurrency occurs when multiple transactions are executed simultaneously, possibly accessing or modifying the same data. If not managed properly, concurrency issues like **dirty reads**, **non-repeatable reads**, or **phantom reads** can occur, leading to **inconsistent data** or **data integrity violations**.

Concurrency is handled using **transaction isolation levels** and **locking mechanisms** in Hibernate.

##### **2.1 Transaction Isolation Levels**

Transaction isolation levels define the extent to which one transaction is isolated from other transactions in terms of visibility of changes. Hibernate provides support for different isolation levels as defined by the database.

The four standard isolation levels are:
1. **Read Uncommitted**:
   - A transaction can see changes made by other uncommitted transactions.
   - Issues: Dirty reads, non-repeatable reads, and phantom reads can occur.
2. **Read Committed** (Default in most databases, including MySQL):
   - A transaction can see changes made by other committed transactions, but not by uncommitted ones.
   - Issues: Non-repeatable reads and phantom reads can occur.
3. **Repeatable Read**:
   - A transaction can see only the data that was committed before it started.
   - Issues: Phantom reads can still occur.
4. **Serializable**:
   - The highest isolation level. Transactions are executed one after another in a serialized fashion.
   - Guarantees complete isolation but can significantly reduce concurrency and performance.

Example of setting the transaction isolation level in Hibernate:
```xml
<property name="hibernate.connection.isolation">2</property>  <!-- Read Committed -->
```
Here, `2` represents the **Read Committed** isolation level.

##### **2.2 Common Concurrency Issues**

- **Dirty Read**: A transaction reads uncommitted changes made by another transaction.
- **Non-Repeatable Read**: A transaction reads the same data multiple times, and the data changes between reads.
- **Phantom Read**: A transaction reads a set of rows that match some criteria, but another transaction inserts new rows that match the same criteria during the first transaction’s execution.

##### **2.3 Locking Mechanisms**

To prevent concurrency issues, Hibernate provides two types of locks: **optimistic locking** and **pessimistic locking**.

---

#### **3. Optimistic Locking**

**Optimistic Locking** assumes that multiple transactions can complete without affecting each other. Instead of locking rows in the database, optimistic locking detects conflicts at commit time. If a conflict is detected, one transaction is rolled back.

##### **3.1 How Optimistic Locking Works in Hibernate**

Optimistic locking is usually implemented by adding a version field (often called `version`) in the entity. Hibernate checks this version field when performing updates or deletes. If the version number has changed since the entity was last read, Hibernate throws an exception, indicating a concurrent modification.

Example:

```java
@Entity
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Version  // Hibernate will use this field for optimistic locking
    private int version;

    private String name;
    private String position;
}
```

In this example, Hibernate will automatically increment the `version` field whenever the entity is updated. When updating an entity:
1. The version is checked to see if it matches the version in the database.
2. If it does, the update proceeds, and the version is incremented.
3. If it doesn't match, Hibernate throws an `OptimisticLockException`.

Optimistic locking is preferred in scenarios where conflicts are rare and holding locks for the entire transaction would reduce performance.

##### **3.2 Handling OptimisticLockException**

When an optimistic lock failure occurs, it usually indicates that the data was modified by another transaction. The developer should handle such exceptions and retry the operation or notify the user.

Example:
```java
try {
    session.saveOrUpdate(employee);
    transaction.commit();
} catch (OptimisticLockException e) {
    // Handle the case when another transaction has updated the entity
    transaction.rollback();
}
```

---

#### **4. Pessimistic Locking**

**Pessimistic Locking** assumes that conflicts are likely to happen and locks the database rows that a transaction is working on, preventing other transactions from modifying them until the lock is released. 

##### **4.1 How Pessimistic Locking Works in Hibernate**

Pessimistic locking can be achieved using Hibernate’s `LockMode` or explicit locking via SQL queries. There are two types of pessimistic locks:
- **Pessimistic Read Lock** (`LockMode.PESSIMISTIC_READ`): Other transactions can read the data but cannot modify it.
- **Pessimistic Write Lock** (`LockMode.PESSIMISTIC_WRITE`): No other transaction can read or modify the data until the lock is released.

Example of using pessimistic locking:

```java
Session session = sessionFactory.openSession();
Transaction transaction = session.beginTransaction();

Employee emp = session.get(Employee.class, 1, LockMode.PESSIMISTIC_WRITE);  // Acquires a write lock on the employee

emp.setName("Updated Name");

transaction.commit();  // Lock is released after commit
session.close();
```

In the above example, the `PESSIMISTIC_WRITE` lock ensures that no other transaction can modify the `Employee` entity while the current transaction is in progress.

##### **4.2 When to Use Pessimistic Locking**

Pessimistic locking should be used when:
- You expect high contention for a specific resource.
- You cannot afford to have multiple transactions modifying the same data at the same time (e.g., banking transactions).

However, pessimistic locking can reduce concurrency and lead to **deadlocks** if not used carefully.

---

#### **5. Managing Transaction Propagation and Isolation Levels**

In enterprise applications, a transaction often involves multiple components (e.g., services or DAOs). **Transaction propagation** defines how transactions are managed across such components.

##### **5.1 Transaction Propagation**

Hibernate supports the following propagation behaviors:
- **REQUIRED**: Default. A new transaction is started if there isn’t one already; otherwise, the existing transaction is used.
- **REQUIRES_NEW**: A new transaction is always started, suspending any existing transaction.
- **MANDATORY**: A transaction must already exist; if not, an exception is thrown.
- **SUPPORTS**: If a transaction exists, it will be used; if not, no transaction is started.
- **NOT_SUPPORTED**: No transaction is used; if one exists, it is suspended.
- **NEVER**: Ensures no transaction

 is active. If one exists, an exception is thrown.

Example with Spring `@Transactional`:
```java
@Transactional(propagation = Propagation.REQUIRES_NEW)
public void saveEmployee(Employee employee) {
    // A new transaction will be started for this method
}
```

Transactions and concurrency management are essential for building robust, high-performance applications with Hibernate. By understanding and applying the appropriate isolation levels, locking mechanisms, and transaction propagation rules, you can ensure that your application operates reliably and efficiently in concurrent environments.

---
---

## **10. Fetching Strategies - 10**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Fetching strategies in Hibernate define how and when associated entities are retrieved from the database. Hibernate provides a variety of ways to fetch related entities, which can greatly impact the performance and behavior of the application. The main focus of this chapter is to understand the difference between **Lazy Loading** and **Eager Loading**, along with strategies to optimize entity fetching to avoid common performance pitfalls like the **N+1 Select Problem**.

### **What is Fetching?**

Fetching refers to the process of retrieving associated entities (such as relationships between tables) when querying data from the database. Hibernate needs to decide when to fetch the data for associated entities, and the fetching strategy determines how this decision is made.

There are two major strategies:
- **Eager Loading**: Associated entities are loaded immediately with the main entity.
- **Lazy Loading**: Associated entities are loaded only when they are explicitly accessed, not when the main entity is retrieved.

### **1. Eager Loading**

Eager loading means that when an entity is fetched, all related entities are also fetched immediately, even if they are not used in the application.

**Example of Eager Loading:**
Let's say we have two entities, `Employee` and `Department`, where an `Employee` belongs to a `Department`. If we eagerly load the `Department` for every `Employee`, Hibernate will retrieve the `Department` entity along with the `Employee` entity.

```java
@Entity
@Table(name = "Employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @ManyToOne(fetch = FetchType.EAGER) // Eager fetching
    @JoinColumn(name = "department_id")
    private Department department;
}
```

When we query for `Employee`, Hibernate will automatically load the associated `Department` entity, even if we don't explicitly need it:

```java
Session session = sessionFactory.openSession();
Employee emp = session.get(Employee.class, 1);
```

In this case, Hibernate will generate a **JOIN** query and fetch both the `Employee` and the `Department` in a single SQL query.

**Pros of Eager Loading**:
- Convenience: All the necessary data is available immediately.
- Can avoid multiple queries for associated entities.

**Cons of Eager Loading**:
- Performance overhead: If you don’t need the associated entities in a particular use case, you are still loading them unnecessarily.
- It might lead to unnecessary large queries and slower performance.

---

### **2. Lazy Loading**

Lazy loading means that related entities are only fetched when accessed for the first time. This is generally considered more efficient for performance, as only the data that is actually needed is fetched from the database.

**Example of Lazy Loading:**

```java
@Entity
@Table(name = "Employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String name;

    @ManyToOne(fetch = FetchType.LAZY) // Lazy fetching
    @JoinColumn(name = "department_id")
    private Department department;
}
```

In this case, when we query for an `Employee`, Hibernate will not fetch the `Department` entity right away. Instead, it will only fetch the `Employee`. The associated `Department` will be fetched only when you access it:

```java
Employee emp = session.get(Employee.class, 1); 
// Only the Employee object is loaded here

Department dept = emp.getDepartment(); 
// Now the Department object is loaded from the database
```

**Pros of Lazy Loading**:
- **Performance improvement**: Only the necessary data is fetched from the database, which can reduce the load on the system.
- **Memory efficiency**: Hibernate avoids storing unused entities in memory.
- **Scalability**: Particularly useful in large applications where loading all related entities at once would be too expensive.

**Cons of Lazy Loading**:
- **N+1 Select Problem** (explained in detail later): Lazy loading can lead to multiple queries being executed, which can degrade performance.
- **Session Management**: If the session is closed before accessing the lazily loaded entities, a `LazyInitializationException` will be thrown. This typically happens in web applications where the session is closed at the end of the request but the data is needed afterward.

---

### **3. N+1 Select Problem**

The **N+1 Select Problem** occurs when Hibernate executes one query to load the main entity and then N additional queries to load its associated entities. This problem is common when lazy fetching is used inappropriately.

**Example of the N+1 Problem:**
Assume we have a `Department` entity that has a one-to-many relationship with `Employee`.

```java
@Entity
@Table(name = "Department")
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "department")
    private List<Employee> employees;
}
```

If we fetch a `Department` and then access the employees:

```java
Department dept = session.get(Department.class, 1);  // Query 1

for (Employee emp : dept.getEmployees()) {
    System.out.println(emp.getName());  // Query N (for each employee)
}
```

Here, Hibernate will:
1. Execute one query to retrieve the `Department`.
2. Execute N additional queries (one for each employee) to fetch the employees of that department.

For example:
- Query 1: `SELECT * FROM Department WHERE id = 1;`
- Query 2: `SELECT * FROM Employee WHERE department_id = 1;` (repeated for each employee)

This can lead to severe performance issues if N is large, as it results in a large number of database queries.

**Solution to the N+1 Problem:**
- **Batch Fetching**: Hibernate can batch the retrieval of related entities. This reduces the number of queries and improves performance.
- **JOIN FETCH**: You can use HQL to join and fetch associated entities in a single query.

**Example using `JOIN FETCH` in HQL**:

```java
String hql = "FROM Department d JOIN FETCH d.employees WHERE d.id = :departmentId";
Query query = session.createQuery(hql);
query.setParameter("departmentId", 1);
Department dept = (Department) query.uniqueResult();
```

This will retrieve the `Department` and its associated `Employee` entities in one go, avoiding the N+1 problem.

---

### **4. Fetch Modes in Hibernate**

In addition to specifying `FetchType.LAZY` or `FetchType.EAGER`, Hibernate offers additional strategies for fine-tuning the fetch behavior using **FetchMode**.

- **FetchMode.JOIN**: Forces Hibernate to fetch associated entities using a SQL `JOIN`. This is equivalent to eager loading but with more control.
  
  ```java
  @OneToMany(fetch = FetchType.LAZY)
  @Fetch(FetchMode.JOIN)
  private List<Employee> employees;
  ```
  This ensures that a single SQL query is executed with a join to fetch both the parent and child entities.

- **FetchMode.SELECT**: Fetches the associated entities in separate SQL `SELECT` queries (this is the default for lazy fetching).

  ```java
  @Fetch(FetchMode.SELECT)
  ```

- **FetchMode.SUBSELECT**: Fetches all associated entities using a subquery when accessing the collection for the first time. This can reduce the number of queries compared to `FetchMode.SELECT`.

  ```java
  @Fetch(FetchMode.SUBSELECT)
  ```
  
  Example of how this works:
  ```sql
  SELECT * FROM Employee WHERE department_id IN (SELECT id FROM Department WHERE id = ?)
  ```

---

### **5. Batch Fetching**

**Batch Fetching** is a performance optimization strategy used to avoid multiple SELECT queries when fetching lazily-loaded collections. Instead of fetching each record one by one, Hibernate can fetch multiple records in batches.

To enable batch fetching, you can configure it in the Hibernate configuration file or by using annotations.

**Configuring Batch Size via Hibernate Configuration**:

```xml
<property name="hibernate.default_batch_fetch_size">10</property>
```

This tells Hibernate to fetch up to 10 associated entities in a single query.

**Example of Batch Fetching:**
If you have a `Department` entity with a list of employees and enable batch fetching, Hibernate will fetch employees in batches instead of firing one query for each employee.

---

### **6. Fetching Collections**

When fetching collections (such as `List`, `Set`, or `Map`), Hibernate allows you to specify how the collection should be fetched. The two primary options are:

1. **Subselect Fetching**:
   Hibernate retrieves all the entities from the main query and then retrieves the associated entities in one large subselect.
   
   ```java
   @Fetch(FetchMode.SUBSELECT)
   private Set<Employee> employees;
   ```
   This reduces the number of database roundtrips and can be more efficient for larger collections.

2. **Batch Fetching**:
   As mentioned earlier, batch fetching allows you to retrieve collections in chunks rather than individual queries for each association.

---

### **7. Practical Tips for Optimizing Fetching Strategies**

1. **Use Lazy Loading by Default**: Lazy loading should be your default strategy for most use cases because it allows you to load data only when needed, improving performance and memory efficiency.

2. **Use Eager Loading with Caution**: Eager loading is helpful when you always need the associated data (e.g., when displaying the parent and child data together on a webpage). However, it can lead to performance issues when overused,

 as it may load more data than necessary.

3. **Avoid the N+1 Problem**: Always check if lazy loading causes multiple queries (N+1 issue), and optimize by using `JOIN FETCH` or batch fetching where appropriate.

4. **Monitor Hibernate Queries**: Enable Hibernate’s SQL logging or use tools like Hibernate’s statistics to monitor query performance and detect if the fetching strategy is causing inefficiencies.

---

### **8. Data Fetching Methods**

In Hibernate, fetching data from the database can be achieved using various methods, each with its own behavior and use cases. The primary methods include `get()`, `load()`, `createQuery()`, and criteria-based methods. Here’s a detailed explanation of these methods and the differences between them:

#### 1. **get() Method**

The `get()` method is part of the Hibernate `Session` interface and is used to fetch data by the primary key.

##### Key Characteristics:
- **Immediate Fetching**: When you call `get()`, Hibernate immediately hits the database to retrieve the entity, even if it’s not used in the code after the retrieval.
- **Returns Null if Not Found**: If the entity with the given identifier does not exist, `get()` returns `null`.
- **Eager Loading**: Fetches the actual object from the database immediately.
  
##### Use Case:
Use `get()` when you need to fetch data immediately and are unsure if the entity exists in the database.

##### Example:
```java
Session session = sessionFactory.openSession();
Employee employee = session.get(Employee.class, 1); // Fetching Employee with ID 1
session.close();
```

In this example, `session.get(Employee.class, 1)` will immediately go to the database to fetch the `Employee` entity with `id = 1`.

---

#### 2. **load() Method**

The `load()` method is also part of the Hibernate `Session` interface and is used to fetch data by the primary key, but it behaves differently from `get()`.

##### Key Characteristics:
- **Lazy Loading**: `load()` does not immediately hit the database. Instead, it returns a proxy (a placeholder) of the entity. The actual database hit happens only when you access a property of the entity.
- **Throws Exception if Not Found**: If the entity with the given identifier does not exist, `load()` throws an `ObjectNotFoundException`.
- **Used for Proxy Loading**: Good for when you just need a reference to the entity without accessing any properties right away.

##### Use Case:
Use `load()` when you are certain that the entity exists in the database and you don’t need the data immediately.

##### Example:
```java
Session session = sessionFactory.openSession();
Employee employee = session.load(Employee.class, 1); // Proxy for Employee with ID 1
session.close();
```

In this case, `session.load(Employee.class, 1)` returns a proxy. Only if you access a property, such as `employee.getName()`, will Hibernate hit the database.

---

#### 3. **createQuery() Method**

The `createQuery()` method is used to retrieve data using HQL (Hibernate Query Language), a more flexible way to query data, allowing for complex queries and fine-tuned control over fetched data.

##### Key Characteristics:
- **HQL Based**: HQL is an object-oriented query language that is database-independent. It operates on entity names, attributes, etc.
- **Flexible for Complex Queries**: Can use `JOIN`, `WHERE`, and various other clauses.
- **Control Over Fetching Strategies**: You can specify whether to use eager or lazy loading, especially useful when fetching related entities.

##### Use Case:
Use `createQuery()` when you need a custom, complex query to fetch data that involves filtering, joins, or specific columns.

##### Example:
```java
Session session = sessionFactory.openSession();
Query<Employee> query = session.createQuery("FROM Employee WHERE salary > :minSalary", Employee.class);
query.setParameter("minSalary", 50000);
List<Employee> employees = query.getResultList();
session.close();
```

In this example, `createQuery()` allows for fetching employees with salaries over 50,000.

---

#### 4. **Criteria-Based Methods**

Hibernate provides criteria-based querying via `CriteriaBuilder` and `CriteriaQuery`. This approach is powerful for dynamic querying.

##### Key Characteristics:
- **Dynamic Querying**: Allows you to build queries dynamically based on conditions.
- **Type-Safe**: Uses the Criteria API introduced in JPA 2.0, providing type safety at compile time.
- **Useful for Complex Scenarios**: Ideal for applications with complex filtering requirements or where queries may vary based on user input.

##### Use Case:
Use criteria-based queries when the query is complex and may change dynamically, such as in search or filter scenarios.

##### Example:
```java
Session session = sessionFactory.openSession();
CriteriaBuilder cb = session.getCriteriaBuilder();
CriteriaQuery<Employee> cq = cb.createQuery(Employee.class);
Root<Employee> root = cq.from(Employee.class);
cq.select(root).where(cb.greaterThan(root.get("salary"), 50000));
List<Employee> employees = session.createQuery(cq).getResultList();
session.close();
```

In this example, a `CriteriaQuery` is created to fetch employees with a salary greater than 50,000.

---

#### **Differences Between `get()` and `load()`**

| Feature                      | `get()`                                | `load()`                             |
|------------------------------|----------------------------------------|--------------------------------------|
| **Data Fetching Strategy**   | Immediate (Eager)                     | Delayed (Lazy)                       |
| **Return if Not Found**      | `null`                                | Throws `ObjectNotFoundException`     |
| **Performance**              | Slower if data not used immediately   | More efficient if data isn’t needed right away |
| **Recommended Use Case**     | When data is needed immediately       | When only a reference (proxy) is needed initially |

### **Summary**

- **`get()`**: Eagerly fetches data; returns `null` if not found; use when data is immediately required.
- **`load()`**: Returns a proxy; lazily loads data upon access; throws an exception if not found; use when you only need a reference initially.
- **`createQuery()`**: Custom HQL-based queries for flexible and complex data retrieval.
- **Criteria-Based Queries**: Allows dynamic, type-safe querying for complex, condition-based retrieval.

By understanding and using these methods correctly, you can optimize Hibernate fetching strategies to improve application performance and responsiveness.

Fetching strategies in Hibernate play a crucial role in determining how efficiently your application interacts with the database. By understanding and choosing the right strategies like **Lazy** and **Eager Loading**, leveraging techniques like **Batch Fetching** and **JOIN FETCH**, and avoiding common pitfalls like the **N+1 Select Problem**, you can significantly improve the performance of your Hibernate-based applications.

---
---

## **11. Hibernate Relationships in Detail - 11**

Go on [Hibernate all topics list](#hibernate-topics-overview).

In Hibernate, relationships between entities can be modeled in several ways, reflecting the relationships that exist in the underlying database. Understanding these relationships is crucial for effective ORM (Object-Relational Mapping). The main types of relationships in Hibernate are **One-to-One**, **One-to-Many**, **Many-to-One**, and **Many-to-Many**. 

#### **1. One-to-One Relationships**

In a one-to-one relationship, one entity is associated with exactly one instance of another entity. This can be modeled in two ways: through a foreign key in one of the tables or by creating a shared primary key.

**Example Scenario**: Each `Employee` has one `Address`.

**Mapping One-to-One with a Foreign Key**:

```java
@Entity
@Table(name = "Employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address_id") // Foreign key in Employee table
    private Address address;

    // Getters and Setters
}

@Entity
@Table(name = "Address")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String street;
    private String city;

    // Getters and Setters
}
```

**Mapping One-to-One with a Shared Primary Key**:

In this approach, the `Address` entity uses the same primary key as the `Employee` entity.

```java
@Entity
@Table(name = "Employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne(mappedBy = "employee", cascade = CascadeType.ALL)
    private Address address;

    // Getters and Setters
}

@Entity
@Table(name = "Address")
public class Address {
    @Id
    private int id; // Same as Employee ID

    @OneToOne
    @MapsId
    private Employee employee;

    private String street;
    private String city;

    // Getters and Setters
}
```

#### **2. One-to-Many Relationships**

In a one-to-many relationship, one entity is associated with multiple instances of another entity. 

**Example Scenario**: An `Employee` can have multiple `Projects`.

**Mapping One-to-Many**:

```java
@Entity
@Table(name = "Employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private Set<Project> projects = new HashSet<>();

    // Getters and Setters
}

@Entity
@Table(name = "Project")
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    @ManyToOne
    @JoinColumn(name = "employee_id") // Foreign key in Project table
    private Employee employee;

    // Getters and Setters
}
```

#### **3. Many-to-One Relationships**

This is the inverse of a one-to-many relationship. In a many-to-one relationship, multiple instances of one entity are associated with a single instance of another entity.

**Example Scenario**: Many `Projects` can belong to one `Employee`.

In the above example, the `Project` class already establishes a many-to-one relationship with `Employee`. The key here is to ensure the `Project` table contains a foreign key that refers back to the `Employee`.

#### **4. Many-to-Many Relationships**

In a many-to-many relationship, multiple instances of one entity are associated with multiple instances of another entity.

**Example Scenario**: An `Employee` can work on multiple `Projects`, and each `Project` can have multiple `Employees`.

**Mapping Many-to-Many**:

```java
@Entity
@Table(name = "Employee")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
        name = "employee_project", // Join table
        joinColumns = @JoinColumn(name = "employee_id"), // Employee side
        inverseJoinColumns = @JoinColumn(name = "project_id") // Project side
    )
    private Set<Project> projects = new HashSet<>();

    // Getters and Setters
}

@Entity
@Table(name = "Project")
public class Project {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    @ManyToMany(mappedBy = "projects") // Inverse side
    private Set<Employee> employees = new HashSet<>();

    // Getters and Setters
}
```

### **Relationship Cascade Types**

To learn **Relationship Cascade Types** in detail then [click here](./6%20cascade-type.md)

Cascade types define how operations (like persist, merge, remove) are propagated from one entity to related entities.

- **CascadeType.PERSIST**: Save the child entity when the parent is saved.
- **CascadeType.MERGE**: Merge the child entity when the parent is merged.
- **CascadeType.REMOVE**: Delete the child entity when the parent is deleted.
- **CascadeType.ALL**: Applies all cascading operations.

**Example of Cascading**:
```java
@OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
private Set<Project> projects = new HashSet<>();
```
In this case, if an `Employee` is saved, all their associated `Project` entities will also be saved.

### **Bidirectional vs Unidirectional Relationships**

- **Unidirectional**: Only one side of the relationship is aware of the other. For example, an `Employee` knows about its `Address`, but `Address` does not need to know about `Employee`.

- **Bidirectional**: Both entities are aware of each other. For example, in a one-to-many relationship, `Employee` knows about its `Projects`, and each `Project` knows its `Employee`.

**Example of Bidirectional Relationship**:
```java
@Entity
@Table(name = "Employee")
public class Employee {
    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
    private Set<Project> projects = new HashSet<>();
}

@Entity
@Table(name = "Project")
public class Project {
    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
}
```

### **Composite Primary Key**

In scenarios where an entity has a composite primary key, Hibernate allows you to model this using the `@IdClass` or `@EmbeddedId` annotations.

**Example using @IdClass**:

1. Create a composite key class:

```java
@Embeddable
public class EmployeeProjectId implements Serializable {
    private int employeeId;
    private int projectId;

    // Getters, Setters, equals, and hashCode
}
```

2. Use it in your entity:

```java
@Entity
@Table(name = "employee_project")
@IdClass(EmployeeProjectId.class)
public class EmployeeProject {
    @Id
    private int employeeId;

    @Id
    private int projectId;

    @ManyToOne
    @MapsId("employeeId")
    private Employee employee;

    @ManyToOne
    @MapsId("projectId")
    private Project project;
}
```

### **Orphan Removal**

Orphan removal is used in one-to-many and many-to-one relationships to automatically delete child entities when they are removed from the parent entity's collection.

**Example**:
```java
@OneToMany(mappedBy = "employee", cascade = CascadeType.ALL, orphanRemoval = true)
private Set<Project> projects = new HashSet<>();
```
In this case, if a `Project` is removed from the `Employee`’s projects, it will be automatically deleted from the database.

### **Summary**

Hibernate relationships enable developers to define and manage associations between different entity classes easily. Understanding these relationships and their appropriate mapping is critical for effective data handling and ensuring database integrity. Using cascading operations, bidirectional mapping, and features like orphan removal can significantly enhance the management of related entities.

---
---

## **12. Inheritance Mapping in Hibernate - 12**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Inheritance mapping in Hibernate allows you to model relationships between classes that share common attributes and behaviors. This is especially useful when you have an object-oriented hierarchy that you want to map to a relational database. Hibernate provides several strategies for mapping inheritance, each suitable for different scenarios.

---

#### **1. Inheritance Types in Hibernate**

Hibernate supports three main inheritance mapping strategies:

1. **Single Table Inheritance**
2. **Table Per Class Inheritance**
3. **Joined Inheritance**

Let's explore each of these in detail.

---

### **1.1 Single Table Inheritance**

**Description**  
In the single table inheritance strategy, all classes in the inheritance hierarchy are stored in a single table. This table contains columns for all properties of the base class and derived classes. A discriminator column is used to differentiate between different types of entities.

**How it Works**  
- A single table is created that includes columns for all attributes of the parent class and all subclasses.
- The discriminator column identifies which type of subclass a row represents.

**Example Code**

```java
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "employee_type", discriminatorType = DiscriminatorType.STRING)
public abstract class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
}

@Entity
@DiscriminatorValue("FULL_TIME")
public class FullTimeEmployee extends Employee {
    private double salary;
}

@Entity
@DiscriminatorValue("PART_TIME")
public class PartTimeEmployee extends Employee {
    private double hourlyRate;
}
```

**Database Table Structure**

| id | name | employee_type | salary | hourlyRate |
|----|------|----------------|--------|------------|
| 1  | John | FULL_TIME      | 50000  | NULL       |
| 2  | Jane | PART_TIME      | NULL   | 20         |

**Advantages**
- Simplicity: Only one table means fewer joins and simpler queries.
- Easy to query all entities in the hierarchy.

**Disadvantages**
- Wasted space: Columns that do not apply to certain subclasses will have null values.
- Increased complexity: As the hierarchy grows, the table can become unwieldy.

---

### **1.2 Table Per Class Inheritance**

**Description**  
In the table per class inheritance strategy, each class in the hierarchy is mapped to its own table. The tables are linked by a foreign key relationship, but there is no direct relationship in the database.

**How it Works**  
- Each subclass has its own table that includes its specific attributes.
- The parent class does not have a table.

**Example Code**

```java
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
}

@Entity
public class FullTimeEmployee extends Employee {
    private double salary;
}

@Entity
public class PartTimeEmployee extends Employee {
    private double hourlyRate;
}
```

**Database Table Structure**

**FullTimeEmployee Table**

| id | name | salary  |
|----|------|---------|
| 1  | John | 50000   |

**PartTimeEmployee Table**

| id | name | hourlyRate |
|----|------|------------|
| 2  | Jane | 20         |

**Advantages**
- Each table is smaller and cleaner, with no nulls for irrelevant fields.
- Suitable for complex hierarchies with many subclasses.

**Disadvantages**
- Requires more complex queries to fetch all employee types.
- Not efficient for polymorphic queries as multiple tables must be joined.

---

### **1.3 Joined Inheritance**

**Description**  
In the joined inheritance strategy, each class has its own table, and the subclasses include a foreign key that references the parent class. This approach uses joins to retrieve data from the hierarchy.

**How it Works**  
- The base class is stored in one table, and each subclass is stored in its own table with a foreign key to the parent.

**Example Code**

```java
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
}

@Entity
public class FullTimeEmployee extends Employee {
    private double salary;
}

@Entity
public class PartTimeEmployee extends Employee {
    private double hourlyRate;
}
```

**Database Table Structure**

**Employee Table**

| id | name |
|----|------|
| 1  | John |
| 2  | Jane |

**FullTimeEmployee Table**

| id | salary  |
|----|---------|
| 1  | 50000   |

**PartTimeEmployee Table**

| id | hourlyRate |
|----|------------|
| 2  | 20         |

**Advantages**
- Normalized design: No redundant columns and efficient storage.
- Each subclass can extend the base class without affecting the other subclasses.

**Disadvantages**
- Performance overhead: Requires joins to fetch data, which can be costly with large datasets.
- Complexity: More complex queries are required to retrieve data from the hierarchy.

---

### **2. Choosing the Right Strategy**

**Factors to Consider**
- **Data Volume**: If you expect a large volume of data, consider using `Joined` or `Table Per Class` to avoid null values in a single table.
- **Query Complexity**: If you need simple queries, `Single Table` might be more efficient.
- **Data Integrity**: If your hierarchy is complex, the `Joined` strategy is often more appropriate due to its normalized design.

---

### **3. Practical Example**

Let's consider a practical scenario involving an employee management system. In this example, we'll demonstrate how to implement the inheritance mapping strategies discussed above.

#### Example Implementation

1. **Single Table Inheritance**:

```java
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "type")
public abstract class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    // Getters and setters
}

@Entity
@DiscriminatorValue("FT")
public class FullTimeEmployee extends Employee {
    private double salary;

    // Getters and setters
}

@Entity
@DiscriminatorValue("PT")
public class PartTimeEmployee extends Employee {
    private double hourlyRate;

    // Getters and setters
}
```

2. **Table Per Class Inheritance**:

```java
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    // Getters and setters
}

@Entity
public class FullTimeEmployee extends Employee {
    private double salary;

    // Getters and setters
}

@Entity
public class PartTimeEmployee extends Employee {
    private double hourlyRate;

    // Getters and setters
}
```

3. **Joined Inheritance**:

```java
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    // Getters and setters
}

@Entity
public class FullTimeEmployee extends Employee {
    private double salary;

    // Getters and setters
}

@Entity
public class PartTimeEmployee extends Employee {
    private double hourlyRate;

    // Getters and setters
}
```

---

### **4. Querying Inheritance Mappings**

To retrieve entities from the inheritance hierarchy, you can use HQL or the Criteria API.

**HQL Example**:
```java
String hql = "FROM Employee";
List<Employee> employees = session.createQuery(hql, Employee.class).list();
```

**Criteria API Example**:
```java
CriteriaBuilder cb = session.getCriteriaBuilder();
CriteriaQuery<Employee> query = cb.createQuery(Employee.class);
Root<Employee> root = query.from(Employee.class);
query.select(root);
List<Employee> employees = session.createQuery(query).getResultList();
```

---

Inheritance mapping in Hibernate is a powerful feature that allows you to model complex object hierarchies. By understanding the different strategies—single table, table per class, and joined—you can choose the most appropriate mapping for your application's needs. Each strategy has its advantages and trade-offs, making it crucial to consider your specific use case when designing your data model.

By mastering inheritance mapping, you can create more maintainable and efficient applications that leverage Hibernate's full capabilities.

---
---

## **13. Integrating Hibernate with Other Frameworks - 13**

Go on [Hibernate all topics list](#hibernate-topics-overview).

"Integrating Hibernate with Other Frameworks," focuses on how Hibernate can work seamlessly with various frameworks, particularly Spring and Spring Data JPA. This integration enhances development productivity, simplifies data access, and provides robust transaction management. Below is a detailed explanation of this topic.

---

### **Integrating Hibernate with Other Frameworks**

#### **1. Overview of Framework Integration**
Hibernate is often used in combination with other frameworks to create powerful and maintainable applications. The most common framework for integration is Spring, which provides a comprehensive environment for enterprise applications. 

Key benefits of integration include:
- **Transaction Management**: Spring manages transactions across multiple data sources and integrates well with Hibernate.
- **Dependency Injection**: Spring’s Inversion of Control (IoC) facilitates easy management of Hibernate sessions and DAOs.
- **Simplified Configuration**: Using Spring's configuration capabilities, you can easily set up Hibernate properties.

---

#### **2. Integrating Hibernate with Spring Framework**

**2.1. Setting Up Dependencies**

If you're using Maven, include the following dependencies in your `pom.xml` to set up Spring with Hibernate:

```xml
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.3.10</version>
</dependency>
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-orm</artifactId>
    <version>5.3.10</version>
</dependency>
<dependency>
    <groupId>org.hibernate</groupId>
    <artifactId>hibernate-core</artifactId>
    <version>5.4.32.Final</version>
</dependency>
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.25</version>
</dependency>
```

**2.2. Configuring Spring with Hibernate**

You can configure Hibernate in Spring either using XML or Java configuration.

**XML Configuration**
Create a `spring-config.xml` file:

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource">
        <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
        <property name="url" value="jdbc:mysql://localhost:3306/yourdb"/>
        <property name="username" value="root"/>
        <property name="password" value="password"/>
    </bean>

    <bean id="sessionFactory" class="org.springframework.orm.hibernate5.LocalSessionFactoryBean">
        <property name="dataSource" ref="dataSource"/>
        <property name="packagesToScan" value="com.example.model"/>
        <property name="hibernateProperties">
            <props>
                <prop key="hibernate.dialect">org.hibernate.dialect.MySQLDialect</prop>
                <prop key="hibernate.show_sql">true</prop>
                <prop key="hibernate.hbm2ddl.auto">update</prop>
            </props>
        </property>
    </bean>

    <bean id="transactionManager" class="org.springframework.orm.hibernate5.HibernateTransactionManager">
        <property name="sessionFactory" ref="sessionFactory"/>
    </bean>

    <tx:annotation-driven transaction-manager="transactionManager"/>
</beans>
```

**Java Configuration**
Using Java Configuration with Spring, you can define beans using the `@Configuration` annotation:

```java
@Configuration
@EnableTransactionManagement
public class AppConfig {

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/yourdb");
        dataSource.setUsername("root");
        dataSource.setPassword("password");
        return dataSource;
    }

    @Bean
    public LocalSessionFactoryBean sessionFactory() {
        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setPackagesToScan("com.example.model");
        Properties hibernateProperties = new Properties();
        hibernateProperties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        hibernateProperties.put("hibernate.show_sql", "true");
        hibernateProperties.put("hibernate.hbm2ddl.auto", "update");
        sessionFactory.setHibernateProperties(hibernateProperties);
        return sessionFactory;
    }

    @Bean
    public HibernateTransactionManager transactionManager() {
        HibernateTransactionManager txManager = new HibernateTransactionManager();
        txManager.setSessionFactory(sessionFactory().getObject());
        return txManager;
    }
}
```

**2.3. Using Hibernate in Spring Services**

To manage transactions, annotate service classes with `@Transactional`. This automatically manages transaction boundaries.

```java
@Service
public class EmployeeService {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void saveEmployee(Employee employee) {
        sessionFactory.getCurrentSession().save(employee);
    }

    @Transactional(readOnly = true)
    public Employee getEmployee(int id) {
        return sessionFactory.getCurrentSession().get(Employee.class, id);
    }
}
```

---

#### **3. Spring Data JPA with Hibernate**

**3.1. Overview of Spring Data JPA**
Spring Data JPA simplifies the implementation of JPA data access layers, providing a more convenient and less boilerplate way to work with Hibernate. 

**3.2. Adding Dependencies**
Include Spring Data JPA in your `pom.xml`:

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
```

**3.3. Defining JPA Repositories**
Create an interface extending `JpaRepository` to manage entities easily:

```java
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
    List<Employee> findByName(String name);
}
```

**3.4. Using Repositories in Services**
You can easily use repositories in your service classes:

```java
@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public void saveEmployee(Employee employee) {
        employeeRepository.save(employee);
    }

    public Employee getEmployee(int id) {
        return employeeRepository.findById(id).orElse(null);
    }

    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }
}
```

---

#### **4. Handling Transactions in Spring Data JPA**

Spring Data JPA integrates transaction management with `@Transactional` annotation to handle database transactions seamlessly.

```java
@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Transactional
    public void saveEmployee(Employee employee) {
        employeeRepository.save(employee);
    }

    @Transactional(readOnly = true)
    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }
}
```

---

#### **5. Benefits of Integrating Hibernate with Spring**

- **Decoupled Architecture**: By using Spring’s dependency injection, your Hibernate code is decoupled from the rest of your application, promoting cleaner architecture.
- **Easier Testing**: Spring provides support for unit testing, allowing you to mock dependencies easily.
- **Simplified Configuration**: Spring’s configuration options make it easier to manage Hibernate settings and beans.
- **Enhanced Transaction Management**: Spring’s transaction management provides powerful features for controlling transactions across multiple resources.

---

#### **6. Advanced Topics**

**6.1. Customizing Transaction Management**
You can customize the transaction management strategy by implementing `PlatformTransactionManager` for more complex use cases.

**6.2. Integrating with Spring Security**
You can secure your Hibernate-based applications using Spring Security, managing authentication and authorization based on user roles.

**6.3. Using Aspect-Oriented Programming (AOP)**
Spring AOP can be used with Hibernate to handle cross-cutting concerns such as logging, caching, or performance monitoring.

---

Integrating Hibernate with frameworks like Spring and Spring Data JPA greatly enhances the development experience by providing powerful features for data access, transaction management, and dependency injection. This integration allows developers to build maintainable, scalable applications with less boilerplate code and improved productivity.

---
---

## **14. Advanced Hibernate Topics - 14**

Go on [Hibernate all topics list](#hibernate-topics-overview).

"Advanced Hibernate Topics," covers several specialized areas of Hibernate that enhance its functionality and improve performance. Here’s a detailed breakdown of each subtopic within this chapter.

#### **1. Custom Types and UserType Interface**

Hibernate provides a mechanism to define custom types through the `UserType` interface. This allows you to create mappings for Java types that Hibernate doesn't support out-of-the-box.

**Use Cases for Custom Types:**
- To map Java types to SQL types that are not directly supported by Hibernate.
- To implement complex logic for reading/writing values to the database.

**Implementing UserType:**
To create a custom type, you need to implement the `UserType` interface, which has several methods:

- **`sqlTypes()`**: Returns an array of SQL types that this type maps to.
- **`returnedClass()`**: Returns the Java class type this custom type represents.
- **`nullSafeGet(ResultSet rs, String[] names, SharedSessionContractImplementor session, Object owner)`**: Retrieves the value from the result set and converts it to the Java type.
- **`nullSafeSet(PreparedStatement st, Object value, int index, SharedSessionContractImplementor session)`**: Sets the value in the prepared statement.
- **`deepCopy(Object value)`**: Returns a deep copy of the value.
- **`isMutable()`**: Indicates whether the type is mutable.
- **`assemble(Serializable cached, Object owner)`**: Reassembles the value from the cache.
- **`disassemble(Object value)`**: Disassembles the value into a serializable format for caching.

**Example of a Custom UserType:**
Here’s a simple example of a custom type that maps a `List<String>` to a database column as a comma-separated string:

```java
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.usertype.UserType;
import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Arrays;
import java.util.List;

public class StringListType implements UserType {
    @Override
    public int[] sqlTypes() {
        return new int[]{Types.VARCHAR};
    }

    @Override
    public Class<List> returnedClass() {
        return List.class;
    }

    @Override
    public boolean equals(Object x, Object y) {
        return (x == null && y == null) || (x != null && x.equals(y));
    }

    @Override
    public int hashCode(Object x) {
        return x.hashCode();
    }

    @Override
    public Object nullSafeGet(ResultSet rs, String[] names, SharedSessionContractImplementor session, Object owner) throws SQLException {
        String value = rs.getString(names[0]);
        return value == null ? null : Arrays.asList(value.split(","));
    }

    @Override
    public void nullSafeSet(PreparedStatement st, Object value, int index, SharedSessionContractImplementor session) throws SQLException {
        st.setString(index, value == null ? null : String.join(",", (List<String>) value));
    }

    @Override
    public Object deepCopy(Object value) {
        return value == null ? null : List.copyOf((List<String>) value);
    }

    @Override
    public boolean isMutable() {
        return true;
    }

    @Override
    public Serializable disassemble(Object value) {
        return (Serializable) deepCopy(value);
    }

    @Override
    public Object assemble(Serializable cached, Object owner) {
        return cached;
    }
}
```

To use this custom type in an entity, annotate the field with `@Type`:

```java
@Type(type = "com.example.StringListType")
private List<String> tags;
```

---

#### **2. Working with Collections**

Hibernate supports collections such as `List`, `Set`, and `Map`, allowing you to model relationships between entities effectively. Proper mapping of collections is crucial for performance and data integrity.

**Types of Collections in Hibernate:**
- **List**: Ordered collections that can contain duplicates.
- **Set**: Unordered collections that cannot contain duplicates.
- **Map**: Key-value pairs where each key is unique.

**Mapping Collections:**

**1. List Example:**
```java
@Entity
public class Employee {
    @Id
    private Long id;

    @OneToMany(cascade = CascadeType.ALL)
    @OrderColumn(name = "position")
    private List<Address> addresses;
}
```

**2. Set Example:**
```java
@Entity
public class Department {
    @Id
    private Long id;

    @OneToMany(cascade = CascadeType.ALL)
    private Set<Employee> employees = new HashSet<>();
}
```

**3. Map Example:**
```java
@Entity
public class Product {
    @Id
    private Long id;

    @ElementCollection
    @CollectionTable(name = "product_attributes", joinColumns = @JoinColumn(name = "product_id"))
    @MapKeyColumn(name = "attribute_name")
    private Map<String, String> attributes = new HashMap<>();
}
```

**Best Practices:**
- Choose the appropriate collection type based on your requirements (e.g., use `Set` for unique elements).
- Use `@Cascade` to manage operations on related collections.
- Avoid large collections; consider pagination or lazy loading.

---

#### **3. Hibernate Event Listeners and Interceptors**

Hibernate allows you to define custom behaviors that can be triggered at specific points in the entity lifecycle through event listeners and interceptors.

**Event Listeners:**
Event listeners can respond to various Hibernate events like entity creation, deletion, and updates.

**Common Events:**
- **PrePersist**: Triggered before an entity is persisted.
- **PostPersist**: Triggered after an entity is persisted.
- **PreUpdate**: Triggered before an entity is updated.
- **PostUpdate**: Triggered after an entity is updated.

**Implementing Event Listeners:**
To create a listener, implement the `PreInsertEventListener`, `PreUpdateEventListener`, etc., interfaces.

```java
public class MyEntityListener implements PrePersistEventListener {
    @Override
    public boolean onPrePersist(PrePersistEvent event) {
        System.out.println("About to persist: " + event.getEntity());
        return false; // return true to cancel the event
    }
}
```

**Registering Listeners:**
Listeners can be registered in the Hibernate configuration.

```xml
<property name="hibernate.ejb.interceptor">com.example.MyEntityListener</property>
```

**Interceptors:**
Interceptors provide a lower-level way to intercept and modify the behavior of Hibernate operations.

**Common Use Cases:**
- Implementing custom logging or auditing.
- Modifying the state of entities before they are persisted or updated.

**Example Interceptor:**
```java
public class MyInterceptor extends EmptyInterceptor {
    @Override
    public boolean onFlushDirty(Object entity, Serializable id, Object[] currentState, Object[] previousState, String[] propertyNames, Type[] types) {
        System.out.println("Flushing dirty entity: " + entity);
        return super.onFlushDirty(entity, id, currentState, previousState, propertyNames, types);
    }
}
```

**Using the Interceptor:**
Interceptors can be applied to a `Session` or `SessionFactory`.

```java
Session session = sessionFactory.withOptions().interceptor(new MyInterceptor()).openSession();
```

---

#### **4. Batch Processing**

Batch processing improves performance when inserting or updating a large number of records by minimizing the number of database round-trips.

**Batch Size Configuration:**
Set the batch size in the Hibernate configuration file.

```xml
<property name="hibernate.jdbc.batch_size">50</property>
```

**Using Batch Processing:**
You can batch operations manually in your code:

```java
Session session = sessionFactory.openSession();
Transaction transaction = session.beginTransaction();

for (int i = 0; i < 1000; i++) {
    Employee emp = new Employee();
    emp.setName("Employee " + i);
    session.save(emp);

    if (i % 50 == 0) { // Flush and clear every 50 inserts
        session.flush();
        session.clear();
    }
}

transaction.commit();
session.close();
```

**Benefits:**
- Reduces the number of database calls.
- Improves performance for bulk operations.

---

### **5. Advanced Query Techniques**

Hibernate supports advanced querying techniques to optimize performance and enhance flexibility.

**Subqueries:**
You can use subqueries in HQL for complex filtering:

```java
String hql = "FROM Employee e WHERE e.salary > (SELECT AVG(salary) FROM Employee)";
List<Employee> results = session.createQuery(hql).list();
```

**Dynamic Queries:**
Use the Criteria API to create dynamic queries that can be constructed at runtime:

```java
CriteriaBuilder cb = session.getCriteriaBuilder();
CriteriaQuery<Employee> query = cb.createQuery(Employee.class);
Root<Employee> root = query.from(Employee.class);
Predicate condition = cb.equal(root.get("department").get("name"), "Sales");
query.select(root).where(condition);
List<Employee> results = session.createQuery(query).getResultList();
```

**Full-Text Search:**
Hibernate integrates with Lucene for full-text search capabilities. You can create indexed entities and perform full-text queries.

**Example:**
```java
@Field
private String description;

FullTextSession fullTextSession = Search.getFullTextSession(session);
QueryBuilder qb = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Product.class).get();
org.apache.lucene.search.Query luceneQuery = qb.keyword().onField("description").matching("keyword").

createQuery();
FullTextQuery jpaQuery = fullTextSession.createFullTextQuery(luceneQuery, Product.class);
List<Product> results = jpaQuery.getResultList();
```

---

### **6. Hibernate and JPA**

Hibernate is the leading implementation of the Java Persistence API (JPA), which is a standard for ORM in Java.

**JPA Annotations:**
When using Hibernate with JPA, you can use JPA annotations to define entity mappings, such as:

```java
@Entity
@Table(name = "employees")
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;
}
```

**Entity Manager:**
When using JPA, you typically work with the `EntityManager` instead of `Session`.

```java
EntityManager em = entityManagerFactory.createEntityManager();
em.getTransaction().begin();
em.persist(new Employee("John Doe"));
em.getTransaction().commit();
```

**JPQL (Java Persistence Query Language):**
JPQL is an object-oriented query language similar to SQL, but it operates on entity objects instead of database tables.

```java
List<Employee> employees = em.createQuery("SELECT e FROM Employee e WHERE e.name = :name", Employee.class)
                              .setParameter("name", "John Doe")
                              .getResultList();
```

---

The **Advanced Hibernate Topics** chapter dives deep into sophisticated features that enhance the capability and performance of Hibernate. By mastering these topics, developers can create more efficient, robust, and maintainable applications that leverage the full potential of Hibernate as an ORM tool.

---
---

## **15. Hibernate Validation - 15**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Let’s delve into **Hibernate Validation**, which is an integral part of ensuring data integrity and enforcing business rules within your Java applications. This chapter will cover the following aspects:

### **1. Introduction to Hibernate Validator**

**Hibernate Validator** is the reference implementation of the **Java Bean Validation** specification (JSR 380). It allows you to define and enforce validation constraints on your entity classes, ensuring that the data meets specific criteria before being persisted in the database.

### **2. Bean Validation Basics**

**What is Bean Validation?**
- Bean Validation is a framework that provides a way to define constraints on Java objects (or beans) using annotations. These constraints can include checks for null values, size limits, value ranges, and patterns (for strings).

### **3. Common Annotations in Hibernate Validator**

Hibernate Validator provides a range of annotations that can be applied to fields or methods in your entity classes. Here are some of the most commonly used ones:

- **@NotNull**: Ensures that a field is not null.
  ```java
  @NotNull
  private String name;
  ```

- **@Size**: Validates the size of a string, collection, or array.
  ```java
  @Size(min = 2, max = 30)
  private String username;
  ```

- **@Min**: Specifies that a numeric field must be greater than or equal to a specified minimum value.
  ```java
  @Min(18)
  private int age;
  ```

- **@Max**: Specifies that a numeric field must be less than or equal to a specified maximum value.
  ```java
  @Max(100)
  private int age;
  ```

- **@Email**: Checks that a string is a valid email format.
  ```java
  @Email
  private String email;
  ```

- **@Pattern**: Validates that a string matches a specified regular expression.
  ```java
  @Pattern(regexp = "^[A-Z][a-z]*$")
  private String firstName;
  ```

- **@AssertTrue**: Validates that a boolean field is true.
  ```java
  @AssertTrue
  private boolean active;
  ```

- **@AssertFalse**: Validates that a boolean field is false.
  ```java
  @AssertFalse
  private boolean deleted;
  ```

### **4. Grouping Constraints**

Bean validation supports **groups** that allow you to apply different sets of constraints for different contexts (e.g., creation, update). 

```java
public interface Create {}
public interface Update {}
```

You can specify the validation groups when validating:

```java
Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
validator.validate(entity, Create.class);
```

### **5. Custom Constraints**

If the built-in constraints do not meet your requirements, you can define your own custom constraints.

**Defining a Custom Annotation**
1. Create a custom annotation.
2. Specify the validation logic in a separate class implementing `ConstraintValidator`.

Example:

```java
@Constraint(validatedBy = MyCustomValidator.class)
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface MyCustomConstraint {
    String message() default "Invalid value";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
```

**Implementing the ConstraintValidator**

```java
public class MyCustomValidator implements ConstraintValidator<MyCustomConstraint, String> {
    @Override
    public void initialize(MyCustomConstraint constraintAnnotation) {}

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        // Custom validation logic here
        return value != null && value.matches("^[A-Z].*");
    }
}
```

### **6. Validating Entities**

You can validate an entity using the `Validator` interface. 

1. **Get a Validator instance**:
```java
ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
Validator validator = factory.getValidator();
```

2. **Validate an entity**:
```java
Set<ConstraintViolation<Employee>> violations = validator.validate(employee);
for (ConstraintViolation<Employee> violation : violations) {
    System.out.println(violation.getMessage());
}
```

### **7. Exception Handling**

When validation fails, a `ConstraintViolation` is thrown, containing details about the validation error:

- `getMessage()`: Returns the error message.
- `getPropertyPath()`: Provides the path to the invalid property.
- `getInvalidValue()`: Returns the invalid value that caused the violation.

### **8. Integration with Hibernate**

When using Hibernate with JPA, validation can be seamlessly integrated with the entity lifecycle:

- **Pre-persist Validation**: Hibernate validates entities before they are persisted to the database.
- **Automatic Validation**: When you call `EntityManager.persist()`, Hibernate automatically performs validation on the entity.

### **9. Validating Nested Objects**

You can also validate nested objects within your entities. Use the `@Valid` annotation to trigger validation on nested properties.

Example:

```java
@Entity
public class Employee {
    @Valid
    private Address address;
}
```

### **10. Spring Integration with Hibernate Validator**

Spring provides built-in support for Hibernate Validator. You can use Spring’s validation mechanism with Hibernate Validator:

- **@Valid**: Use this annotation in Spring controllers or service methods to trigger validation.
```java
@PostMapping("/employees")
public ResponseEntity<Void> createEmployee(@Valid @RequestBody Employee employee) {
    employeeService.save(employee);
    return ResponseEntity.status(HttpStatus.CREATED).build();
}
```

### **11. Performance Considerations**

When using Hibernate Validator:
- Avoid excessive validation. Only validate when necessary (e.g., before persisting or updating entities).
- Use group validation for specific scenarios to reduce overhead.
- Keep custom validation logic efficient to prevent performance bottlenecks.

### **12. Conclusion**

Hibernate Validator provides a powerful mechanism for enforcing data integrity and business rules at the object level. By leveraging its capabilities, you can ensure that your application remains robust and maintainable. Custom constraints and integration with other frameworks like Spring make it highly flexible and useful in various scenarios.

### **13. Example of Full Entity with Validation**

Here’s a complete example of an entity using Hibernate Validator:

```java
import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "Name cannot be null")
    @Size(min = 2, max = 50, message = "Name must be between 2 and 50 characters")
    private String name;

    @Min(value = 18, message = "Must be at least 18 years old")
    private int age;

    @Email(message = "Email should be valid")
    private String email;

    @Valid
    private Address address; // Assuming Address is another entity with its own validations

    // Getters and Setters
}
```

This example illustrates the use of various validation annotations on the `Employee` entity, ensuring that all constraints are enforced when persisting to the database.

---
---

## **16. Hibernate Performance Optimization - 16**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Performance optimization in Hibernate is crucial for developing efficient applications that can handle large datasets and high user loads. This chapter covers various strategies and techniques to enhance Hibernate's performance, focusing on configurations, fetching strategies, and best practices.

---

#### **1. Hibernate Statistics**

Hibernate provides a built-in statistics feature to monitor the performance of your application. This feature helps identify potential bottlenecks and optimize query performance.

**Enabling Hibernate Statistics**
To enable statistics, set the following property in your Hibernate configuration file (`hibernate.cfg.xml`):

```xml
<property name="hibernate.generate_statistics">true</property>
```

**Accessing Statistics**
You can access statistics through the `SessionFactory`:

```java
SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
Statistics stats = sessionFactory.getStatistics();
stats.setStatisticsEnabled(true);
```

**Key Metrics**
- **Query Execution Time**: The total time spent executing queries.
- **Entity Load Count**: The number of entities loaded from the database.
- **Flush Count**: The number of times the session was flushed.
- **Second Level Cache Hit Count**: The number of hits in the second-level cache.

**Example of Using Statistics**
```java
System.out.println("Entity Load Count: " + stats.getEntityLoadCount());
System.out.println("Query Execution Count: " + stats.getQueryExecutionCount());
```

---

#### **2. Batch Processing**

Batch processing allows you to optimize the performance of bulk operations, such as inserting or updating multiple records in a single batch. This minimizes the number of database round-trips.

**Configuring Batch Size**
To enable batch processing, you can set the `hibernate.jdbc.batch_size` property in your configuration:

```xml
<property name="hibernate.jdbc.batch_size">20</property>
```

**Using Batch Processing**
When saving entities in a loop, instead of calling `session.save()` for each entity, you can save them in batches:

```java
Session session = sessionFactory.openSession();
Transaction transaction = session.beginTransaction();

for (int i = 0; i < 1000; i++) {
    Employee emp = new Employee();
    emp.setName("Employee " + i);
    session.save(emp);

    // Flush and clear the session every 20 entities
    if (i % 20 == 0) {
        session.flush();
        session.clear();
    }
}
transaction.commit();
session.close();
```

**Benefits of Batch Processing**
- Reduced database round-trips.
- Improved performance when inserting or updating multiple records.

---

#### **3. Caching Strategies**

Caching is one of the most effective ways to improve performance in Hibernate applications. It minimizes the number of database queries by storing frequently accessed data in memory.

**Two Levels of Caching**
- **First-Level Cache**: Associated with the `Session`. It is enabled by default and stores objects during the session lifecycle.
- **Second-Level Cache**: Shared among multiple sessions. It must be explicitly enabled and configured.

**Configuring Second-Level Cache**
To configure the second-level cache, use a caching provider like Ehcache. In your configuration file, set the following properties:

```xml
<property name="hibernate.cache.use_second_level_cache">true</property>
<property name="hibernate.cache.region.factory_class">
    org.hibernate.cache.ehcache.EhCacheRegionFactory
</property>
<property name="hibernate.cache.use_query_cache">true</property>
```

**Cache Regions**
Different entities or collections can be stored in separate cache regions. Configure caching for specific entities:

```java
@Entity
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Employee {
    // ...
}
```

**Query Cache**
The query cache stores the results of queries. Enable it by setting the following property:

```xml
<property name="hibernate.cache.use_query_cache">true</property>
```

**Using Query Cache**
To use the query cache, specify the cacheable attribute when creating a query:

```java
Query query = session.createQuery("from Employee");
query.setCacheable(true);
List<Employee> employees = query.list();
```

**Benefits of Caching**
- Reduces the number of database queries.
- Improves application response time.
- Enhances scalability.

---

#### **4. Fetching Strategies**

Fetching strategies determine how related entities are loaded from the database. Choosing the appropriate fetching strategy can significantly impact performance.

**Lazy Loading vs Eager Loading**
- **Lazy Loading**: Related entities are loaded on demand, reducing the initial loading time. It uses proxies to delay loading until the property is accessed.
  ```java
  @OneToMany(fetch = FetchType.LAZY)
  private Set<Address> addresses;
  ```

- **Eager Loading**: Related entities are loaded immediately with the parent entity, which can lead to performance overhead if not managed properly.
  ```java
  @OneToMany(fetch = FetchType.EAGER)
  private Set<Address> addresses;
  ```

**Batch Fetching**
Batch fetching allows Hibernate to load multiple related entities in one query, minimizing the number of queries executed. This is useful in lazy loading scenarios.

```xml
<property name="hibernate.default_batch_fetch_size">10</property>
```

**Example of Batch Fetching**
When accessing a collection of entities, batch fetching retrieves them in groups rather than one at a time:

```java
List<Employee> employees = session.createQuery("from Employee").list();
for (Employee employee : employees) {
    // Each employee's addresses will be loaded in batches
    Set<Address> addresses = employee.getAddresses();
}
```

**Join Fetching**
Join fetching retrieves related entities in a single query using an SQL JOIN. This approach can help avoid the N+1 problem, where multiple queries are executed to load related entities.

```java
String hql = "SELECT e FROM Employee e JOIN FETCH e.addresses";
List<Employee> employees = session.createQuery(hql).list();
```

---

#### **5. N+1 Problem**

The N+1 problem occurs when Hibernate executes one query to load the parent entity and then N additional queries to load related child entities, resulting in poor performance.

**Identifying N+1 Problem**
You can identify the N+1 problem by analyzing query logs or Hibernate statistics. If you see a pattern of multiple queries being executed for related entities, it indicates an N+1 issue.

**Solutions to N+1 Problem**
- **Using Eager Fetching**: Load related entities eagerly to avoid multiple queries.
- **Using Join Fetching**: Use HQL or Criteria API to fetch related entities in a single query.
- **Batch Fetching**: Configure batch fetching to minimize the number of queries executed.

---

#### **6. Connection Pooling**

Connection pooling is essential for optimizing database connections. It allows multiple sessions to share a small number of connections, reducing the overhead of creating and closing connections repeatedly.

**Configuring Connection Pooling**
Hibernate supports various connection pooling providers like C3P0, HikariCP, and Apache DBCP. Example configuration with HikariCP:

```xml
<property name="hibernate.hikari.maximumPoolSize">10</property>
<property name="hibernate.hikari.connectionTimeout">30000</property>
<property name="hibernate.hikari.idleTimeout">600000</property>
```

**Benefits of Connection Pooling**
- Reduces connection creation overhead.
- Improves application performance under high load.
- Efficient management of database connections.

---

#### **7. Avoiding Unnecessary Updates**

Updating entities unnecessarily can lead to performance issues. Hibernate flushes the session and synchronizes the state of the entities with the database, which can be expensive.

**Optimizing Entity Updates**
- Use the `session.update()` method only when necessary.
- Consider using a transaction boundary wisely to reduce flush operations.

**Example of Conditional Updates**
```java
if (!session.contains(entity)) {
    session.update(entity);
}
```

---

#### **8. Best Practices for Hibernate Performance**

**Use Projections Instead of Full Entities**
When you only need specific fields, use projections to avoid loading unnecessary data:

```java
Query query = session.createQuery("SELECT e.name, e.salary FROM Employee e");
List<Object[]> results = query.list();
```

**Tune Fetch Size**
Adjust the fetch size for large result sets to optimize performance. This can be configured using:

```xml
<property name="hibernate.jdbc.fetch_size">50</property>
```

**Minimize the Use of Flushes**
Only flush the session when necessary. Frequent flushing can lead to performance degradation.

**Consider the Right Cascade Type**
Use cascade operations judiciously. Avoid cascading to entities that don’t need to be persisted together.

**Batch Size for Collections**
When dealing with collections, set an appropriate batch size to limit the number of queries generated.

---

Optimizing Hibernate performance involves leveraging caching, configuring batch processing, employing efficient fetching strategies, and utilizing connection pooling. By following best practices and understanding the underlying mechanisms of Hibernate, you can significantly improve the performance of your application. Regularly monitoring Hibernate statistics will help you identify bottlenecks and optimize accordingly.

---
---

## **17. Best Practices and Troubleshooting - 17**

Go on [Hibernate all topics list](#hibernate-topics-overview).

**DTOs (Data Transfer Objects)**
Use DTOs to decouple your business layer from Hibernate entities, improving maintainability and flexibility.

---
---

## **18. Testing Hibernate Applications - 18**

Go on [Hibernate all topics list](#hibernate-topics-overview).

**Unit Testing with Hibernate**
Use JUnit or TestNG to test Hibernate functionality. Mocking frameworks like Mockito are helpful for testing DAO layers.

---
---

## **19. Migration and Upgrades - 19**

Go on [Hibernate all topics list](#hibernate-topics-overview).

**Migrating Between Hibernate Versions**
Hibernate versions come with significant changes, so always consult the migration guide provided by Hibernate.

---
---

## **20. Advanced Use Cases - 20**

Go on [Hibernate all topics list](#hibernate-topics-overview).

**Event Listeners and Interceptors**
Hibernate provides interceptors and event listeners to hook into entity lifecycle events, such as before saving, updating, or deleting an entity.

---
---

## **21. Hibernate in the Cloud - 21**

Go on [Hibernate all topics list](#hibernate-topics-overview).

**Configuring Hibernate for Cloud Databases**
Hibernate can be configured to work with cloud databases like AWS RDS, Google Cloud SQL, or Azure SQL by simply adjusting connection settings.

---
---

## **22. Security in Hibernate - 22**

Go on [Hibernate all topics list](#hibernate-topics-overview).

**SQL Injection Prevention**
Hibernate uses parameterized queries, which automatically protect against SQL injection.

**Encryption of Sensitive Data**
You can encrypt sensitive data using custom Hibernate types or by using JPA `@Converter` classes.

---
---

### **23. Commonly Used Hibernate Annotations - 23**

Go on [Hibernate all topics list](#hibernate-topics-overview).

Hibernate annotations are crucial for mapping Java classes and their properties to database tables and columns. Annotations make Hibernate configuration simpler and more readable, eliminating the need for complex XML mappings. Let's go through each commonly used annotation in detail.

---

#### **1. @Entity**

- **Purpose**: Marks a Java class as a persistent entity, meaning it maps to a table in the database.
- **Usage**: Place `@Entity` above a class to inform Hibernate that it should manage the class as an entity.
- **Details**: Every class annotated with `@Entity` must have a primary key. Without `@Entity`, Hibernate ignores the class.

Example:
```java
@Entity
public class Employee {
    @Id
    private int id;
    private String name;
}
```

---

#### **2. @Table**

- **Purpose**: Specifies the table in the database that the entity should map to.
- **Usage**: Used in conjunction with `@Entity` and allows defining the table name and schema.
- **Attributes**:
  - `name`: The table name (if different from the entity name).
  - `schema`: Specifies the schema in which the table resides.

Example:
```java
@Entity
@Table(name = "employees", schema = "public")
public class Employee {
    @Id
    private int id;
    private String name;
}
```

---

#### **3. @Id**

- **Purpose**: Specifies the primary key of an entity.
- **Usage**: Placed on a field to indicate that it is the primary key for the entity’s table.
- **Details**: Every entity must have a unique `@Id`. Hibernate uses this value to uniquely identify each entity instance.

Example:
```java
@Entity
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
}
```

---

#### **4. @GeneratedValue**

- **Purpose**: Defines how the primary key should be generated.
- **Usage**: Placed with `@Id` to specify the generation strategy.
- **Attributes**:
  - `strategy`: Determines the key generation strategy. Common strategies include:
    - `AUTO`: Hibernate chooses the best strategy based on the database.
    - `IDENTITY`: Uses the database's identity column feature.
    - `SEQUENCE`: Uses a database sequence (recommended for Oracle, PostgreSQL).
    - `TABLE`: Uses a specific database table to maintain identifiers.

Example:
```java
@Id
@GeneratedValue(strategy = GenerationType.SEQUENCE)
private int id;
```

---

#### **5. @Column**

- **Purpose**: Maps a class field to a database column.
- **Usage**: Used to specify column details if they differ from the field’s default behavior or naming.
- **Attributes**:
  - `name`: Specifies the name of the column.
  - `nullable`: Allows or disallows `null` values in the column.
  - `unique`: Ensures values in the column are unique.
  - `length`: Sets the column length for string fields.

Example:
```java
@Column(name = "employee_name", nullable = false, unique = true, length = 50)
private String name;
```

---

#### **6. @Temporal**

- **Purpose**: Specifies the date format for `java.util.Date` or `java.util.Calendar` fields.
- **Usage**: Necessary when using date or time fields, as it indicates whether to store the value as a `DATE`, `TIME`, or `TIMESTAMP`.
- **Attributes**:
  - `TemporalType`: Options are `TemporalType.DATE`, `TemporalType.TIME`, or `TemporalType.TIMESTAMP`.

Example:
```java
@Temporal(TemporalType.DATE)
private Date dateOfBirth;
```

---

#### **7. @Lob**

- **Purpose**: Indicates that the field should be stored as a large object (LOB).
- **Usage**: Commonly used for fields that hold large amounts of data, such as binary data (`BLOB`) or large text (`CLOB`).
- **Details**: Hibernate will store the data in a special format, suitable for large objects.

Example:
```java
@Lob
private byte[] profilePicture;
```

---

#### **8. @Transient**

- **Purpose**: Excludes a field from being persisted in the database.
- **Usage**: Use this for fields that are only relevant in the application's context and should not be stored in the database.
- **Details**: Fields marked with `@Transient` will not have any corresponding column in the database table.

Example:
```java
@Transient
private int calculatedField;
```

---

#### **9. @Enumerated**

- **Purpose**: Maps an enum type to a database column.
- **Usage**: Defines how an enum is stored in the database (`ORDINAL` or `STRING`).
- **Attributes**:
  - `EnumType`: Can be `EnumType.ORDINAL` (stores the enum's ordinal value) or `EnumType.STRING` (stores the enum’s name).

Example:
```java
@Enumerated(EnumType.STRING)
private EmployeeStatus status;
```

---

#### **10. @OneToOne**

- **Purpose**: Establishes a one-to-one relationship between two entities.
- **Usage**: Used with a field that references another entity.
- **Attributes**:
  - `cascade`: Defines the cascade types (`PERSIST`, `MERGE`, etc.).
  - `fetch`: Defines fetch type (`EAGER` or `LAZY`).
  - `mappedBy`: Used in bidirectional relationships to avoid redundancy.

Example:
```java
@OneToOne(cascade = CascadeType.ALL)
@JoinColumn(name = "address_id", referencedColumnName = "id")
private Address address;
```

---

#### **11. @OneToMany**

- **Purpose**: Establishes a one-to-many relationship between two entities.
- **Usage**: Typically used with a `Collection` to represent multiple child entities.
- **Attributes**:
  - `mappedBy`: Used in bidirectional relationships to avoid redundancy.
  - `cascade`: Defines cascade operations.

Example:
```java
@OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
private List<Address> addresses;
```

---

#### **12. @ManyToOne**

- **Purpose**: Establishes a many-to-one relationship between two entities.
- **Usage**: Used when multiple instances of one entity are associated with a single instance of another entity.
- **Attributes**:
  - `fetch`: Sets the fetch type (`EAGER` or `LAZY`).

Example:
```java
@ManyToOne
@JoinColumn(name = "department_id")
private Department department;
```

---

#### **13. @ManyToMany**

- **Purpose**: Defines a many-to-many relationship between two entities.
- **Usage**: Typically used with `Collection`.
- **Attributes**:
  - `cascade`: Defines cascading options.
  - `mappedBy`: Used in bidirectional relationships to avoid redundancy.

Example:
```java
@ManyToMany(cascade = CascadeType.ALL)
@JoinTable(name = "employee_project", 
           joinColumns = @JoinColumn(name = "employee_id"), 
           inverseJoinColumns = @JoinColumn(name = "project_id"))
private Set<Project> projects;
```

---

#### **14. @JoinColumn**

- **Purpose**: Specifies the foreign key column in a relationship.
- **Usage**: Used with `@OneToOne`, `@ManyToOne`, and other relationship annotations.
- **Attributes**:
  - `name`: The name of the foreign key column.
  - `referencedColumnName`: The primary key column of the referenced entity.

Example:
```java
@ManyToOne
@JoinColumn(name = "department_id", referencedColumnName = "id")
private Department department;
```

---

#### **15. @JoinTable**

- **Purpose**: Defines the join table for a many-to-many relationship.
- **Usage**: Specifies the name of the join table, along with the join columns.
- **Attributes**:
  - `name`: Specifies the join table name.
  - `joinColumns`: Defines the foreign key column in the join table that points to the current entity.
  - `inverseJoinColumns`: Defines the foreign key column in the join table that points to the related entity.

Example:
```java
@ManyToMany
@JoinTable(name = "employee_project",
           joinColumns = @JoinColumn(name = "employee_id"),
           inverseJoinColumns = @JoinColumn(name = "project_id"))
private Set<Project> projects;
```

---

#### **16. @MapKey**

- **Purpose**: Used for mapping a `Map` collection with an entity.
- **Usage**: Defines the key for the map collection.
- **Details**: Often used with `@ElementCollection` or `@OneToMany`.

Example:
```java
@OneToMany
@MapKey(name = "id")
private Map<Integer, Address> addresses;
```

---

#### **17. @PrimaryKeyJoinColumn**

- **Purpose**: Used in inheritance mapping strategies to specify the column that will be used for joining a subclass table with the superclass table.
- **Usage**: Necessary for certain inheritance mappings, like `@Inheritance(strategy = InheritanceType.JOINED)`.

Example:
```java
@Entity
@PrimaryKeyJoinColumn(name = "person_id")
public class Employee extends Person {
    // additional fields
}
```

---

#### **18. @Embedded and @Embeddable**

In Hibernate, `@Embedded` and `@Embeddable` annotations are used to map complex, reusable components or value objects within an entity. These annotations allow you to group multiple fields into a single embeddable object and include that object as part of a larger entity. They promote code reusability and modularization, making your code cleaner and your database structure more maintainable.

#### Understanding `@Embedded` and `@Embeddable` in Detail

- **`@Embeddable`**: Marks a class as an embeddable component, meaning it doesn’t represent its own table but instead maps its fields to the table of the entity in which it’s embedded.
- **`@Embedded`**: Marks a field within an entity to include an `@Embeddable` object, mapping its fields as columns in the entity’s table.

#### 1. **Why Use `@Embedded` and `@Embeddable`?**

These annotations are beneficial when:
   - You want to reuse common data structures across multiple entities.
   - You need to represent multiple columns in an entity that logically belong to a single value object.
   - You want to avoid creating multiple tables in the database for closely related attributes and instead embed them in the entity’s table.

#### 2. **How `@Embedded` and `@Embeddable` Work Together**

To embed fields in an entity using `@Embedded`, you need two main components:
- An **Embeddable class** annotated with `@Embeddable` that defines the fields to be embedded.
- An **Entity class** with an `@Embedded` annotated field, referencing the embeddable class.

#### 3. **Detailed Example of `@Embedded` and `@Embeddable`**

Let’s take an example where we have an entity `Employee` with an embedded address (fields such as street, city, and zip code). The address can be reused in other entities if needed.

##### Step 1: Define the Embeddable Class
In this case, the `Address` class represents an embeddable component, containing the address fields we want to embed in the `Employee` entity.

```java
import jakarta.persistence.Embeddable;

@Embeddable
public class Address {
    private String street;
    private String city;
    private String zipCode;

    // Getters and Setters
    public String getStreet() { return street; }
    public void setStreet(String street) { this.street = street; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getZipCode() { return zipCode; }
    public void setZipCode(String zipCode) { this.zipCode = zipCode; }
}
```

- **Explanation**:
   - The `Address` class is marked with `@Embeddable`, meaning Hibernate knows it’s not an entity on its own.
   - When used in an entity, each field (`street`, `city`, `zipCode`) will be mapped as a column in the parent entity’s table.

##### Step 2: Define the Entity Class with an Embedded Field
The `Employee` entity will use the `Address` class, embedding it as part of its fields.

```java
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Embedded;

@Entity
public class Employee {
    @Id
    private int id;
    private String name;

    @Embedded
    private Address address;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Address getAddress() { return address; }
    public void setAddress(Address address) { this.address = address; }
}
```

- **Explanation**:
   - The `Employee` class is marked with `@Entity` to map it to a database table.
   - The `address` field in `Employee` is annotated with `@Embedded`, indicating that `Address` fields should be mapped as columns in the `Employee` table.

###### Resulting Table Structure
The `Employee` table will contain columns for each field in both the `Employee` and `Address` classes:
- Columns: `id`, `name`, `street`, `city`, `zipCode`

#### 4. **Customizing Column Names with `@AttributeOverrides` and `@AttributeOverride`**

By default, Hibernate uses the field names from the `@Embeddable` class as column names in the table. However, you can customize these names with `@AttributeOverrides` and `@AttributeOverride`.

For example, if you want to rename the columns for the `Address` fields, you can do this:

```java
import jakarta.persistence.AttributeOverrides;
import jakarta.persistence.AttributeOverride;
import jakarta.persistence.Column;

@Entity
public class Employee {
    @Id
    private int id;
    private String name;

    @Embedded
    @AttributeOverrides({
        @AttributeOverride(name = "street", column = @Column(name = "emp_street")),
        @AttributeOverride(name = "city", column = @Column(name = "emp_city")),
        @AttributeOverride(name = "zipCode", column = @Column(name = "emp_zip"))
    })
    private Address address;

    // Getters and Setters
}
```

This would map the `Address` fields as columns in the `Employee` table with names `emp_street`, `emp_city`, and `emp_zip`.

#### 5. **Best Practices with `@Embedded` and `@Embeddable`**

- **Modular Design**: Use `@Embeddable` classes to modularize your entity design, making reusable components for commonly used data structures.
- **Avoid Excessive Embedding**: Don’t embed excessively large or complex structures, as this can lead to large tables with many columns, affecting performance.
- **Use `@AttributeOverrides` Sparingly**: Only override attribute names if necessary for clarity or to avoid naming conflicts.

#### Summary

- **`@Embeddable`** marks a class as an embeddable component, allowing its fields to be mapped as columns in the table of an entity that includes it.
- **`@Embedded`** specifies that a field in an entity should be populated with an `@Embeddable` component’s data, without creating a separate table for that component.
- This approach is highly useful for breaking down complex data models into reusable components while maintaining a single-table structure for the main entity.


This explanation covers the foundational to advanced topics in Hibernate, offering a roadmap for in-depth learning of the framework.