### Understanding Injection Vulnerabilities

Injection is consistently ranked among the top vulnerabilities in web applications, according to the OWASP Top 10. Injection vulnerabilities occur when an attacker manipulates an application’s input (or request) to execute harmful commands or queries, potentially leading to unauthorized data access, data manipulation, or system compromise. If an application fails to properly handle or sanitize user input, it becomes susceptible to injection attacks. Common types of injection attacks include SQL/NoSQL injection, Cross-Site Scripting (XSS), command injection, and Object-Relational Mapping (ORM) injection.

## Key Points of Vulnerability

An application is vulnerable to injection attacks when:
1. User-supplied data is not validated, sanitized, or filtered by the application.
2. Dynamic queries or non-parameterized calls without context-aware escaping are used directly in the interpreter.
3. Hostile data is used in the ORM search parameters to extract additional sensitive data.
4. Hostile data is directly used or concatenated in dynamic queries, commands, or stored procedures.

## Mitigation and Prevention

To prevent injection attacks, it is crucial to keep data separate from commands and queries. Here are some key strategies:

* **Use a Safe API**: Avoid using the interpreter entirely by providing a parameterized interface or migrating to Object-Relational Mapping Tools (ORMs). Note that even parameterized stored procedures can introduce SQL injection if they concatenate queries and data or execute hostile data with `EXECUTE IMMEDIATE` or `exec()`.

* **Positive Server-Side Input Validation**: Implement server-side input validation using a whitelist approach (allowing only known safe input patterns). While this is a crucial layer of defense, it may not catch all malicious input, especially in cases where special characters are required (e.g., for rich-text areas or mobile app APIs)
* **Escape Special Characters**: For residual dynamic queries, escape special characters like quotes, semicolons, and others using the specific escape syntax for that interpreter. Be mindful that SQL structures such as table names and column names cannot be escaped, making user-supplied values for these elements particularly dangerous..

* **Use SQL Controls**: Use SQL controls such as LIMIT, OFFSET, or WHERE clauses to restrict the amount of data returned in case of SQL injection. This helps prevent attackers from extracting large volumes of data when an injection attack is successful.

## Example Attack Surfaces

1. **Authentication Forms**: Many web applications use forms to authenticate users by accepting usernames and passwords. A vulnerable query might look like:
 
 ```sql
   SELECT * FROM users WHERE username = 'userinputname' AND password = 'userinputpassword';
   ```

Without proper input sanitization, an attacker can inject malicious SQL, such as:

   ```sql
   SELECT * FROM users WHERE username = 'admin' --' AND password = 'password';
   ```

The `--` comment syntax makes the rest of the query irrelevant, allowing the attacker to bypass authentication and log in as an admin.

2. **Search Bars**: If user input in a search bar is not properly sanitized, an attacker can inject Cross-Site Scripting (XSS) code, as shown in this example:
  
```html
   <script>alert(document.domain)</script>
   ```

This script can execute on other users' browsers, potentially stealing session data, redirecting users to malicious sites, or performing other harmful actions.

## Impact of Injection Attacks

- **Bypassing Authentication**: Attackers can bypass authentication mechanisms (e.g., by injecting SQL to log in as an admin user).
- **Data Retrieval**: Attackers can retrieve or leak sensitive data from a database or application, leading to data breaches.
- **Data Manipulation**: Malicious actors may alter database records, which can cause fraud, data corruption, or other malicious effects.
- **Denial-of-Service**: Attackers could potentially delete or corrupt data, leading to service outages or loss of access to critical data.

