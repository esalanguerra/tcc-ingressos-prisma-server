// index.js
const express = require("express");
const cors = require("cors");

require("dotenv").config();

const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
const app = express();

app.use(express.json());
app.use(cors(process.env.CORS_ORIGIN));

// CRUD for Users
app.get("/users", async (req, res) => {
  const users = await prisma.users.findMany();
  res.json(users);
});

app.post("/users", async (req, res) => {
  const user = await prisma.users.create({
    data: req.body,
  });
  res.json(user);
});

app.get("/users/:id", async (req, res) => {
  const user = await prisma.users.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  res.json(user);
});

app.put("/users/:id", async (req, res) => {
  const user = await prisma.users.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(user);
});

app.delete("/users/:id", async (req, res) => {
  const user = await prisma.users.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.json(user);
});

// CRUD for Events
app.get("/events", async (req, res) => {
  const events = await prisma.events.findMany({
    include: {
      userAdmin: {
        select: {
          user: true,
        }
      }
    }
  });
  res.json(events);
});

app.post("/events", async (req, res) => {
  const event = await prisma.events.create({
    data: req.body,
  });
  res.json(event);
});

app.get("/events/:id", async (req, res) => {
  const event = await prisma.events.findUnique({
    where: { id: parseInt(req.params.id) },
    include: {
      userAdmin: {
        select: {
          user: true,
        },
      },
      tickets: true,
    },
  });
  res.json(event);
});


app.put("/events/:id", async (req, res) => {
  const event = await prisma.events.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(event);
});

app.delete("/events/:id", async (req, res) => {
  const event = await prisma.events.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.json(event);
});

// CRUD for Tickets
app.get("/tickets", async (req, res) => {
  const tickets = await prisma.tickets.findMany();
  res.json(tickets);
});

app.post("/tickets", async (req, res) => {
  const ticket = await prisma.tickets.create({
    data: req.body,
  });
  res.json(ticket);
});

app.get("/tickets/:id", async (req, res) => {
  const ticket = await prisma.tickets.findUnique({
    where: { id: parseInt(req.params.id) },
    include: {
      event: true, // Inclui o evento associado ao ticket
    },
  });
  res.json(ticket);
});


app.put("/tickets/:id", async (req, res) => {
  const ticket = await prisma.tickets.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(ticket);
});

app.delete("/tickets/:id", async (req, res) => {
  const ticket = await prisma.tickets.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.json(ticket);
});

// CRUD for User Tickets
app.get("/user-tickets", async (req, res) => {
  const userTickets = await prisma.user_tickets.findMany();
  res.json(userTickets);
});

app.post("/user-tickets", async (req, res) => {
  const userTicket = await prisma.user_tickets.create({
    data: req.body,
  });
  res.json(userTicket);
});

app.get("/user-tickets/:id", async (req, res) => {
  const userTicket = await prisma.user_tickets.findUnique({
    where: { id: parseInt(req.params.id) },
    include: {
      ticket: true, // Inclui o ingresso associado
      userClient: true, // Inclui o cliente associado
    },
  });
  res.json(userTicket);
});


app.put("/user-tickets/:id", async (req, res) => {
  const userTicket = await prisma.user_tickets.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(userTicket);
});

app.delete("/user-tickets/:id", async (req, res) => {
  const userTicket = await prisma.user_tickets.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.json(userTicket);
});

// CRUD for Carts
app.get("/carts", async (req, res) => {
  const carts = await prisma.carts.findMany();
  res.json(carts);
});

app.post("/carts", async (req, res) => {
  const { eventPublicId, ticketPublicId, userClientPublicId } = req.body;

  // Verifica se já existe um carrinho para o usuário
  const cartExists = await prisma.carts.findFirst({
    where: {
      userClientPublicId: userClientPublicId,
    },
  });

  if (cartExists) {
    return res
      .status(400)
      .json({ message: "Cart already exists for this user" });
  }

  // Cria um novo carrinho
  const cart = await prisma.carts.create({
    data: {
      events: {
        connect: {
          publicId: eventPublicId,
        },
      },
      tickets: {
        connect: {
          publicId: ticketPublicId,
        },
      },
      userClientPublicId: userClientPublicId,
    },
  });

  res.json(cart);
});


app.get("/carts/:id", async (req, res) => {
  const cart = await prisma.carts.findUnique({
    where: { id: parseInt(req.params.id) },
    include: {
      events: true, // Inclui eventos associados ao carrinho
      tickets: true,
      checkout: true,
    },
  });
  res.json(cart);
});


