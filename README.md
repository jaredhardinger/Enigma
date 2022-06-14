### About

* This application loosely models the Caesar Cipher which basically translates a character by shifting it a certain number of places down the alphabet. Every 4 spaces is shifted by a different amount. This application can encrypt, decrypt, and crack messages.

### Built With

* ruby 2.7.2, rspec 3.11

### Getting Started

* Fork and clone the repository. From the application's root encrypt, decrypt, and crack can be run as follows:
```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
Created 'decrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 240818
$ ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
Created 'cracked.txt' with the cracked key 82648 and date 240818
```

### Testing

* Tests are run using RSpec and each class has its own _spec file. SimpleCov calculates 100% coverage.

### Challenges & Wins

* The most difficult component was returning the key for the cracked message. The process of going from the final shift to the key is seemingly quite involved and requires much iterating on the computer's part. In the end, I got it to work, though!

### Author(s)

* Jared Hardinger

### Self Assessment

* Functionality : 4 - Cracking method and command line interface successfully implemented

* OOP : 3.5 - a module is implemented, but given more time further abstraction could have been achieved.

* Ruby Conventions & Mechanics : 3.5 - if only judging through iteration 3, everything looks great. When looking at the cracker class for iteration 4, there is a method that is zero percent refactored and way too many lines long. I shot for functionality first, and planned on refactoring as time allowed (it did not allow).

* TDD : 3 - mocks and stubs were not used, and the final test in the Enigma class, which tests the ability to crack, gets hung up. This likely would have been a great spot for mocks and stubs. SimpleCov reports 100% coverage (with the above test commented out).

* Version Control : 4 - more than 40 commits and 4 PRs.
