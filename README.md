# Comixology New Release Extractor
## A Ruby app providing command-line access to Comixology's new release page
***
### Usage

Simply execute bin/run
```
ruby bin/run
```

You will be prompted with a command line interface, as below:
```
1.) List new releases
2.) Get more info about a release
3.) Exit this program
Please enter a number:  
```

Option 1 will list all new comics with their title and price from the main Comixology New Release page
Option 2 will allow the user to explore more in-depth information for a particular issue
Option 3 will exit the program

### ToDo

+ Better output formatting or pagination
+ Ability to display issues by release date
+ Ability to extract from other new release pages - e.g. https://www.comixology.com/new-comics?RecentList0_pg=2&cu=0

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Atmajr/comixology-new-releases-cli-app

### License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT)
