# Challenge: Retrieve Password via SSL/TLS on Port 30001

## Description
The password for the next level can be retrieved by submitting the current level's password to a service running on port **30001** on **localhost**, using SSL/TLS encryption.

## Solution Approach
1. Use the `openssl s_client` tool to establish a secure SSL/TLS connection to `localhost` on port `30001`.
2. Once the connection is established, send the current password.
3. Capture the server's response, which contains the password for the next level.

## Steps
1. Run the following command to connect to the service:
   ```bash
   openssl s_client -connect localhost:30001
2. After the SSL/TLS handshake completes and the connection is established, you can manually type the current password into the terminal and press Enter.

3. The server will respond with the password for the next level.
