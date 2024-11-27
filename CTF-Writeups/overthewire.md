# Over The Wire CTF

Over The Wire CTF is designed for beginners. It's especially helpful for those just starting their cybersecurity journey. This type of CTF builds confidence, enhances cybersecurity knowledge, and introduces new concepts along the way. 

If you're interested in playing the CTF, please visit - https://overthewire.org/wargames/

There are several sections or topics to start with, and we'll explore them one by one.

![image](https://github.com/sojib-bd/my-cybersecurity-journey/blob/main/CTF-Writeups/Screenshot_2024-11-27_12_59_00.png)

Today we will explore the Bandit section. Before starting the games, please read the rules and information, which include basic guidelines and donation details. 

The entire game uses SSH (Secure Shell) protocol, which allows you to connect remotely to a server or host computer. If you'd like to learn more about SSH, feel free to search online.

Every level consist of 4 sections: 

1. Title
2. Level Goal or purpose of the Level
3. Command to solve the Level
4. Helpful Reading Material Links

### Level 0:

**Goal** :  The goal of this level is for you to log into the game using SSH. The host to which you need to connect is **bandit.labs.overthewire.org**, on port 2220. The username is **bandit0** and the password is **bandit0**. Once logged in, go to the [Level 1](https://overthewire.org/wargames/bandit/bandit1.html) page to find out how to beat Level 1.

**instruction** for solving this level is pretty strait forward. Just login through SSH using the username and password and get the password for next level. Pretty easy. 

The command for connecting with SSH with username: 

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

If this prompt the password , then provide the password mentioned in the goal section - bandit0

If you successfully login , then write a simple command to search for files

```bash
ls 
```

you will find a text file name “readme”. Finally read the file by another simple command

```bash
cat readme 
```

you will see something like this -

```bash
Congratulations on your first steps into the bandit game!!
Please make sure you have read the rules at https://overthewire.org/rules/
If you are following a course, workshop, walkthrough or other educational activity,
please inform the instructor about the rules as well and encourage them to
contribute to the OverTheWire community so we can keep these games free!

The password you are looking for is: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

```

Note down the password and use it to enter the next Level.
