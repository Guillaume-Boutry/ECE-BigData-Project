# ECE Big Data Project - PAGES - BOUTRY

Link to all projects:

* [GO -C++ Wrapper](https://github.com/Guillaume-Boutry/face-authenticator-wrapper)
* [Angular Front-end](https://github.com/Nightglowie/ECE-big-data-front-end)
* [Grpc-Backend](https://github.com/Guillaume-Boutry/grpc-backend)
* [Enroller](https://github.com/Guillaume-Boutry/enroller)
* [Authenticator](https://github.com/Guillaume-Boutry/authenticator)
* [Data-Controller](https://github.com/Guillaume-Boutry/data-controller)


# To launch the project

```bash
vagrant up # it will open the port 80, it requires sudo privilege !
### Edit the ansible inventory to setup the registry username and password !
ansible-playbook -i inventory playbook.yml
```

If all worked well you can access the following url:
(http://face-authenticator.default.127.0.0.1.nip.io)

All information on Front-End at (https://github.com/Nightglowie/ECE-big-data-front-end)