app.put("/carts/:id", async (req, res) => {
  const { userPublicId, ticketPublicId, eventPublicId } = req.body;

  const cartExists = await prisma.carts.findFirst({
    where: {
      userClientPublicId: userPublicId,
    },
  });
  
  if (!cartExists) {
    return res
      .status(400)
      .json({ message: "Cart does not exist for this user" });
  }

  const cart = await prisma.carts.update({
    where: { id: parseInt(req.params.id) },
    data: {
      events: {
        connect: {
          publicId: eventPublicId,
        },
      },
      tickets: {
        connect: {
          publicId: ticketPublicId,
        },
      },
      userClientPublicId: userPublicId,
    },
  });

  return res.json(cart);
});

app.delete("/carts/:id", async (req, res) => {
  const cart = await prisma.carts.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.json(cart);
});

// CRUD for Checkouts
app.get("/checkouts", async (req, res) => {
  const checkouts = await prisma.checkouts.findMany();
  res.json(checkouts);
});

app.post("/checkouts", async (req, res) => {
  const checkout = await prisma.checkouts.create({
    data: req.body,
  });
  res.json(checkout);
});

app.get("/checkouts/:id", async (req, res) => {
  const checkout = await prisma.checkouts.findUnique({
    where: { id: parseInt(req.params.id) },
    include: {
      userClient: true, // Inclui o cliente associado ao checkout
      cart: true,
    },
  });
  res.json(checkout);
});


app.put("/checkouts/:id", async (req, res) => {
  const checkout = await prisma.checkouts.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(checkout);
});

app.delete("/checkouts/:id", async (req, res) => {
  const checkout = await prisma.checkouts.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.json(checkout);
});

// CRUD for User Admin
app.get("/user-admin", async (req, res) => {
  const userAdmins = await prisma.user_admin.findMany();
  res.json(userAdmins);
});

app.post("/user-admin", async (req, res) => {
  const userAdmin = await prisma.user_admin.create({
    data: req.body,
  });
  res.json(userAdmin);
});

app.get("/user-admin/:id", async (req, res) => {
  const userAdmin = await prisma.user_admin.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  res.json(userAdmin);
});

app.put("/user-admin/:id", async (req, res) => {
  const userAdmin = await prisma.user_admin.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(userAdmin);
});

app.delete("/user-admin/:id", async (req, res) => {
  const userAdmin = await prisma.user_admin.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.json(userAdmin);
});

// CRUD for User Clients
app.get("/user-clients", async (req, res) => {
  const userClients = await prisma.users_clients.findMany();
  res.json(userClients);
});

app.post("/user-clients", async (req, res) => {
  const userClient = await prisma.users_clients.create({
    data: req.body,
  });
  res.json(userClient);
});

app.get("/user-clients/:id", async (req, res) => {
  const userClient = await prisma.users_clients.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  res.json(userClient);
});

app.put("/user-clients/:id", async (req, res) => {
  const userClient = await prisma.users_clients.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(userClient);
});

app.delete("/user-clients/:id", async (req, res) => {
  const userClient = await prisma.users_clients.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.json(userClient);
});

// CRUD for User Staffs
app.get("/user-staffs", async (req, res) => {
  const userStaffs = await prisma.user_staffs.findMany();
  res.json(userStaffs);
});

app.post("/user-staffs", async (req, res) => {
  const userStaff = await prisma.user_staffs.create({
    data: req.body,
  });
  res.json(userStaff);
});

app.get("/user-staffs/:id", async (req, res) => {
  const userStaff = await prisma.user_staffs.findUnique({
    where: { id: parseInt(req.params.id) },
  });
  res.json(userStaff);
});

app.put("/user-staffs/:id", async (req, res) => {
  const userStaff = await prisma.user_staffs.update({
    where: { id: parseInt(req.params.id) },
    data: req.body,
  });
  res.json(userStaff);
});

app.delete("/user-staffs/:id", async (req, res) => {
  const userStaff = await prisma.user_staffs.delete({
    where: { id: parseInt(req.params.id) },
  });
  res.json(userStaff);
});

app.get("/user/admin/confirm/:userPublicId", async (req, res) => {
  const userPublicId = req.params.userPublicId;

  const userAdmin = await prisma.user_admin.findUnique({
    where: { userPublicId: userPublicId },
  });
  res.json(userAdmin);
})

// Start the server
app.listen(5555, () => {
  console.log('Server is running on http://localhost:3000');
});
