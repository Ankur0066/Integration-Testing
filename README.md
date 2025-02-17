# Integration Testing with TypeScript

This repository contains code for implementing integration testing from scratch using **TypeScript**, **Aiven Serverless Database**, **Prisma**, **Supertest**, and **Vitest**.

## Project Overview

This project is designed to set up and run integration tests for an application that interacts with a database. It uses **Prisma** as the ORM for managing data models and **Aiven** for serverless database hosting. The tests ensure the functionality of key endpoints and data flows, ensuring smooth operation of the backend services.

## Technologies Used

- **TypeScript**: A superset of JavaScript that enables static typing.
- **Aiven Serverless Database**: A fully managed database service.
- **Prisma ORM**: Used to interact with the database and define data models.
- **Supertest**: A super-agent-driven library used for testing HTTP endpoints.
- **Vitest**: A fast and efficient testing framework for running tests.

## Setup Instructions

### 1. Initialize Project
Start by initializing the project with the following commands:

```bash
npm init -y
npx tsc --init
```

### 1. Create the TypeScript Files
After initializing TypeScript, you need to create the following files in the `src` directory for your application.

#### 1.1 **Create a simple Express server:**

Create a file called `app.ts` inside the `src` directory.

```typescript
import express, { Request, Response } from 'express';

const app = express();
const port = 3000;

app.get('/', (req: Request, res: Response) => {
  res.send('Hello World');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

```
1.2 Create the Prisma Client and Database Models:
Ensure your prisma/schema.prisma file looks like this:
```typescript
model Request {
  id          Int     @id @default(autoincrement())
  a           Int
  b           Int
  answer      Int
  type        Type
}

enum Type {
  ADD
  MUL
}
```

Run the following command to generate the Prisma client:

```
npx prisma generate
```
1.3 Set Up a Database Integration File:
Create a file called db.ts to handle the database connection with Prisma.
```
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export const getRequest = async (id: number) => {
  return await prisma.request.findUnique({
    where: {
      id: id
    }
  });
};

export const createRequest = async (a: number, b: number, type: 'ADD' | 'MUL') => {
  const answer = type === 'ADD' ? a + b : a * b;
  return await prisma.request.create({
    data: {
      a,
      b,
      answer,
      type
    }
  });
};
```

1.4 Set Up Testing with Vitest and Supertest
1.4.1 Install Vitest and Supertest:
Run the following command to install Vitest and Supertest for testing:
```
npm i -D vitest supertest @types/supertest
```
### 2.Running the Tests

Once everything is set up, you can run the tests using the following command:
```
npm run test
```


