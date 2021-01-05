Big Data Project - BOUTRY Guillaume and PAGES Sophie
=================

# Goal

Create a cloud native face authenticator engine able to scale on demand.

# Technologies

* Docker
* Kubernetes
* Golang
* Dlib (C++ Deep learning)
* Knative Serving
* Longhorn
* Angular
* Cassandra
* Github

# Technology choice

* Golang: Consise, fast, easy -> Golang motto
* Kubernetes: Code as infrastucture allowing easier management
* Dlib: Open source deep learning library
* Longhorn: Open source Volume management in kubernetes
* Cassandra: We wanted a database axed on Availability, one of the uses of an authentication engine is door bell, You don't want to get locked outside your home.
* Angular: Open-Source frontend framework that's easy to use and build application with.

# Architecture

![architecture](/images/Cloud-native-authentication.png)

# Problems met during development

We were unable get a knative eventing broker working properly, we had to go with the standard way, Serving.

We were unable to find a working virtual open-source HSM, we have to cancel plans for encryption for now.

# To launch the project

```bash
vagrant up # it will open the port 80, it requires sudo privilege !
### Edit the ansible inventory to setup the registry username and password !
# Set up a K8S Cluster with every services
ansible-playbook -i inventory playbook.yml
```

# Step by Step Enrollement
In the home page, you can either enroll and authenticate yourself.

![web1](/images/web1.PNG)

Click on enroll.

![web2](/images/web2.PNG)

You must write an existing email address.

![web3](/images/web3.PNG)

Once you have selected your file, you can write a rectangle around the face.

![web4](/images/web4.PNG)

You can then click on Upload!

![web5](/images/web5.PNG)


# Authentication

If you are enrolled, you can try to authenticate yourself.

![web6](/images/web6.PNG)

Well done!

![web7](/images/web7.PNG)

If you use another picture you can see that it doesn't work.

![web8](/images/web8.PNG)

# From inside cluster

If everything is set up properly you should be able to connect to (http://front-end.default.127.0.0.1.nip.io/)

![web9](/images/from-kluster.png)



Link to all projects:

* [GO -C++ Wrapper](https://github.com/Guillaume-Boutry/face-authenticator-wrapper)
* [Angular Front-end](https://github.com/Nightglowie/ECE-big-data-front-end)
* [Grpc-Backend](https://github.com/Guillaume-Boutry/grpc-backend)
* [Enroller](https://github.com/Guillaume-Boutry/enroller)
* [Authenticator](https://github.com/Guillaume-Boutry/authenticator)
* [Data-Controller](https://github.com/Guillaume-Boutry/data-controller)


If all worked well you can access the following url:
(http://front-end.default.127.0.0.1.nip.io/)
