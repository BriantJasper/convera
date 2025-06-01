# Convera

A modern social media web application inspired by Reddit, built with Laravel and modern web technologies.

## Tech Stack

### Backend

-   **Framework**: Laravel 10.x
-   **Authentication**: Laravel Breeze, Google OAuth
-   **Database**: MySQL
-   **File Storage**: Laravel Storage (Local/Public)

### Frontend

-   **CSS Frameworks**:
    -   Bootstrap (Components)
    -   Tailwind CSS (Utility classes)
    -   Custom Neumorphic Design
-   **Icons**: Font Awesome 6.5.1
-   **JavaScript**: Vanilla JS (ES6+)
-   **Templating**: Laravel Blade

## Core Features

### Authentication & User Management

-   Email/Password authentication
-   Google OAuth integration
-   User profiles with customizable avatars
-   Account settings management
-   Account deletion functionality

### Social Features

-   **Posts**

    -   Create, read, update, delete posts
    -   Rich text content
    -   Image uploads (WIP)
    -   Like/Unlike functionality
    -   Save/Unsave posts
    -   Comments and replies
    -   Post sharing

-   **Communities**

    -   Create and join communities
    -   Community-specific posts 
    -   Community roles (owner, moderator, member)
    -   Community privacy settings (WIP)
    -   Community tags and categories

-   **User Interactions**
    -   Follow/Unfollow users
    -   Like/Unlike posts and comments
    -   Save posts for later
    -   Direct messaging (WIP)
    -   Notifications system (WIP)

### Content Organization (WIP)

-   **Tags** (WIP)

    -   Categorize posts with tags
    -   Tag-based content discovery
    -   Trending tags

-   **Search** (WIP)
    -   Search posts, users, and communities
    -   Tag-based filtering
    -   Advanced search filters

### User Experience

-   Responsive design
-   Dark mode interface
-   Neumorphic UI elements
-   Real-time notifications
-   Interactive UI components
-   Toast notifications
-   Modal dialogs

### Security Features

-   CSRF protection
-   Session management
-   Secure file uploads
-   Input validation
-   XSS prevention
-   Account privacy settings

## Project Structure

```
convera/
├── app/
│   ├── Http/
│   │   ├── Controllers/
│   │   ├── Requests/
│   │   └── Middleware/
│   ├── Models/
│   └── Services/
├── resources/
│   ├── views/
│   │   ├── components/
│   │   ├── partials/
│   │   └── layouts/
│   ├── css/
│   └── js/
├── public/
│   ├── css/
│   ├── js/
│   └── images/
└── database/
    └── migrations/
```

## Features in Progress

-   [ ] Enhanced messaging system
-   [ ] Advanced notification system
-   [ ] Community moderation tools
-   [ ] User blocking functionality
-   [ ] Content reporting system
-   [ ] Analytics dashboard

## Development Setup

1. Clone the repository
2. Install dependencies:
    ```bash
    composer install
    npm install
    ```
3. Set up environment:
    ```bash
    cp .env.example .env
    php artisan key:generate
    ```
4. Configure database and run migrations:
    ```bash
    php artisan migrate
    ```
5. Start development server:
    ```bash
    php artisan serve
    npm run dev
    ```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## Links

1. Concept & Ideas : https://docs.google.com/document/d/1TmN_vcM6--qIuLP8n5XABRv5uMN166fcAyETwVRvZHk/edit?tab=t.0

2. Initial Designing & Mockup : https://www.figma.com/design/OH1agXwYLPEJr9NspSmaKL/Convera?node-id=0-1&t=SXzDHJ5YZQvfQ5vK-0
