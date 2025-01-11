# <p align="center"> FILES SYSTEM 🗄 </p>

<p align="center">
</p>

System to manage civil registry files, made under the MVC design pattern and implemented with PHP, MySQL and dropzone.js

### Previous requirements 👀

Make sure you have the following tools installed: [Git](https://git-scm.com/downloads) and [Docker](https://www.docker.com/products/docker-desktop/) (in this case, it should also be running)

### Installation and Execution 💻

1. *Clone the Repository:*

  ```bash
    $ git clone https://github.com/Rsmj99/file-management-system.git
  ```

2. *Locate yourself in the project directory*

  ```bash
    $ cd file-management-system
  ```

3. *Run all necessary services*

  ```bash
    $ docker-compose up -d
  ```

4. *Once all services are up, you can log in to the system from: <http://localhost>, and you can manage the database from: <http://localhost:8081>*

### Stop and Clean🧹

To stop and delete created containers:

  ```bash
    $ docker-compose down
  ```

If you want to remove the containers and downloaded images, run the following instead of the above:

```bash
  $ docker-compose down --rmi all
```
