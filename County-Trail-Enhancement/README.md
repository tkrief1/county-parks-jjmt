# County-Trail-Enhancement

A web-based application for Baltimore County park patrons and staff to report, track, and manage trail conditions, maintenance issues, and environmental observations.

Built using Flask, MySQL, and Docker Compose for simple deployment and development.

---

## 📦 Setup

Clone the repository:

```bash
git clone https://github.com/tkrief1/county-parks-jjmt.git
cd County-Trail-Enhancement
```

Run the containers:

```bash
docker compose up -d --build
```

The app will be available at: [http://localhost:5001/](http://localhost:5001/)

---

## 🗃 Notes

- Default MySQL username: `parks_auth`  
- Default password: `oregon-ridge`  
- Default database: `county_parks`  
- Ports:
  - `5001` for the Flask web app
  - `3307` exposed for MySQL (internal MySQL runs on 3306)

---

## ⚠ Requirements

Make sure Docker is installed:

- [Install Docker](https://docs.docker.com/get-docker/)
- If on Linux:  
  Install Docker Compose:
  ```bash
  sudo apt install docker-compose
  ```

---

## ✅ Project Structure

```

County-Trail-Enhancement/
├── app.py
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── README.md                      
│
├── uploads/                       
│   └── <image files>              
│
├── static/                        
│   └── style.css                  
│
└── templates/                     
    ├── home.html                  
    ├── admin.html                 
    └── staff_dashboard.html       

```

---

## 🧪 Common Commands

| Task | Command |
|------|---------|
| Rebuild containers | `docker-compose up -d --build` |
| Stop containers | `docker-compose down` |
| View running containers | `docker-compose ps` |
| Access MySQL | `docker exec -it parks-db mysql -u parks_auth -p` |
