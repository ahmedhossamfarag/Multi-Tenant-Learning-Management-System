# Multi-Tanent Learning Management System

A full-featured LMS where instructors create courses and students enroll, supporting schema-based multi-tenancy,
Stripe Payments, Real-Time Chat, and background job processing.

The project is built on top of Ruby on Rails and PostgreSQL.

## Features

- Schema-based multi-tenancy
- Stripe Payments
- Real-Time Chat between students
- Background job processing for image processing using Sidekiq

## Roles

### Admin
- Can add activities (title, description, event_day, image)

### Instructor
- Can add courses (title, description, instructor)
- Can add course contents (course, title, description)
- Can add enrollments (course, student)

### Student
- Can view courses
- Can view course contents
- Can view activities
- Can enroll in courses
- Can pay for courses
- Can chat with other students