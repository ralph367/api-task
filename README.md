# Sales web application

This is a repository for an api mini task where an employee will be able to add a new Agent to their database and then report his Sale Volume each month.
## Disclaimer this is just a simple example for testing and developing not for production use

## Prerequistes 

Tested on:
- Windows 10
- Python 3.8
- npm 

## Installation

Running the followin application requires:
- Clonning the repository
- Installing requirements.txt file
- Installing angular/cli
- Installing angular-devkit/build-angular

In order to install the aforementioned tools run the following commands in your terminal
```sh
pip install -r requirements.txt
npm install @angular/cli
npm install @angular-devkit/build-angular
```

Once done change your directory to the backend folder in this repository and run:
```sh
python manage.py runserver
```

Then in a new terminal change your directory the the frontend folder in this repository and run:
```sh
ng serve
```

## Documentation

### Django

In the following system django is only being used to save the Agents and Reports data, these actions will be triggered using API by the help of Django REST Framework
| Methods | URLs              | Actions                       |
|---------|-------------------|-------------------------------|
| POST    | /api/agents/      | create a new agent            |
| POST    | /api/reports/     | create a new report           |
| GET     | /api/agents/      | get all the available agents  |
| GET     | /api/agents/:id/  | get agent data by id          |
| GET     | /api/reports/     | get all the available reports |
| DELETE  | /api/agents/:id/  | delete the agent by id        |
| DELETE  | /api/reports/:id/ | delete the report by id       |

### Angular

Angular will be responsible to make requests from django in order to render the result in the web page.

#### Services

Created multiple services to get/post data from django and will be called from different components:
- getAgents()
- getAgentDetails(id)
- deleteAgent(id)
- getReports()
- postAgents(data)
- postReports(data)
- deleteReport(id)

#### Components

Here are the available components of the system:
- agents (/agents/)
- agents-create (/addagents/)
- agents-details (/agents/:id/)
- home 
- reports (/reports/)
- reports-create (/addreports/)
