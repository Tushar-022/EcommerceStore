# E-Commerce App with Flutter

## Overview

This project is an E-commerce application built with Flutter, providing features for both login/registration and shopping functionalities. It includes a professional app configuration, comprehensive UI/UX design, and backend integration with Firebase. Below are the detailed descriptions of the app configurations, design elements, and backend functionalities.

## App Configurations

### Professional App Configurations
- Create a new Flutter project and set up a professional folder structure to ensure maintainability and scalability.
- Implement both light and dark themes, covering buttons, text fields, app bars, chips, and more.
- Develop helper functions, constants, and utility classes to streamline development and maintain code quality.

### Login / Registration UI/UX
- Design a native splash screen to provide a seamless initial experience.
- Include three onboarding screens to introduce the app's features to new users.
- Create a registration screen with email verification and a success screen upon successful registration.
- Design a login screen, along with "forget password" and "reset password" screens to assist users in account recovery.

### E-Commerce App Design
- Develop a bottom navigation bar to facilitate easy navigation across the app.
- Implement a curved design challenge for an engaging background effect.
- Create a custom app bar and a search widget to allow users to find products easily.
- Incorporate scrolling categories, banners with sliders, and a product design grid layout for an intuitive shopping experience.
- Include tab layout, app bar, search functionality, and featured brands section.
- Design TabBar categories content, wishlist screen, settings screen, profile screen, and product details screens showcasing images, text, attributes, variations, ratings, reviews, and addresses.
- Add cart functionality, checkout process, orders screen, sub-categories with horizontal product scroll, view all products, view all brands, and brand-specific products.

## Login Backend - Firebase Authentication
- Set up Firebase and ensure the onboarding screens appear only once using local storage.
- Implement user registration with email verification, storing user data in Firestore.
- Enable login using email and password, Google Sign-In, and Facebook Sign-In.
- Implement "forget password" and "reset password" functionalities.
- Perform CRUD operations on user records stored in Firestore, and manage user profile pictures using Cloud Firebase storage.

## E-Commerce App Backend
- Fetch categories and subcategories to display in tabs used in the store.
- Retrieve banners and redirect users to specific screens.
- Fetch products and product details, using state management to optimize Firestore reads and writes.
- Display and sort products in the "All Products" screen.
- Fetch all brands and obtain data for each category, highlighting featured brands and products.
- Manage wishlist items for each user using local storage.
- Fetch subcategories, including products within each category.
- Allow users to add or update addresses.
- Implement the functionality to add products to the cart from both product cards and product detail sections.
- Manage the checkout process and create/display orders.