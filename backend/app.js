import express from 'express'
import compression from 'compression'
import { router } from './src/api-routes/index.js'
import { redisStore, redisSetAsync, redisGetAsync, redisClient } from './src/services/cache/index.js'
import * as dotenv from 'dotenv'
import cors from 'cors'
import session from "express-session"

dotenv.config()
const port = process.env.PORT || 3001;

export const app = express()
// app.use(bodyParser.urlencoded());
// app.use(bodyParser.json());

app.use(compression())

const corsOptions = {
  origin: '*',
  optionsSuccessStatus: 200 // some legacy browsers (IE11, various SmartTVs) choke on 204
}

app.use(cors())

// Initialize sesssion storage.
app.use(
  session({
    store: redisStore,
    resave: false, // required: force lightweight session keep alive (touch)
    saveUninitialized: false, // recommended: only save session when data exists
    secret: process.env.SESSION_SECRET || 'keyboard cat',
    cookie: {
      secure: false, // if true only transmit cookie over https
      httpOnly: false, // if true prevent client side JS from reading the cookie 
      maxAge: 86500000 // session max age in miliseconds
    }
  })
)



app.use(async (req, res, next) => {
  // await redisClient.connect()
  next();
})


// Use Redis connection pooling in your route handlers
// app.get('/api/v1/set-session', async (req, res) => {
//   await redisSetAsync('user', 'some user data');
//   res.send('Session variable set.');
// });

// app.get('/api/v1/get-session', async (req, res) => {
//   const user = await redisGetAsync('user');
//   res.send(`Session variable value: ${user}`);
// });

app.use('/api/v1', router)


app.listen(port, () => {
  console.log(`I am now listening on port http://localhost:${port}`);
})


