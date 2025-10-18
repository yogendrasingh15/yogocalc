# MySQL Database Setup for YogoCalc

## Configuration Overview

This project uses MySQL 8.0 as the database. The configuration is managed through environment variables for security and flexibility.

## Environment Variables

The following environment variables are used for database configuration (defined in `.env`):

```
DB_HOST=localhost
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=YOGO@1512
DB_NAME=yogocalc_development
DB_NAME_TEST=yogocalc_test
```

## Dev Container Setup

The project includes a Docker Compose configuration that automatically sets up MySQL when you open the project in a dev container.

### Services:
- **app**: Ruby on Rails application container
- **db**: MySQL 8.0 database container

### To rebuild the dev container with MySQL:
```bash
# Rebuild the dev container to apply the new configuration
gitpod devcontainer rebuild
```

## Manual MySQL Setup (if not using dev container)

### 1. Install MySQL 8.0

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev
```

**macOS:**
```bash
brew install mysql@8.0
brew services start mysql@8.0
```

### 2. Configure MySQL

```bash
# Login to MySQL
mysql -u root -p

# Create database and user
CREATE DATABASE yogocalc_development CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE yogocalc_test CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'yogocalc'@'localhost' IDENTIFIED BY 'YOGO@1512';
GRANT ALL PRIVILEGES ON yogocalc_development.* TO 'yogocalc'@'localhost';
GRANT ALL PRIVILEGES ON yogocalc_test.* TO 'yogocalc'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

### 3. Update Environment Variables

Copy `.env.example` to `.env` (if not already done) and update the database credentials:

```bash
cp .env.example .env
```

Edit `.env` with your MySQL credentials.

## Database Operations

### Create and Setup Database
```bash
# Create the database
bundle exec rails db:create

# Run migrations
bundle exec rails db:migrate

# Seed the database (optional)
bundle exec rails db:seed
```

### Reset Database
```bash
bundle exec rails db:drop db:create db:migrate db:seed
```

### Check Database Connection
```bash
bundle exec rails db:version
```

## Troubleshooting

### Connection Issues

1. **Check MySQL is running:**
   ```bash
   sudo service mysql status
   # or
   systemctl status mysql
   ```

2. **Verify credentials:**
   - Ensure the username and password in `.env` match your MySQL configuration
   - Check that the database user has proper permissions

3. **Check MySQL socket:**
   If you get socket errors, you may need to specify the socket path in `config/database.yml`:
   ```yaml
   development:
     socket: /var/run/mysqld/mysqld.sock
   ```

### Character Set Issues

The database is configured to use `utf8mb4` encoding with `utf8mb4_unicode_ci` collation for full Unicode support (including emojis).

If you encounter character set issues:
```sql
ALTER DATABASE yogocalc_development CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

## Security Notes

- **Never commit `.env` file** - It contains sensitive credentials
- Use strong passwords in production
- Consider using environment-specific credentials
- For production, use managed database services with encrypted connections

## Database Schema

The current schema includes the following tables:
- `users` - User authentication and profile information
- `bets` - Betting records
- `contacts` - Contact information
- `roles` - User roles and permissions

Run `bundle exec rails db:schema:dump` to update the schema file after migrations.
