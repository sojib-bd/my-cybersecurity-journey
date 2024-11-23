# Broken Access Control

## Definition
Access control is the process of granting or denying requests to access resources or perform actions. When a user is authorized, they can access certain features or programs. If they are not authorized, they are restricted from accessing these resources.
Example: On Netflix, if you subscribe to a plan, you are authorized to watch movies or TV series online, and possibly download content. However, if you do not have a subscription, you cannot access these features.
________________________________________

## Common Access Control Vulnerabilities:
  
1.	**Violation of the Principles of Least Privilege or Deny by Default**:
Access should be restricted to only the necessary users, but sometimes access is granted indiscriminately to anyone.
2.	**Bypassing Access Control Checks by Modifying the URL**:
This can be done through parameter tampering, forced browsing, or using tools to modify API requests and bypass security controls.
3.	**Permission to View or Edit Someone Else's Account (IDOR)**:
Example: An attacker might modify the unique identifier in the URL to access another user's account.
Example:
	- Original URL: `https://www.example.com/user/12345`
	- Attacker changes it to: `https://www.example.com/user/67890` (another user's data).
5.	**Accessing API with Missing Access Controls for POST, PUT, and DELETE**:
API endpoints that lack proper access control allow unauthorized users to modify, delete, or create data.
6.	Elevation of Privileges:
An attacker could act as a higher-privileged user (e.g., an admin) without the necessary credentials, either by exploiting a flaw in the authentication process or manipulating session data.
7.	**Metadata Manipulation**:
Attackers may tamper with JSON Web Tokens (JWT), cookies, or other hidden fields to bypass access controls or escalate privileges.
8.	**CORS Misconfiguration**:
Cross-Origin Resource Sharing (CORS) misconfigurations can allow unauthorized domains to access APIs, exposing sensitive data.
9.	**Force Browsing to Restricted Pages**:
An attacker may try to access authenticated or privileged pages directly (e.g., /admin) without proper authentication.
________________________________________
## Mitigation or Prevention of Broken Access Control:
1.	**Enforce Least Privilege Access**:
This security principle ensures that users are given the minimum level of access needed to perform their job functions. They should not have unnecessary permissions.
2.	**Deny by Default**:
This model ensures that all access requests are blocked unless explicitly authorized. It reduces the potential attack surface by defaulting to restrictive access.
3.	**Validate Permissions on Every Request**:
Access control decisions should be made for each request, rather than relying on outdated or insecure client-side data. Always check if the user is authorized for the requested resource.
4.	**Use Attribute-Based or Relationship-Based Access Control (ABAC/RBAC)**:
Prefer using attribute-based access control (ABAC) or relationship-based access control (RBAC) over traditional role-based access control (RBAC), as these methods provide more flexibility and granularity in permission management.
5.	**Avoid Exposing Identifiers to the User**:
Avoid exposing user identifiers (such as IDs) in URLs or other user-facing elements, as attackers could easily manipulate them to access unauthorized data.
6.	**Implement User/Session-Specific Indirect References**:
Use indirect references (e.g., random tokens or GUIDs) instead of predictable identifiers, making it harder for attackers to guess or manipulate values.

## Conclusion:
Broken Access Control is a critical vulnerability that can lead to severe consequences if not addressed properly. If access control mechanisms are not correctly implemented, attackers can gain unauthorized access to sensitive data or escalate privileges. To mitigate this risk, developers should adhere to the principles of least privilege, deny access by default, validate permissions on every request, and use secure access control models. Proper implementation of these measures can prevent significant security breaches and protect user data.


