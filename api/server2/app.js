const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 4000

const points = {
  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9: 100,
  eyJlbWFpbCI6InBhdEBleGFtcGxlLmNvbSJ9: 200,
  'rr4RIu-hZkeryZRXK7dEwquQn4rVGqZFEmKWwuR_kYs': 300,
}

const tiers = {
  eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9: 'bronze',
  eyJlbWFpbCI6InBhdEBleGFtcGxlLmNvbSJ9: 'silver',
  'rr4RIu-hZkeryZRXK7dEwquQn4rVGqZFEmKWwuR_kYs': 'gold',
}

app.use(bodyParser.json())

app.get('/v1/api/user/point', (req, res) => {
  if (req.headers.authorization == undefined) {
    res.status(401).json({ error: 'Unauthorised' })
    return
  }

  const authToken = req.headers.authorization.split(' ')[1]
  if (authToken === undefined || authToken === '') {
    res.status(400).json({ error: 'Invalid request' })
  } else if (points[authToken] === undefined) {
    res.status(401).json({ error: 'Unauthorised' })
  } else {
    res.setHeader('Authorization', req.headers.authorization)
    res.status(200).json({ point: points[authToken] })
  }
})

app.get('/v1/api/user/tier', (req, res) => {
  if (req.headers.authorization == undefined) {
    res.status(401).json({ error: 'Unauthorised' })
    return
  }

  const authToken = req.headers.authorization.split(' ')[1]
  if (authToken === undefined || authToken === '') {
    res.status(400).json({ error: 'Invalid request' })
  } else if (tiers[authToken] === undefined) {
    res.status(401).json({ error: 'Unauthorised' })
  } else {
    res.setHeader('Authorization', req.headers.authorization)
    res.status(200).json({ tier: tiers[authToken] })
  }
})

var server = app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`)
})
module.exports = server
