# NestJS CRUD API

This is a simple NestJS application that implements CRUD (Create, Read, Update, Delete) operations for an "Item" resource.

## Project Structure

```
src/
├── main.ts                 # Application entry point
├── app.module.ts           # Root module
├── items/                  # Items feature module
│   ├── items.module.ts     # Items module definition
│   ├── items.controller.ts # REST API endpoints
│   ├── items.service.ts    # Business logic
│   ├── dto/                # Data Transfer Objects
│   │   ├── create-item.dto.ts  # DTO for creating items
│   │   └── update-item.dto.ts  # DTO for updating items
│   └── entities/           # Entity definitions
│       └── item.entity.ts  # Item entity
```

## API Endpoints

The API provides the following endpoints:

- `POST /items` - Create a new item
- `GET /items` - Get all items
- `GET /items/:id` - Get an item by ID
- `PUT /items/:id` - Update an item by ID
- `DELETE /items/:id` - Delete an item by ID

## Running the Application

1. Install dependencies:
   ```
   npm install
   ```

2. Start the application:
   ```
   npm run start:dev
   ```

3. The API will be available at `http://localhost:3000`

## Testing the API

You can test the API using tools like curl, Postman, or any HTTP client.

### Example Requests

#### Create an Item
```bash
curl -X POST http://localhost:3000/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "This is a test item", "price": 9.99}'
```

#### Get All Items
```bash
curl http://localhost:3000/items
```

#### Get an Item by ID
```bash
curl http://localhost:3000/items/1
```

#### Update an Item
```bash
curl -X PUT http://localhost:3000/items/1 \
  -H "Content-Type: application/json" \
  -d '{"name": "Updated Item", "price": 19.99}'
```

#### Delete an Item
```bash
curl -X DELETE http://localhost:3000/items/1
```

## Features

- Validation using class-validator
- Error handling with appropriate HTTP status codes
- Type safety with TypeScript
- In-memory data storage (for simplicity)