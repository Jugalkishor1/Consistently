# 📘 Consistently – Habit Tracker App

A full-stack **Rails 7** application to help users build personal habits, track progress, and maintain streaks — all with a clean, responsive UI built using **Tailwind CSS**.

---

## 🚀 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/Jugalkishor1/Consistently.git
cd Consistently
```

### 2. Install Dependencies

```bash
bundle install
```

### 3. Set Up the Database

```bash
rails db:setup
```

> This creates, migrates, and seeds the database in one command.

### 4. Start the Development Server

```bash
bin/dev
```

> Make sure `foreman` is installed: `gem install foreman`

### 5. Open in Browser

Visit: [http://localhost:3000](http://localhost:3000)

---

## 🛠️ Tech Stack

- Ruby on Rails 7
- Tailwind CSS
- Devise – User Authentication
- Hotwire (Turbo/Stimulus) – for live updates

---

## 📌 Features

- User authentication (signup, login, forgot password)
- Create/edit/delete personal habits
- Mark habits as "done" for any day
- Visual calendar for habit tracking (color-coded)
- View current streak, longest streak, and consistency %
- Responsive UI using Tailwind CSS

---

## 🧪 Testing

Basic flow testing:

- Register a user
- Create 1–2 habits
- Try marking them done for different days
- Confirm calendar view and stats update accordingly
