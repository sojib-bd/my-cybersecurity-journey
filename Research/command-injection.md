# Command Injection

Command injection is a security flaw where an attacker exploits an application by using unsanitized user input to execute unauthorized commands on the operating system. These commands execute with the same privileges as the application, potentially compromising the host server.

Simply put, command injection allows attackers to run arbitrary operating system commands on the server where the application is running.

This vulnerability can occur for several reasons:

1. Improper validation of user input
2. Insufficient protection against command injection attacks
3. Poorly written code that enables command execution on the server

## How to Exploit the Command Injection

Testing can be done from two perspectives: white box and black box. In white box testing, we have access to the program code to understand and find bypass techniques. In black box testing, we work without access to the source code and must test all possible vulnerabilities.

Steps for testing both black box and white box approaches:

- Map the application—visit every entry point where users can input data. During this process, use Burp to capture all requests for later analysis.
- Identify input fields vulnerable to injection by testing shell command operators like '&', '&&', '|', '||', and '$()'.
