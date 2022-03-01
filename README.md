# SpriteCloud
QA Assignment

Here you will find the steps to run the automation (Robot Framework)

### Prerequisites

### Python & pip
We are supporting Python 3.x (working with Python 3.8 as of March 2021)


You must have the Python Package Installer "pip" to install libraries

You can upgrade pip itself with:
```python -m pip install -U pip```

### Libraries
- robotframework 3.2.2
- [robotframework-seleniumlibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) 5.1.0
- robotframework-jsonlibrary 0.3.1
- PyYAML  5.4.1 

To install these libraries, execute:

```pip install -r requirements.txt```

### How to run the suite

Execute the following commands from the command lines. For linux/mac: 

- To run the entire suite: ```robot SpriteCloud``` 

- To run a single suite: ```robot SpriteCloud/UI.robot```

- To run a single test case by its Id: ```robot -i test_case_id=1 SpriteCloud```
