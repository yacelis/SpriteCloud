# SpriteCloud QA Assignment

Here you will find the steps to run the automation (Robot Framework)

## Prerequisites

### Python & pip
We are supporting Python 3.x (working with Python 3.9)

You must have the Python Package Installer "pip" to install the libraries

You can upgrade pip itself with:
```python -m pip install -U pip```

### Libraries
- robotframework 4.1.3
- [robotframework-seleniumlibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) 5.1.0
- robotframework-jsonlibrary 0.3.1
- robotframework-requests 0.9.2

To install these libraries, execute:

```pip install -r requirements.txt```

## How to run the tests locally:

Execute the following commands from the command line. For linux/mac: 

- To run the entire suite: ```robot -d Results TestSuite``` 
- To run a single file (UI or API) ```robot -d Results TestSuite/UI_TestCases.robot```
- To run a single test case by the id: ```robot -i id=1 -d Results TestSuite```

## How to run the tests in Jenkins:
- Go to Jenkis and login (you need to have jenkins installed, by default is localhost:8080)
- From the dashboard, select the `SpriteCloud` project
- From the left menu, click on `Build Now`
- Once the build is completed, you will find the results in the `Build History`, the latest one will be at the top, click on it.
- Select `Console Output` to see the Jenkins results.


## Calliope results
You can find the calliope report details in the following link
https://app.calliope.pro/reports/120205?exc=47280571%2C47280572%2C47280573%2C47280574%2C47280576%2C47280577%2C47280578%2C47280579%2C47280569&cor=47280580&coc=47280570%2C47280575


## Possible improvement and feature for calliope
I feel the tool very intuitive, but I would like if in the report page we had a copy button, so we can copy the URL and share the results, and a download option, so save the report, for the improvement, it would be nice if the chart was bigger.


## Approach to select the scenarios
I focused in the main functionalities, makeing sure the basics of both UI and API are working.


## Why are these scenarios the most important?
### UI:
As the UI is only informative (we can't create or delete elements) I focused on the page content, verifying all the info was displayed and also verified the responsiveness, making the screen small and cheching the mobile menu was displayed and functional.

### API:
These are the main calls, like create and verify the user can get the created info as well as delete (even though there are no specific test cases for delete, it is being called in the teardown for each test case)


## What could be the next steps in the project?
After seeing the project and automate some scenarios, I think the next step would be to fix the issues with the APIs like the GET/DELETE are not working properly, and the authorization does not make any difference, from the automation side, we should continue with it, make the existing automation to fail if the calls don't work in the first try and automate more test cases (more endpoints and negative scenarios).