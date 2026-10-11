# Flight Management Project

A small PHP and MySQL flight ticket booking application. Passengers can create an account, sign in, browse flights, request tickets for adults and children, and review their booking history. An administrator can maintain the flight list and review ticket sales.

The application is organized as a set of PHP pages. Each page handles a screen or a form submission, and most pages query the MySQL database directly through `mysqli`. The user interface is server-rendered HTML styled with page-specific CSS and Bootstrap.

## What the application does

### Passenger

- Register with a name, email, date of birth, password, phone number, and gender.
- Sign in and open a passenger dashboard.
- View flight availability, route, schedule, adult and child fares, and remaining seats.
- Select a route and date, passenger counts, contact number, and a payment method to request a booking.
- See an e-ticket containing passenger and flight details and the calculated fare.
- Review personal ticket history and profile information.

### Administrator

- Sign in to an administrator dashboard.
- View all flights and remaining seat counts.
- Add, modify, or delete flight records.
- Review the overall ticket sales history.
- View the account profile.

The public home page provides an informational landing page with destination imagery, service descriptions, and links to sign up or sign in.

## Technology

- **Server:** PHP, using page-level scripts and PHP sessions.
- **Database:** MySQL/MariaDB accessed with the PHP `mysqli` extension.
- **Frontend:** HTML, CSS, Bootstrap 5.2, and a small amount of inline styling. Google Fonts and Bootstrap assets are loaded from CDNs.
- **Local environment represented by the SQL dump:** PHP 8.0 and MariaDB 10.4 (the versions in the dump header, not a runtime requirement declaration).

There is no package manager manifest or automated test suite in the repository. The application does not use a PHP framework or a client-side JavaScript framework.

## Repository layout

```text
Flight-Management-Project/
├── FlightManagement/          # Web root: PHP pages, stylesheets, and images
│   ├── DBconnect.php          # MySQL connection settings
│   ├── home.php               # Public landing page
│   ├── sign_up.php            # Registration form
│   ├── create.php             # Registration handler
│   ├── sign_in.php            # Login form
│   ├── logIn.php              # Login handler and role routing
│   ├── dashboard_user.php     # Passenger booking dashboard/form
│   ├── dashboard_admin.php    # Admin dashboard and booking form
│   ├── available.php          # Passenger flight listing
│   ├── available_admin.php    # Admin flight listing and maintenance form
│   ├── admin_edit.php         # Admin add/modify/delete handler
│   ├── ticket.php             # Booking validation, ticket, and history write
│   ├── history_user.php       # Current passenger's booking history
│   ├── history_admin.php      # All booking history for admin
│   ├── profile.php            # Signed-in account details
│   ├── print.php              # Empty placeholder in the current checkout
│   ├── css/                   # Page-specific stylesheets
│   └── images/                # Logos, destination photos, and illustrations
└── SQL/
    └── flight.sql             # Database schema and sample records
```

## How the pieces fit together

The landing page links to registration and login. Registration submits to `create.php`, which inserts a user and stores their email in the session. Login submits to `logIn.php`; that handler checks the account and routes the configured administrator email (`admin47@gmail.com`) to `dashboard_admin.php`, with other accounts sent to `dashboard_user.php`.

Both dashboards read flight options from the database. The passenger dashboard links to the available-flight list and personal history. The administrator dashboard links to the flight-management page and sales history. Flight changes from the administrator page are submitted to `admin_edit.php`.

A booking form posts to `ticket.php`. The handler finds a matching route and date, checks requested seats against availability, calculates the adult/child fare, displays an e-ticket, writes a record to `history`, decrements the flight's available seats, and clears the temporary `ticket_info` record. The database connection is shared by including `DBconnect.php`.

## Database overview

Import `SQL/flight.sql` to create the `flight` database and its four tables:

| Table | Purpose |
| --- | --- |
| `user` | Passenger and administrator account details; email is the primary key. |
| `flight` | Flight identifier, route, date/time, adult/child fares, and available seats; `f_id` is the primary key. |
| `ticket_info` | Temporary booking/passenger details used during ticket generation; email is the primary key. |
| `history` | Persisted booking details used by passenger and administrator history pages. |

The SQL dump includes sample flight and user data. One of those sample user rows is the administrator account used by the current login routing. Treat the dump as development/demo data, not production data.

## Run locally

You need a PHP-enabled web server, PHP's `mysqli` extension, and MySQL or MariaDB. XAMPP, WampServer, or a comparable local stack can provide these pieces.

1. Start the web server and database service.
2. Import `SQL/flight.sql` into MySQL/MariaDB. The dump creates a database named `flight`.
3. Check `FlightManagement/DBconnect.php` and update the host, username, password, and database name for your local database. The checked-in defaults are `localhost`, user `root`, a blank password, and database `flight`.
4. Configure the web server document root to `FlightManagement/` (or place that folder under the server's document root).
5. Open `home.php` through the local web server, for example `http://localhost/home.php` when `FlightManagement/` is the document root.
6. Sign up for a passenger account, or use the sample administrator account from the imported SQL data.

This project is a traditional PHP website; do not open the PHP files directly from the filesystem. PHP must run through a web server to process the pages and database requests.

## Notes for contributors

- The PHP pages contain both presentation and database logic. The `css/` directory separates visual styles by page; there is no separate API or application/service layer.
- The passenger and admin experiences share the `flight`, `history`, and account data, with role routing based on a hard-coded email in `logIn.php`.
- The payment options are recorded as labels. The current code does not integrate with a payment gateway.
- The ticket print control is presentational in the current implementation; `print.php` is empty, and the print action is not wired to a dedicated print handler.
- There is no logout handler: dashboard links labeled “Log Out” currently navigate to `home.php` without clearing the session.

