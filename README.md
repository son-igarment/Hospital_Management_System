# Hospital Management System

## Overview
This Hospital Management System is a comprehensive solution developed by Phạm Lê Ngọc Sơn for managing patient information, medical staff, departments, and treatments in a hospital environment. The system provides functionality to track both inpatients and outpatients, manage medical examinations, treatments, medications, and handle billing.

## Features
- Patient management (inpatients and outpatients)
- Doctor and nurse information management
- Department organization
- Medical examination tracking
- Treatment and medication management
- Billing and payment processing
- Provider and medication inventory tracking

## Project Structure

```
├── app/                         # Application code
│   ├── assets/                  # CSS, JavaScript, and images
│   ├── controllers/             # Application controllers
│   ├── models/                  # Data models
│   ├── views/                   # Frontend templates
│   ├── helpers/                 # View helpers
│   ├── mailers/                 # Email functionality
│   └── javascript/              # JavaScript modules
├── bin/                         # Binary executables
├── config/                      # Configuration files
├── db/                          # Database files and migrations
├── lib/                         # Library modules
├── log/                         # Log files
├── public/                      # Publicly accessible files
├── storage/                     # Active Storage files
├── test/                        # Test files
├── tmp/                         # Temporary files
├── vendor/                      # Third-party code
├── Dockerfile                   # Docker container configuration
├── docker-compose.yml           # Docker Compose configuration
├── entrypoint.sh                # Docker entrypoint script
├── Gemfile                      # Ruby dependencies
├── Gemfile.lock                 # Locked Ruby dependencies
└── Rakefile                     # Rake task definitions
```

## Key Components

### Controllers
- `application_controller.rb` - Base controller
- `in_patients_controller.rb` - Manages inpatient information
- `out_patients_controller.rb` - Manages outpatient information
- `search_patients_controller.rb` - Handles patient search functionality
- `get_payment_controller.rb` - Manages payment processing
- `get_doctor_patients_controller.rb` - Retrieves patients for a specific doctor
- `static_pages_controller.rb` - Serves static pages

### Models
The system implements a comprehensive data model including:
- Patients (inpatients and outpatients)
- Medical staff (doctors and nurses)
- Departments
- Examinations and treatments
- Medications and providers

### Patient Identification System
- Outpatients: Unique code starting with "OP" followed by 9 digits (e.g., "OP000000001")
- Inpatients: Unique code starting with "IP" followed by 9 digits (e.g., "IP000000001")

## Installation and Setup

### Prerequisites
- Ruby (version specified in `.ruby-version`)
- Rails
- PostgreSQL
- Docker and Docker Compose (optional)

### Standard Installation
1. Clone the repository
2. Install dependencies:
   ```
   bundle install
   ```
3. Set up the database:
   ```
   rails db:create
   rails db:migrate
   rails db:seed
   ```
4. Start the server:
   ```
   rails server
   ```

### Docker Installation
1. Build and start the containers:
   ```
   docker-compose up --build
   ```
2. Set up the database:
   ```
   docker-compose exec web rails db:create
   docker-compose exec web rails db:migrate
   docker-compose exec web rails db:seed
   ```

## Usage
1. Access the application through your web browser at `http://localhost:3000`
2. Use the search functionality to find patient records
3. Register new inpatients or outpatients using the respective forms
4. View and manage doctor-patient relationships
5. Process payments and generate reports

## About the Project
This Hospital Management System was developed by Phạm Lê Ngọc Sơn to address the comprehensive needs of a hospital for managing their patient and staff information, medical treatments, and operational workflows.

## License
Copyright © 2023 Phạm Lê Ngọc Sơn. All rights reserved.
