---
![logo](logo.png)
![BuildStatus](http://tc.quali.com/app/rest/builds/aggregated/strob:(buildType:(id:Colony_Samples_ValidateSamples))/statusIcon.svg)

# CloudShell Colony Samples

Sample Blueprints and Applications demonstrating CloudShell Colony's various features and providing a reference for several sample architectures.

## Colony Blueprints Features

* Easy mapping between application requirements and infrastructure 
* Cloud agnostic 
* Saves most of the boilerplate associated with creating cloud environments 
* Infrastructure as code based design
* Clean separation between configuration code and infrastructure specification

## Using the samples

The sample blueprints are already available in you Colony account.
To make changes, we recommend [forking this repository](https://github.com/cloudshell-colony/samples/fork) and adding it as your space BluePrint Repository.

## Samples Blueprints

The following Blueprints are included in this repository:
* <img src="/images/spring.png" width="25"> Java Spring: A two tier application stack which contains a Java Spring website running on [Apache Tomcat](http://tomcat.apache.org/) and a [MySql](https://www.mysql.com/) database, deployed on separate instances.  
* <img src="/images/node.png" width="25"> NodeJS Microservices: An architecture comprised of multiple microservices running on [NodeJS](https://nodejs.org/) and [Express](https://expressjs.com/). This application stack simulates an online orders application, which is also decribed in [this](https://medium.com/quali-techblog/my-journey-into-microservices-with-kubernetes-b4c59f9adb83) blog post. 
* <img src="/images/rails.png" width="25"> Rails (All-In-1-Server): This Blueprint represents a testing use case, where a [Ruby on Rails](https://rubyonrails.org/) application stack is launched on a single instance to save on costs. Note that this Blueprint utilizes the same applications as the other Rails examples but simply runs them in a different configuration (db and website on a single server). As a part of configuring the application on startup, the database is also migrated to the latest schema.
* <img src="/images/rails.png" width="25"> Rails (Basic-2-Node): The same [ROR](https://rubyonrails.org/) is in this blueprint deployed to a more production like two-node environment. The database and Rails server are launched in separate instances. This environment is used by integration tests which need to simulate the performance and connectivity contstraints of separating the application to more than one instance. As a part of configuring the application on startup, the database is also migrated to the latest schema.
* <img src="/images/rails.png" width="25"> Rails (Production-Like): In this Blueprint we launch the [ROR](https://rubyonrails.org/) architecture on a more scaled up environment with two server instances and a separate instance for the database. As a part of configuring the application on startup, the database is also migrated to the latest schema.
* <img src="/images/wordpress-logo.png" width="25"> Wordpress (LAMP): A Wordpress website LAMP stack (Linux, Apache, MySQL, PHP). This example sets up and configures a Wordpress server with some default content.  

## Troubleshooting and Help

For questions, bug reports or feature requests, please submit your feedback through the CloudShell Colony help widget.
More information about Blueprint development principles, examples and best practices can be found in the [CloudShell Colony Help Center website](http://colonysupport.quali.com)


## Contributing


All your contributions are welcomed and encouraged.  We've compiled detailed information about:

* [Contributing](.github/contributing.md)
* [Creating Pull Requests](.github/pull_request_template.md)

Please make sure to Lint your YAML and Bash scripts as the Pull Request would otherwise not pass initial validation. 

## License
[Apache License 2.0](https://github.com/QualiSystems/shellfoundry/blob/master/LICENSE)
