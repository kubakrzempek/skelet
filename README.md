Create an application skeleton - files included - with one command.


Example:<br>
 $ > skelet myapp<br>
creates the following skeleton<br>

myapp<br>
├── bin<br>
│    └── skelet<br>
├── lib<br>
│       └── myapp<br>
│    │   └── version.rb<br>
│    └── myapp.rb<br>
├── test<br>
│    └── test_myapp.rb<br>
└── myapp.gemspec<br>

The files within are already filled with some basic information allowing to speed up creation.
For now it assumes using git and minitest.
