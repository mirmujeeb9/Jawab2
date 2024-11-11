
# Jawab 2

# Project Setup and Running Guide

## Prerequisites

- PHP >= 8.0
- Composer
- Laravel
- Node.js and npm
- Flutter

## Backend Setup

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone https://github.com/your-username/your-repository-name.git
cd your-repository-name
```

### 2. Navigate to the Backend Directory

Open a terminal and navigate to the `backend` folder:

```bash
cd backend
```

### 3. Set Up Environment Variables

Copy the example environment file and create a new `.env` file:

```bash
cp .env.example .env
```

Open the `.env` file in a text editor and update the required fields with your environment-specific values. Ensure that all necessary environment variables (such as database connections, API keys, etc.) are set correctly for your environment.

### 4. Install Backend Dependencies

Install all required backend dependencies using Composer:

```bash
composer install
```

### 5. Run Database Migrations

Run the Laravel database migrations:

```bash
php artisan migrate
```

### 6. Run the Backend Server

- If running on the same machine as the code, use:

```bash
php artisan serve
```

- If running for an Android apk, specify the host IP:

```bash
php artisan serve --host={your_ip} --port=8000
```

Your backend server should now be running and accessible.

## Frontend Setup

### 1. Navigate to the Frontend Directory

In your terminal, move to the `frontend` directory:

```bash
cd frontend
```

### 2. Update Backend URL

- Navigate to `lib/utils/static_data.dart` in the frontend code.
- Update the `mainURL` variable to match the backend IP and port:

```dart
static const mainURL = 'http://{your_ip}:{port}/api/';
```

For Android emulators, the IP is commonly `10.0.2.2`, and the default port is `8000`.

### 3. Install Frontend Dependencies

Install the necessary dependencies using Flutter:

```bash
flutter pub get
```

### 4. Run the Frontend

- To run on an emulator or physical device:

```bash
flutter run
```

- To build an APK for Android:

```bash
flutter build apk --release
```

The APK can be found in the following directory:

```plaintext
build/app/outputs/flutter-apk
```

---

## Troubleshooting

- **Backend not starting:** Ensure you have correctly set up the `.env` file and installed the required PHP dependencies.
- **Frontend not connecting:** Make sure the IP and port in `mainURL` match the running backend server’s IP and port.
- **CORS Issues:** If you run into CORS issues, ensure your backend allows cross-origin requests from the frontend.

---

This guide should help you set up and run both the backend and frontend components of the project. For more detailed information, refer to the documentation for Laravel and Flutter.
