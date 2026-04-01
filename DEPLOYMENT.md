# Shopping Cart Application - Deployment Guide

## Application Status: ✅ Running

### Access URL
**[http://localhost:8080](http://localhost:8080)**

### Setup Summary

#### Tools Installed
- **Maven 3.8.8** - Located at: `C:\Users\manju\maven`
- **Apache Tomcat 10.1.13** - Located at: `C:\Users\manju\tomcat`
- **Java 25 LTS**

#### Deployment Details
- **Application Name**: Online Shopping Cart (v1.0)
- **Packaging**: WAR (Web Archive)
- **Server Port**: 8080
- **Deployment Path**: `/ROOT` (deployed as root application)
- **WAR Location**: `C:\Users\manju\tomcat\webapps\ROOT.war`

#### Features
- View product catalog
- Add products to shopping cart
- View cart contents
- Clear cart
- Session-based cart management (30-minute timeout)

#### Backend Technologies
- **Language**: Java 11+
- **Framework**: Jakarta Servlet/JSP API 6.0
- **Servlets**:
  - `AddToCartServlet` (/addToCart)
  - `ViewCartServlet` (/viewCart)
  - `ClearCartServlet` (/clearCart)

#### Frontend Technologies
- **Pages**: JSP, HTML
- **Styling**: CSS
- **Interactivity**: JavaScript

### Build Information
- **Build Tool**: Maven
- **Built WAR**: `target/ShoppingCart.war`
- **Build Command**: `mvn clean package`

### Starting the Application

To restart the application, run:
```powershell
$env:CATALINA_HOME = "$env:USERPROFILE\tomcat"
& "$env:CATALINA_HOME\bin\catalina.bat" run
```

The application will be available at: **http://localhost:8080**

### Stopping the Application

To stop Tomcat:
```powershell
Get-Process | Where-Object {$_.ProcessName -like "*java*"} | Stop-Process -Force
```

---
**Created**: April 1, 2026
**Status**: Production Ready
