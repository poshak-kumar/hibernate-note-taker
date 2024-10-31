In Hibernate, the two main methods to retrieve a `Session` from a `SessionFactory` are `getCurrentSession()` and `openSession()`. Each method handles the session differently, and choosing between them depends on how you want to manage the lifecycle of the session and transactions.

Let's break down each method, their use cases, and how to implement them.

### 1. `getCurrentSession()`

#### What is `getCurrentSession()`?
- **Thread-bound session**: The session returned by `getCurrentSession()` is *bound to the current thread*. This means the same session is used throughout the thread's execution until the session is closed or the transaction ends.
- **Automatic session management**: When you use `getCurrentSession()`, you don’t need to explicitly close the session. The session is automatically flushed and closed at the end of the transaction. This is convenient for applications that use transactions frequently (e.g., web applications).
- **Session lifespan**: A session obtained via `getCurrentSession()` is only active within a transaction. If no transaction is active, an exception will be thrown when attempting to use the session.
- **Requires configuration**: You must configure Hibernate to know how to bind the session to the current thread (using the `hibernate.current_session_context_class` setting).

#### How to Use `getCurrentSession()`:

1. **Configure Thread-bound Session Context**:
   In your `hibernate.cfg.xml` file, you need to configure Hibernate to use a specific session context, usually `thread`, which binds the session to the current thread.

   Add this property to your `hibernate.cfg.xml`:
   ```xml
   <property name="hibernate.current_session_context_class">thread</property>
   ```

   Example `hibernate.cfg.xml`:
   ```xml
   <!DOCTYPE hibernate-configuration PUBLIC
       "-//Hibernate/Hibernate Configuration DTD 3.0//EN"
       "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
   <hibernate-configuration>
       <session-factory>
           <property name="connection.driver_class">com.mysql.cj.jdbc.Driver</property>
           <property name="connection.url">jdbc:mysql://localhost:3306/myhiber</property>
           <property name="connection.username">root</property>
           <property name="connection.password">mayank</property>
           <property name="dialect">org.hibernate.dialect.MySQLDialect</property>
           <property name="hbm2ddl.auto">update</property>
           <property name="show_sql">true</property>

           <!-- Configuration for thread-bound session context -->
           <property name="hibernate.current_session_context_class">thread</property>

           <mapping class="com.hiber.Student"/>
       </session-factory>
   </hibernate-configuration>
   ```

2. **Code Example with `getCurrentSession()`**:
   ```java
   SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

   // Get the current session (thread-bound session)
   Session session = sessionFactory.getCurrentSession();

   // Begin transaction
   session.beginTransaction();

   // Create and save an entity
   Student st1 = new Student();
   st1.setId(12);
   st1.setName("Raj");
   st1.setCity("Delhi");

   session.save(st1);

   // Commit the transaction, the session will be closed automatically
   session.getTransaction().commit();
   ```

#### Key Points:
- **Automatic session closure**: The session is automatically closed at the end of the transaction.
- **Bound to the current thread**: Suitable for web applications where each request is handled by a thread.
- **Requires a transaction**: Always used with transactions. Calling methods outside a transaction will throw an exception.

### 2. `openSession()`

#### What is `openSession()`?
- **New session each time**: `openSession()` opens a new session every time it is called. The session is not bound to the current thread and does not require any special configuration. You manually control the session lifecycle.
- **Manual session management**: You must explicitly close the session after use by calling `session.close()`. Otherwise, it will remain open, potentially leading to memory leaks.
- **Multiple sessions per thread**: You can use multiple sessions within the same thread, as they are not automatically bound to the thread.
- **More flexibility**: It’s flexible and can be used in both transactional and non-transactional contexts.

#### How to Use `openSession()`:

1. **No special configuration needed**:
   Unlike `getCurrentSession()`, `openSession()` does not require thread-bound session context configuration. You can use it directly in your code.

2. **Code Example with `openSession()`**:
   ```java
   SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

   // Open a new session (manually controlled)
   Session session = sessionFactory.openSession();

   // Begin transaction
   session.beginTransaction();

   // Create and save an entity
   Student st1 = new Student();
   st1.setId(12);
   st1.setName("Raj");
   st1.setCity("Delhi");

   session.save(st1);

   // Commit the transaction
   session.getTransaction().commit();

   // Close the session manually
   session.close();
   ```

#### Key Points:
- **Manual session closure**: You must close the session manually after the transaction is completed.
- **Independent of the thread**: Each `openSession()` call opens a new session, independent of the current thread.
- **Suitable for short-lived sessions**: Commonly used when you need to open and close sessions manually, or in applications that don't require automatic session management.

### Differences between `getCurrentSession()` and `openSession()`:

| Aspect                         | `getCurrentSession()`                                  | `openSession()`                                 |
|---------------------------------|-------------------------------------------------------|-------------------------------------------------|
| **Session lifecycle**           | Managed by Hibernate, automatically closed after a transaction. | Manually managed, must be explicitly closed.    |
| **Thread binding**              | Bound to the current thread.                          | Not bound to any thread.                       |
| **Session scope**               | Only valid within a transaction.                      | Can exist outside of a transaction.            |
| **Configuration required**      | Requires configuration for thread binding (`hibernate.current_session_context_class`). | No additional configuration needed.            |
| **Use case**                    | Suitable for applications with transaction management (e.g., web apps). | Suitable for flexible, manual session management. |
| **Multiple sessions per thread**| No (one session per thread).                          | Yes (multiple sessions can be opened).         |

### When to Use Which?

- **Use `getCurrentSession()`**:
  - When you want Hibernate to manage the session lifecycle automatically.
  - In environments where a session should be bound to the current thread (like in a web application where each request is handled by a separate thread).
  - If you always work within transactions and want automatic session closure.

- **Use `openSession()`**:
  - When you need full control over the session lifecycle and don't mind closing the session manually.
  - When your application may not always use transactions or requires multiple sessions per thread.
  - In scenarios where explicit control over session management is preferred, such as batch processing or standalone applications.

### Conclusion:
- **`getCurrentSession()`** is more convenient when you have a transactional environment and prefer automatic session management.
- **`openSession()`** gives you more control over the session lifecycle and is suitable when you don't want session binding to the thread.
