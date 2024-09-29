// seed.js
const { PrismaClient } = require("@prisma/client");
const { faker } = require("@faker-js/faker");

const prisma = new PrismaClient();

async function main() {
  // Create fake user admin
  let user = await prisma.users.create({
    data: {
      name: faker.person.fullName(),
      email: faker.internet.email(),
      password: faker.internet.password(),
      phone: faker.phone.number(),
      address: faker.location.streetAddress(),
    },
  });

  const userAdmin = await prisma.users_admins.create({
    data: {
      userPublicId: user.publicId,
    },
  });

  const statuses = ["OPEN", "CLOSED"];
  const ticketsName = ["VIP", "Cheio", "Meia", "Estudante", "Promocional"];
  const statusTicket = ["AVAILABLE", "SOLD_OUT"];

  // Create fake tickets
  const tickets = [];
  for (let i = 0; i < 150; i++) {
    const ticket = await prisma.tickets.create({
      data: {
        name: ticketsName[Math.floor(Math.random() * ticketsName.length)],
        price: parseFloat(faker.finance.amount()),
        quantity: faker.datatype.number(),
        status: statusTicket[Math.floor(Math.random() * statusTicket.length)],
      },
    });
    tickets.push(ticket);
  }

  // Create fake events
  for (let i = 0; i < 15; i++) {
    const randomStatus = statuses[Math.floor(Math.random() * statuses.length)];
    await prisma.events.create({
      data: {
        name: faker.random.words(),
        description: faker.random.words(),
        imageUrl: faker.image.url({
          width: 640,
          height: 480,
          category: "nature",
          randomize: true,
        }),
        address: faker.location.streetAddress(),
        userAdminPublicId: userAdmin.publicId,
        startDate: faker.date.recent(),
        endDate: faker.date.future(),
        status: randomStatus,
        tickets: {
          connect: tickets
            .slice(i * 10, (i + 1) * 10)
            .map((ticket) => ({ publicId: ticket.publicId })),
        },
      },
    });
  }

  // Create Fake User
  user = await prisma.users.create({
    data: {
      name: faker.person.fullName(),
      email: faker.internet.email(),
      password: faker.internet.password(),
      phone: faker.phone.number(),
      address: faker.location.streetAddress(),
    },
  });

  let userClient = await prisma.users_clients.create({
    data: {
      userPublicId: user.publicId,
    },
  });

  console.log("Seed data created");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
