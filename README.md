# Content Manager System (CMS)
A CMS helps create and manage websites and website content using minimal technical overhead, so you can make better content instead of acting as a project or traffic manager. By providing an easy and cost-effective solution for content management, a CMS allows companies to manage and distribute their content without investing in a full-time content development team. We created a small and powerful CMS to help small companies manage their websites.

# Basic Architecture 

## MVC
MVC is a design pattern where V and C are "strictly" form the presentation layer, and M can include everything that is beyond presentation (GUI). The model part in MVC has been an opinion based topic for a long time. But here's how I would structure a typical MVC application.
![sample screenshot](https://github.com/xuan13hao/CMS/blob/master/mvc.PNG)

## Service
Service layer is a generic term that basically acts as an entry point to the application domain and typically includes business logic. For a web application, you could treat the business logic layer as a service layer, or for mobile clients, you could expose a web API and treat is a service layer. In short irrespective of GUI/ Client, you should be able to re-use business logic as-is.

## DAOs 
DAOs are just the objects that abstract away the data storage mechanism.
![sample screenshot](https://github.com/xuan13hao/CMS/blob/master/Capture.PNG)
