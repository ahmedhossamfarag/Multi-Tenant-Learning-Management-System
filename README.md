# Multi-Tenant Learning Management System

A full-featured Learning Management System (LMS) that supports multiple tenants using schema-based isolation.  
Instructors can create and manage courses, students can enroll and interact in real time, and admins can manage activities.  
The system integrates with Stripe for payments and uses Sidekiq for background job processing.

Built with **Ruby on Rails** and **PostgreSQL**.

---

## 🔧 Key Features

- **Schema-Based Multi-Tenancy**  
  Isolates each tenant's data securely using PostgreSQL schemas.

- **Stripe Integration**  
  Online payments management.

- **Real-Time Chat**  
  Enables communication between students using Action Cable or a WebSocket implementation.

- **Background Processing**  
  Handles tasks like image uploads and processing via **Sidekiq**.

---

## 👥 Roles & Capabilities

### 🛠 Admin
- Manage platform-wide activities:
  - Title
  - Description
  - Event day
  - Image

### 🎓 Instructor
- Create and manage:
  - Courses (title, description)
  - Course content (associated with courses)
  - Enrollments (assign students to courses)

### 👩‍🎓 Student *(implicitly supported)*
- Enroll in available courses
- Participate in real-time chats
- Access course content
- View activities
---

## 📚 Tech Stack

- Ruby on Rails
- PostgreSQL (multi-schema setup)
- Stripe API
- Sidekiq
- Action Cable (for real-time chat)
