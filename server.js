const express = require("express");
const cors = require("cors");
const notesRouter = require("./routes/notes");

const app = express();

const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());

app.use((req, res, next) => {
  if (req.path.includes("/health")) {
    return next();
  }
  const start = Date.now();
  res.on("finish", () => {
    const duration = Date.now() - start;
    console.log(
      `${req.method} ${req.path} ${res.statusCode} ${duration}ms`
    );
  });
  next();
});

app.get("/health", async (req, res) => {
  try {
    await prisma.$queryRaw`SELECT 1`;
    res.json({ status: "ok", database: "connected"});
  } catch(error) {
    res.status(503).json({status: "error", database: "disconnected"})
  }
});

app.use("/notes", notesRouter);

const PORT = process.env.PORT || 3000;

if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
  });
}

module.exports = app;
