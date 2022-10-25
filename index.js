const express = require('express');
const app = express();
const port = 3000;

let length;

app.use(express.json());
app.use(express.urlencoded({ extended: false }))

var knex = require("knex")({
    client: 'pg',
    connection: {
        host: 'localhost',
        user: 'postgres',
        database: 'user_db',
        password: ']Ma95/Ev43'
    },

    migrations:{
        tableName: "knex_migrations"
    },
    pool: {
        min: 2,
        max: 10
    }
});

app.get('/', function (req, res) {
    res.sendFile(__dirname + "/index.html")
});

app.get('/users', (req, res) => {
    knex('users')
        .select({ id: 'id', name: 'name', email: 'email' }).orderBy('id')
        .then((users) => res.status(200).json(users))
        .catch((err) => {
            console.error(err);
            return res.status(400).json({ success: false, message: 'An error occurred, please try again later.' });
        })
})

app.put("/update/:idUser", async (req, res) => {
    await knex('users')
        .where({ id: req.params.idUser })
        .update({ 
            name: req.body.name, 
            email: req.body.email
        })
    return res.status(200).json({ success: true })
})

app.post("/create", async (req, res) => {
    const length = parseInt((await knex('users').count("id"))[0].count) + 1
    await knex('users').insert({ id: length, name: req.body.name, email: req.body.email })
    res.status(201).json({ name: req.body.name, email: req.body.email })
})

app.delete("/delete/:idUser", async (req, res) => {
    await knex('users').where({ id: req.params.idUser }).del()
    return res.status(200).json({ success: true })
})

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});