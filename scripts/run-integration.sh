echo '🟡 - Waiting for database to be ready...'

# Using wait-for-it.sh for MySQL
./scripts/wait-for-it.sh mysql-3d00a70e-ankurtiwari50777-448a.c.aivencloud.com:23236 -- echo '🟢 - Database is ready!'

echo ""

npx prisma migrate dev --name init

echo ""

npm run test

echo ""
