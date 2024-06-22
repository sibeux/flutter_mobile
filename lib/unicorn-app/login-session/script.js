const express = require("express");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const app = express();
const port = 3000;

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "pbweb_cashflow",
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log("Connected to database");
});

app.use(bodyParser.json());

// Register a new user
app.post("/register", async (req, res) => {
    const { email, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);

    db.query(
        "INSERT INTO users (email, password) VALUES (?, ?)",
        [email, hashedPassword],
        (err, result) => {
            if (err) {
                res.status(500).json({ message: "Failed to register user" });
                return;
            }
            res.status(200).json({ message: "User registered successfully" });
        }
    );
});

// Login a user
app.post("/login", async (req, res) => {
    const { email, password } = req.body;

    db.query(
        "SELECT * FROM users WHERE email = ?",
        [email],
        async (err, results) => {
            if (err) {
                res.status(500).json({ message: "Failed to login" });
                return;
            }

            if (results.length === 0) {
                res.status(401).json({ message: "email or password is incorrect" });
                return;
            }

            const user = results[0];
            const passwordMatch = await bcrypt.compare(password, user.password);

            if (!passwordMatch) {
                res.status(401).json({ message: "email or password is incorrect" });
                return;
            }

            const token = jwt.sign({ userId: user.id }, "your_secret_key", {
                expiresIn: "1h",
            });
            res.status(200).json({ message: "Login successful", token });
        }
    );
});

// Verify token middleware
const verifyToken = (req, res, next) => {
    const token = req.headers.authorization.split(" ")[1];

    jwt.verify(token, "your_secret_key", (err, decodedToken) => {
        if (err) {
            res.status(401).json({ message: "Unauthorized" });
            return;
        }
        req.userId = decodedToken.userId;
        next();
    });
};

// Example protected route
app.get("/profile", verifyToken, (req, res) => {
    res.status(200).json({ message: "Protected route", userId: req.userId });
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
