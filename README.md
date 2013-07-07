Create an application skeleton - files included - with one command.


Example:
 >> skelet myapp
creates the following skeleton

myapp
├── bin
│    └── skelet
├── lib
│    └── myapp
│    │   └── version.rb
│    └── myapp.rb
├── test
│    └── test_myapp.rb
└── myapp.gemspec

The files within are already filled with some basic information allowing to speed up creation.
For now it assumes using git and minitest.