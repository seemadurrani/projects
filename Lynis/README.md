# Lynis

### Auditing, system hardening, compliance testing

Lynis is a battle-tested security tool for systems running Linux, macOS, or Unix-based operating system. It performs an extensive health scan of your systems to support system hardening and compliance testing.

### Project goals

Since Lynis is flexible, it is used for several different purposes. Typical use cases for Lynis include:

* Security auditing
* Compliance testing (e.g. PCI, HIPAA, SOx)
* Penetration testing
* Vulnerability detection
* System hardening

### Audience and use cases

* Developers: Test that Docker image, or improve the hardening of your deployed web application.
* System administrators: Run daily health scans to discover new weaknesses.
* IT auditors: Show colleagues or clients what can be done to improve security.
* Penetration testers: Discover security weaknesses on systems of your clients, that may eventually result in system compromise.

## Installation using git

* Step 1: Clone the following repository as the below command
          
         
          ```
          https://github.com/CISOfy/lynis.git
          ```
* Step 2: Check if Lynis is installed by running the below command
           
           
           ```
           ./Lynis
           ```
* Step 3: To start the scan you must be logged into the system in which the scan has to be done and run the below command.
          
          
            ```
           ./lynis audit system
           ```
