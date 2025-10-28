# Content Management System

A lightweight, Java-based Content Management System designed to help small companies and organizations manage their websites with minimal technical overhead. RedCMS provides an easy and cost-effective solution for content management, allowing businesses to manage and distribute their content without investing in a full-time development team.

## 🚀 Features

- **User-friendly Interface**: Clean and intuitive admin panel for content management
- **Multi-channel Content**: Support for different content types and channels
- **File Management**: Built-in file upload and attachment system
- **Template System**: Customizable templates for both admin and web interfaces
- **Database Integration**: MySQL database support with connection pooling
- **Modular Architecture**: Well-structured MVC pattern with service and DAO layers

## 🛠️ Technology Stack

- **Backend**: Java (Servlets, JSP)
- **Database**: MySQL
- **Connection Pooling**: C3P0
- **Frontend**: HTML, CSS, JavaScript, JSP
- **Build Tool**: Maven/Ant (based on project structure)
- **Server**: Java Web Application (WAR deployment)

## 📁 Project Structure

```
CMS/
├── src/
│   ├── com/redcms/
│   │   ├── beans/          # Data models
│   │   ├── dao/            # Data Access Objects
│   │   ├── service/        # Business logic layer
│   │   ├── servlet/        # Controllers
│   │   ├── filter/         # Request filters
│   │   └── util/           # Utility classes
│   └── *.properties        # Configuration files
├── WebContent/
│   ├── WEB-INF/
│   │   ├── templates/      # JSP templates
│   │   │   ├── admin/      # Admin interface templates
│   │   │   └── web/        # Public website templates
│   │   └── lib/            # JAR dependencies
│   └── res/                # Static resources
└── test/                   # Test files
```

## 🏗️ Architecture Overview

### MVC Pattern Implementation
RedCMS follows the Model-View-Controller (MVC) design pattern:

- **Model**: Encapsulates application data and business logic
- **View**: Renders model data and generates HTML output for the browser
- **Controller**: Processes user requests and coordinates between Model and View

![MVC Architecture](https://github.com/xuan13hao/CMS/blob/master/mvc.PNG)

### Service Layer
The service layer acts as an entry point to the application domain and contains business logic. This design allows the same business logic to be reused across different client types (web, mobile, API).

### Data Access Layer (DAOs)
Data Access Objects abstract away the data storage mechanism, providing a clean interface for database operations:

- `ModelDao` - Content model management
- `ContentDao` - Content operations
- `ChannelDao` - Channel management
- `ManagerDao` - User management
- `FilesDao` - File operations

<!-- ![DAO Architecture](https://github.com/xuan13hao/CMS/blob/master/Capture.PNG) -->

## ⚙️ Configuration

The system uses several configuration files:

- `jdbc.properties` - Database connection settings
- `dao.properties` - DAO implementation mappings
- `service.properties` - Service layer configuration
- `c3p0.properties` - Connection pool settings
- `log4j.properties` - Logging configuration

## 🚀 Getting Started

1. **Prerequisites**:
   - Java 8 or higher
   - MySQL 5.7 or higher
   - Apache Tomcat or similar servlet container

2. **Database Setup**:
   - Create a MySQL database named `redcms1`
   - Import the provided SQL files from `WebContent/`

3. **Configuration**:
   - Update `jdbc.properties` with your database credentials
   - Configure other properties files as needed

4. **Deployment**:
   - Build the project into a WAR file
   - Deploy to your servlet container
   - Access the admin panel through your web browser

## 📝 License

This project is licensed under the terms specified in the LICENSE file.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature requests.

## 📞 Support

For support and questions, please contact the development team or create an issue in the repository.
