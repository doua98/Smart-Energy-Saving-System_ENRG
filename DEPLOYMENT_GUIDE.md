# 🚀 ENRG SMART ENERGY - SATURDAY DEMO DEPLOYMENT GUIDE

---

## **STEP 1: PRE-DEMO SETUP (Thursday/Friday)**

### 1.1 Database Initialization

```sql
-- Open pgAdmin
-- Create new database called: AGL_db
-- Select AGL_db, click "Query Tool"
-- Copy ALL content from schema.sql (creates tables, indexes, functions, triggers, views)
-- Execute (F6 or Run button)
-- Wait for completion ✓

-- Then in new Query Tool window:
-- Copy ALL content from seed.sql (inserts test data)
-- Execute (F6)
-- Wait for completion ✓
```

### 1.2 Verify Database

```sql
-- Run these verification queries in pgAdmin:

SELECT COUNT(*) as "Total Users" FROM utilisateurs;
-- Expected: 10

SELECT COUNT(*) as "Admins" FROM administrateurs;
-- Expected: 7

SELECT COUNT(*) as "Total Devices" FROM appareils;
-- Expected: 19

SELECT COUNT(*) as "Consumption Records" FROM consommation;
-- Expected: 40+

SELECT COUNT(*) as "Alerts" FROM alertes;
-- Expected: 10
```

**If all numbers match → Database is ready ✅**

---

## **STEP 2: XAMPP STARTUP (Saturday Morning)**

### 2.1 Start XAMPP Services

1. **Open XAMPP Control Panel**
   - Windows: `C:\xampp\xampp-control.exe`

2. **Start Services** (click "Start" next to each)
   - ✓ Apache
   - ✓ MySQL (or skip if using PostgreSQL only)
   - ✓ PostgreSQL

3. **Wait for green indicators**

### 2.2 Verify Services

Open browser and navigate to:

```
http://localhost/AGL/check_db.php
```

Expected output:
```
{
  "success": true,
  "database": "AGL_db",
  "status": "connected",
  "tables": 9,
  "users": 10
}
```

**If success: true → Ready to demo ✅**

---

## **STEP 3: LAUNCH APPLICATION**

### 3.1 Access Application

```
http://localhost/AGL/index.html
```

### 3.2 Test Login

Try these credentials:

| Email | Password |
|-------|----------|
| nour.guesmi@enrg.com | admin123 |
| doua.nasri@enrg.com | admin123 |
| ahmed@example.com | hash_motdepasse_1 |

**Each should login successfully and show dashboard ✅**

---

## **STEP 4: DEMO FLOW (20-30 minutes)**

### 🎯 **Part 1: Authentication (2 min)**
```
1. Show login screen
2. Enter: nour.guesmi@enrg.com / admin123
3. Explain database-driven auth with bcrypt
4. Show user profile loads from DB
```

### 🎯 **Part 2: Dashboard Overview (5 min)**
```
1. Show metrics:
   - Today: 12.50 kWh
   - This month: 312.5 kWh
   - Bill: 1,544 DA
   
2. Show charts:
   - Hourly consumption (bar chart)
   - Device type breakdown (pie chart)
   - Top 6 consuming devices
   
3. Explain: "All data is REAL from PostgreSQL database"
```

### 🎯 **Part 3: Device Management (3 min)**
```
1. Click "Appareils & Pièces"
2. Show 19 devices grouped by room:
   - Salon (5 devices)
   - Cuisine (4 devices)
   - Bureau (3 devices)
   - Chambre (2 devices)
   - etc.
3. Show device details:
   - Name, type, location, power
   - Device status (on/off)
```

### 🎯 **Part 4: Alerts System (3 min)**
```
1. Click "Alertes intelligentes"
2. Show 10 real alerts from database
3. Filter by type:
   - Critique (red)
   - Avertissement (orange)
   - Info (blue)
4. Mark alert as read
5. Show timestamps
```

### 🎯 **Part 5: Admin Panel (3 min)**
```
1. Click "Administration" (admin-only feature)
2. Show user management:
   - Total: 10 users
   - Admins: 7
   - Regular users: 3
3. Show all 7 team members listed
4. Show system statistics
```

### 🎯 **Part 6: Export & Reports (2 min)**
```
1. Go to "Historique & Rapports"
2. Click "📊 Exporter CSV"
   - Shows: "ENRG_consommation_2026-04-15.csv" download
   - Contains 40+ consumption records
3. Click "📄 Rapport TXT"
   - Shows: "ENRG_rapport_mensuel_2026-04-15.txt" download
   - Contains formatted report
```

### 🎯 **Part 7: Live Demo with Team (2-3 min)**
```
1. Have another team member (e.g., Doua) login
2. Show: "Each user sees their own data"
3. Show both users can access admin panel
4. Demonstrate role separation
```

---

## **STEP 5: MULTI-TEAM MEMBER DEMO SCENARIO**

### Setup (Before Demo)
- Have 2-3 browsers open, each logged in as different team member
- Or use incognito windows for each user

### Demo Flow
```
Browser 1: Login as nour.guesmi@enrg.com
  - Show admin panel
  - Show all users
  
Browser 2: Login as ahmed@example.com (regular user)
  - Show NO admin panel (role check working)
  - Show only dashboard
  
Browser 3: Login as doua.nasri@enrg.com (admin)
  - Show admin panel available
  - Show can manage other users
  
Explanation: "Our system uses role-based access control.
Only the 7 team members are admins. All other users are regular."
```

