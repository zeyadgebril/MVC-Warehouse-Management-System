# MVC Warehouse Management System

A comprehensive inventory and stock management system built with ASP.NET Core MVC architecture. This system provides robust functionality for managing products, suppliers, stock movements, and user roles in a warehouse environment.

## Features

### Core Functionality
- **Product Management**: Add, edit, delete, and track products with detailed information
- **Supplier Management**: Maintain supplier records and relationships
- **Stock Movement Tracking**: Monitor inventory changes, transfers, and adjustments
- **User Role Management**: Support for different user types (Admin, Manager)
- **Inventory Control**: Real-time stock level monitoring and alerts

### User Roles
- **Admin**: Full system access including user management and system configuration
- **Manager**: Inventory management, reporting, and operational oversight

## Technology Stack

- **Backend**: ASP.NET Core MVC
- **Database**: Microsoft SQL Server
- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **ORM**: Entity Framework Core
- **Authentication**: ASP.NET Core Identity
- **Language**: C#

## Project Structure

```
MVC-Warehouse-Management-System/
├── Controllers/          # MVC Controllers
├── Models/              # Data models and ViewModels
├── Views/               # Razor views
├── Data/                # Database context and migrations
├── wwwroot/             # Static files (CSS, JS, images)
├── appsettings.json     # Configuration file
├── Program.cs           # Application entry point
└── Startup.cs           # Application configuration
```

## Prerequisites

- .NET 6.0 or later
- Microsoft SQL Server (LocalDB, Express, or Full version)
- Visual Studio 2022 or Visual Studio Code
- SQL Server Management Studio (optional)

## Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/zeyadgebril/MVC-Warehouse-Management-System.git
cd MVC-Warehouse-Management-System
```

### 2. Database Configuration
Update the connection string in `appsettings.json`:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=WarehouseManagementDB;Trusted_Connection=true;MultipleActiveResultSets=true"
  }
}
```

### 3. Database Setup
Run the following commands in Package Manager Console:

```powershell
# Create and apply migrations
Add-Migration InitialCreate
Update-Database
```

Or using .NET CLI:
```bash
dotnet ef migrations add InitialCreate
dotnet ef database update
```

### 4. Run the Application
```bash
# Using .NET CLI
dotnet run

# Or using Visual Studio
Press F5 or Ctrl+F5
```

The application will be available at `https://localhost:5001` or `http://localhost:5000`

## Configuration

### appsettings.json
Key configuration sections:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Your SQL Server connection string"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
```

## Database Schema

The system includes the following main entities:

- **Users**: System users with roles and permissions
- **Products**: Product catalog with specifications and pricing
- **Suppliers**: Supplier information and contact details
- **StockMovements**: Record of all inventory transactions
- **Categories**: Product categorization
- **StockLevels**: Current inventory quantities

## Usage

### Getting Started
1. Run the application
2. Navigate to `https://localhost:5001`
3. Register a new account or use seeded admin credentials
4. Set up initial suppliers and product categories
5. Begin adding products and managing inventory

### Key Features

#### Product Management
- Navigate to Products section
- Add new products with SKU, name, description, price
- Set stock levels and reorder points
- Assign suppliers to products

#### Stock Management
- Record stock receipts and shipments
- Process stock adjustments
- Generate stock movement reports
- Monitor low stock alerts

#### Supplier Management
- Add supplier information and contact details
- Track supplier performance
- Manage supplier relationships

## Development

### Running in Development Mode
```bash
dotnet run --environment Development
```

### Building for Production
```bash
dotnet build --configuration Release
dotnet publish --configuration Release
```

### Entity Framework Commands
```bash
# Add new migration
dotnet ef migrations add MigrationName

# Update database
dotnet ef database update

# Remove last migration
dotnet ef migrations remove

# Generate SQL script
dotnet ef migrations script
```

## Security Features

- ASP.NET Core Identity for authentication
- Role-based authorization
- Input validation and model binding
- SQL injection prevention through Entity Framework
- XSS protection with Razor views
- CSRF protection

## Troubleshooting

### Common Issues

**Database Connection Error**
- Verify SQL Server is running
- Check connection string in appsettings.json
- Ensure database exists and migrations are applied

**Migration Issues**
```bash
dotnet ef database drop
dotnet ef migrations remove
dotnet ef migrations add InitialCreate
dotnet ef database update
```

**Port Already in Use**
- Change ports in Properties/launchSettings.json
- Or kill process using the port

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

### Development Guidelines
- Follow ASP.NET Core MVC conventions
- Use Entity Framework Core for data access
- Implement proper error handling
- Add XML documentation for public methods
- Follow C# coding standards

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

**Developer**: Zeyad Gebril
- GitHub: [@zeyadgebril](https://github.com/zeyadgebril)
- GitHub: [@IbrahimAdel10](https://github.com/IbrahimAdel10)
- GitHub: [@AhmedOsama779](https://github.com/AhmedOsama779)
- GitHub: [@Mohamed-H-dev](https://github.com/Mohamed-H-dev)
- GitHub: [@omargallo](https://github.com/omargallo)

---

*For detailed technical documentation, please refer to the code comments and XML documentation within the project files.*
