# Employee App

This Flutter application fetches employee data from the **RandomUser.me** API, caches it locally, and displays it in a list. Users can view detailed information about each employee, including their name, email, phone number, and profile picture.

---

## Features

- **Fetches employee data** from `https://randomuser.me/api/?results=10`.
- **Caches employee data locally** using `shared_preferences` for offline access.
- **Displays a list of employees** with their name, email, and profile picture.
- **Shows detailed employee information** on a separate screen, including name, email, and phone number.
- **Implements error handling** with a retry button in case of API failures.
- **Displays a loading indicator** while fetching data.

---

## Screenshots

![Employee List](screenshots/employee_list.png)  
*Employee List Screen*

![Employee Details](screenshots/employee_details.png)  
*Employee Details Screen*

---

## How to Run

1. **Clone the repository**:
   ```bash
   git clone https://github.com/MoSwidan/EmployeeApp.git
   cd EmployeeApp
