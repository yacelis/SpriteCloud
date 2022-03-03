# SpriteCloud QA Assignment

Here you will find the steps to run the automation (Robot Framework)

## Prerequisites

### Python & pip
Python 3.x is supported (working with Python 3.9)

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
Clone the git repository and execute the following commands from the command line. For linux/mac: 

- To run the entire suite: ```robot -d Results TestSuite``` 
- To run a single file (UI or API) ```robot -d Results TestSuite/UI_TestCases.robot```
- To run a single test case by the id: ```robot -i id=1 -d Results TestSuite```

## How to run the tests in Jenkins:
To run the automation in jenkins you will need to have a project linked to the git repository, let's see the steps below:
- Go to Jenkis and login (you need to have jenkins installed, by default is localhost:8080)
- From the left menu select `New Item`, enter a name, select `Freestyle project` and click `ok`
- Select the `Source Code Management` tab, select the `Git` option and enter the `Repository URL` (you can copy this URL from GitHub)
- Go to `Branches to build` and change it to `main` as this is the project branch.
- Select the `Built` tab and select `Execute shell` (if running on mac) and enter the command `python3 -m robot -d Results TestSuite`
- Go to the `Post-build Actions` tab and select `Publish Robot Framework test results` and enter the directory in this case is `Results`, enter a % for the build to display as passed or failed, click `Apply` and `Save`

### Now we have the project set, to run it we will need to:

- From the dashboard, select the project you created
- From the left menu and click on `Build Now`
- Once the build is completed, you will find the results in the `Build History`, the latest one will be at the top, click on it.
- Select `Console Output` to see the Jenkins results.
- To see the robot framewoek results, you can select the `Robot Results` option from the left menu

## Calliope results
You can find the calliope report details in the following link

https://app.calliope.pro/reports/120345/public/5a60e495-b1c8-4dd8-992f-e763897913d0


## Possible improvement and feature for calliope
I feel the tool very intuitive, but I would like if in the report page we had a download option to save the report, for the improvement, it would be nice if the chart was bigger, and at first, the copy button was not visible for me, it would be nice if it was in the report results page.


## Approach to select the scenarios
I focused in the main functionalities, makeing sure the basics of both UI and API are working.


## Why are these scenarios the most important?
### UI:
As the UI is only informative (we can't create or delete elements) I focused on the page content, verifying all the info was displayed and also verified the responsiveness, making the screen small and checking the mobile menu was displayed and functional.

### API:
 I tried to automate the main calls, like create and verify the user can get the created info as well as delete (even though there are no specific test cases for delete, it is being called in the teardown for each test case)


## What could be the next steps in the project?
After seeing the project and automate some scenarios, I think the next step would be to fix the issues with the APIs like the GET/DELETE are not working properly (the test cases might fail sometimes, as the response is not always the right one), from the automation side, we should continue with it, make the existing automation to fail if the calls don't work in the first try (right now it is trying multiple times until the call success) and automate more test cases (more endpoints and negative scenarios).