---

## **STEP 6: TALKING POINTS**

### Technical Stack ✅
- **Frontend**: HTML5, CSS3, Canvas API (no external charting library)
- **Backend**: PHP 7.4+ with PDO
- **Database**: PostgreSQL 12+
- **Authentication**: bcrypt hashing + JWT tokens
- **Security**: Prepared statements, input validation

### Key Features Implemented ✅
- ✓ Multi-user authentication
- ✓ Role-based access control (admin vs user)
- ✓ Real database integration
- ✓ Device management (19 devices)
- ✓ Consumption tracking (40+ records)
- ✓ Alert system (10 alerts)
- ✓ Data export (CSV/TXT)
- ✓ Professional dashboard
- ✓ Admin panel for system management
- ✓ Responsive UI design

### Requirements Met (from cahier des charges) ✅
- **F03**: Saisie des capteurs IoT - ✓ Input form present
- **F04**: Alertes intelligentes - ✓ 10 alerts with filters
- **F05**: Recommandations IA - ✓ 15 recommendations
- **F06**: Appareils & Pièces - ✓ 19 devices manageable
- **F07**: Historique & Rapports - ✓ Export to CSV/TXT
- **F10**: Admin Panel - ✓ User management
- Plus: Dashboard, charts, real-time data, etc.

### Database Highlights ✅
- 9 tables with proper relationships
- 10 users (7 admins + 3 demo users)
- 19 devices with data
- 40+ consumption records
- 10 active alerts
- 15 recommendations
- Historical data support

---

## **STEP 7: COMMON QUESTIONS & ANSWERS**

### Q: "Is this connected to real IoT devices?"
**A:** "Currently simulated for demo. In production, MQTT/WebSocket would connect to real sensors. All the infrastructure is ready for that integration."

### Q: "How many users can it support?"
**A:** "Unlimited. PostgreSQL can handle thousands. We've tested with 10 here, but the system scales."

### Q: "Can we add new devices?"
**A:** "Yes! You can insert directly into the database via admin panel (future phase). Currently, we populate from seed data."

### Q: "What if a sensor fails?"
**A:** "The system marks it as 'inactive' and still displays historical data. Alerts trigger if thresholds are exceeded."

### Q: "How is security handled?"
**A:** "Bcrypt password hashing, prepared statements to prevent SQL injection, JWT tokens for API, role-based access control."

### Q: "Can this work on mobile?"
**A:** "Yes, fully responsive design works on phones and tablets."

---

## **STEP 8: TROUBLESHOOTING**

### Issue: "Database connection error"
```
Fix:
1. Check PostgreSQL is running in XAMPP
2. Verify AGL_db database exists
3. Run: http://localhost/AGL/check_db.php
4. Check db.php connection string
```

### Issue: "No data showing in dashboard"
```
Fix:
1. Verify seed.sql was executed completely
2. Check browser console (F12) for errors
3. Reload page: Ctrl+F5 (hard refresh)
4. Verify users in database: SELECT * FROM utilisateurs;
```

### Issue: "Login fails"
```
Fix:
1. Verify credentials are correct
2. Check user exists: SELECT * FROM utilisateurs WHERE email='...';
3. Check if password is hashed or plain
4. Try test@enrg.com / 1234 (if using old seed data)
```

### Issue: "Charts not rendering"
```
Fix:
1. Open browser console (F12)
2. Check for JavaScript errors
3. Verify canvas elements exist in HTML
4. Try different browser
```

### Issue: "Export buttons don't work"
```
Fix:
1. Check consumption data exists: SELECT * FROM consommation;
2. Verify liveData is populated from API
3. Check browser download settings
4. Whitelist localhost in download settings
```

---

## **STEP 9: BACKUP PLANS**

### If Database Fails
- Have seed.sql ready to reinitialize
- Know how to drop and recreate tables
- Have backup export of current data

### If Browser Crashes
- Have incognito window ready
- Have Chrome + Firefox both available
- Know how to hard-refresh (Ctrl+F5)

### If Projector Fails
- Have second monitor as backup
- Have laptop's screen as backup
- Have pre-recorded screenshots/video as backup

### If Internet Fails
- Everything runs locally, no internet needed ✓
- Just need Apache + PostgreSQL running

---

## **STEP 10: POST-DEMO**

### Documentation Provided
- ✓ DEMO_READINESS.md (this file)
- ✓ README.md (technical docs)
- ✓ Full source code
- ✓ Database schema (schema.sql)
- ✓ Test data (seed.sql)

### Deliverables
- ✓ Working application
- ✓ Database with real data
- ✓ All 17 API endpoints
- ✓ Admin + user accounts
- ✓ Professional UI
- ✓ Export functionality

---

## 🎊 **YOU'RE READY TO DEMO!**

**Timeline:**
- 5 min: Start XAMPP, verify database
- 5 min: Load application, test login
- 20-30 min: Execute demo flow
- 5 min: Q&A

**Total: ~45 minutes**

**For 7-member team:**
- Each member has admin access
- Each can explain their module
- Professional presentation ready
- All data is REAL and database-driven

---

**Good luck with your Saturday demo! 🚀**

*Questions? Check the console logs (F12) for error details.*
*Questions? Check README.md for technical documentation.*
*Questions? Review the code in /AGL/ directory.*
