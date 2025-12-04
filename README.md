# 🐳 ROS1 Docker Environment (Noetic Ninjemys)

This project sets up a minimal development environment for **ROS1 Noetic** using Docker and `docker-compose`.

It includes:
- ROS1 Noetic (`ros-noetic-desktop`)
- Common libraries: `Eigen`, `yaml-cpp`, `rviz_visual_tools`
- Pre-configured workspace mount at `/catkin_ws/src`
- Automatic sourcing of the ROS1 environment

---

## 🛠️ Setup

### 1. Build the Docker Image

```bash
docker compose build
```

This will build the container with all dependencies installed.

---

### 2. Start the Container

```bash
docker compose up -d
```

Starts the container in detached mode. The `./src` directory is mounted into `/catkin_ws/src` inside the container.

---

### 3. Enter the Container Shell

Use this command in two separate terminal windows to simulate two ROS1 nodes:

```bash
docker exec -it ros_container bash
```

---

## 🧪 Testing with ROS1 Demo Nodes

With two terminals open inside the container:

### **Terminal 1: Start the Listener (Python)**
```bash
rosrun rospy_tutorials listener
```

### **Terminal 2: Start the Talker (Python)**
```bash
rosrun rospy_tutorials talker
```

You should see the listener receive messages from the talker, verifying that the ROS1 setup works correctly.

---

## 🛑 Stopping the Environment

To stop and remove the running container:

```bash
docker compose down
```

---

## 📁 Project Structure

```
.
├── Dockerfile
├── docker-compose.yml
├── README.md        <-- You're here!
└── src/             <-- Your ROS1 packages live here
```

---

## ✅ Notes

- The ROS1 environment is sourced automatically via `/etc/bash.bashrc`
- The workspace directory `/catkin_ws/src` is mounted from your local `./src` folder
- You can build ROS1 packages inside the container using:

```bash
cd /catkin_ws
catkin_make
source devel/setup.bash
```

---

Happy hacking with ROS1! 🛠️🐢
