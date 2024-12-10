# Challenge: Retrieve password for the next level

### Description
The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.

### Approach
1. Use `nc` (Netcat) to connect to port 30000 on localhost.
2. Send the current password as input.
3. Capture and store the response.

### Solution
```bash
echo "<current_password>" | nc localhost 30000
