# ECommerceApp  
🛍️ A modern, SwiftUI-based e-commerce app following the MVVM architecture. It includes features such as product browsing, search functionality, cart management, product detail, checkout flow, and alert popups — all implemented using native Swift frameworks.

---

## ✨🚀 Features

- ✅ **Product Listing**
  - Fetch products asynchronously using URLSession.
  - Display product images, titles, prices, ratings, and descriptions.

- 🔍 **Search Products**
  - Real-time filtering of products based on user input.

- 🛒 **Cart Management**
  - Add, remove, and manage quantities of products in the cart.

- 📦 **Checkout Flow**
  - Confirmation alert before order placement.
  - Success alert on completion, clearing the cart.

- 💬 **Alert System**
  - Custom alerts for feedback and confirmations.

- 📄 **Product Detail View**
  - Detailed view with large images and add-to-cart action.

  - 🎨 **Clean UI**
  - Built entirely in SwiftUI with responsive layouts.

---

## ▶️ Getting Started

### Prerequisites

- Xcode 15+
- iOS 16+ target

### Running the App

1. Clone the repo:
   ```bash
   git clone https://github.com/SaravanaSelvakumar/ECommerceApp.git

---

## 📱 Screenshots

<img width="300" height="650" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-17 at 15 47 13" src="https://github.com/user-attachments/assets/9a2e01bf-90d1-4dcd-848b-a053eeb07cbc" />
<img width="300" height="650" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-17 at 15 47 34" src="https://github.com/user-attachments/assets/3102262e-66b0-4491-bec8-669234a3ae59" />
<img width="300" height="650" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-17 at 15 47 48" src="https://github.com/user-attachments/assets/688f2cd5-cd48-4d0a-94a9-b2440706e451" />
<img width="300" height="650" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-17 at 15 48 44" src="https://github.com/user-attachments/assets/224bb52a-f533-4bf3-b22c-db6ffb0d9b51" />
<img width="300" height="650" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-17 at 15 48 55" src="https://github.com/user-attachments/assets/321b414a-e349-4f50-929d-47631fcbcea1" />
<img width="300" height="650" alt="Simulator Screenshot - iPhone 16 Pro - 2025-08-17 at 15 52 24" src="https://github.com/user-attachments/assets/b508d002-6985-4eab-b9df-96995060224d" />

---

## 🛠️ Tech Stack

- **Language:** Swift  
- **Framework:** SwiftUI  
- **Platform:** iOS   
- **Architecture:** MVVM (Model-View-ViewModel)  
- **Networking:** URLSession for API calls

---

## 📂 Folder Structure

```bash
├── Models/
│   ├── Cart.swift
│   └── Product.swift
├── Views/
│   ├── HomeView.swift
│   ├── ProductListView.swift
│   ├── ProductDetailView.swift
│   ├── CartView.swift
│   ├── CategoryView.swift
│   ├── FavoritesView.swift
│   └── SearchView.swift
├── ViewModels/
│   ├── MainViewModel.swift
│   └── AlertViewModel.swift
├── Resources/
│   └── Assets.xcassets
├── Utilities/
│   └── Extensions.swift
└── README.md
